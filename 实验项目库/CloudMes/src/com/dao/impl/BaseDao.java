package com.dao.impl;


import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Field;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSetMetaData;

/**
 *�����ݿ⽨������
 *�������ݿ����Ӷ���
 */


public class BaseDao {
	private static final String Driver="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://127.0.0.1/user";
	
	public Connection getConn() {
		Connection conn=null;
		try {
			Class.forName(Driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			DriverManager.getConnection(URL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * �ͷ���Ӧ����Դ
	 * @param rs
	 *@param pstmt
	 *@param conn
	 */
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection conn) {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * �˷������������ɾ�����еĲ���
	 * @param sql
	 *@param params
	 *@return true ��false
	 */
	public boolean operUpdate(String sql,List<Object> params) {
		int res=0;//Ӱ�������
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConn();
			pstmt=(PreparedStatement) conn.prepareStatement(sql);//װ��sql���
			if(params!=null) {
				//�����У���ִ��֮ǰ�ɣ�ռλ���滻��
				for(int i=0;i<params.size();i++) {
					pstmt.setObject(i+1, params.get(i));
				}
			}
			res=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeAll(rs,pstmt,conn);
		}
		return res>0? true:false;
	}
	/**
	 * 
	 * 
	 * @param sql
	 * @param params
	 * @param cls
	 * @return
	 */
	public <T> List<T> operQuery(String sql,List<Object> params,Class<T> cls)throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<T> data=new ArrayList<T>();
		try {
			conn=getConn();
			pstmt=(PreparedStatement) conn.prepareStatement(sql);//װ��sql���
			if(params!=null) {
				//�����У���ִ��֮ǰ�ɣ�ռλ���滻��
				for(int i=0;i<params.size();i++) {
					pstmt.setObject(i+1, params.get(i));
				}
			}
			rs=pstmt.executeQuery();
			//�Ѳ�ѯ�����ļ�¼��װ�ɶ�Ӧ��ʵ�������
			ResultSetMetaData rsd=(ResultSetMetaData) rs.getMetaData();//�õ���¼��Ԫ���ݶ���
			//ͨ���˶�����Եõ������ݵĽṹ���������������еĸ������е���������
			while(rs.next()) {
				T m=cls.newInstance();
				for(int i=0;i<rsd.getColumnCount();i++) {
					String col_name=rsd.getColumnName(i+1);//�������
					Object value=rs.getObject(col_name);//���������Ӧ��ֵ
					java.lang.reflect.Field field=cls.getDeclaredField(col_name);
					field.setAccessible(true);//��˽���������ÿɷ���Ȩ
					field.set(m, value);//�������˽�����Ը�ֵ
				}
				data.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeAll(rs,pstmt,conn);
		}
		return data;
	}

}
