/**
 * 项目名称: javaTest
 * 创建日期�?2016-7-26
 * 修改历史�?
 *		1.[2016-7-26]创建文件 by Flair
 */
package com.tools;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
* @ClassName: JdbcUtilsC3P0
* @Description: 数据库连接工具类
* @author: Flair
* @date: 2016-07-26 下午04:40:36
*
*/ 
public class JdbcUtilsC3P0 {
    
    private static ComboPooledDataSource ds = null;
    //在静态代码块中创建数据库连接�?
    static{
        try{
            //通过代码创建C3P0数据库连接池
            /*ds = new ComboPooledDataSource();
            ds.setDriverClass("com.mysql.jdbc.Driver");
            ds.setJdbcUrl("jdbc:mysql://localhost:3306/jdbcstudy");
            ds.setUser("root");
            ds.setPassword("XDP");
            ds.setInitialPoolSize(10);
            ds.setMinPoolSize(5);
            ds.setMaxPoolSize(20);*/
            
            //通过读取C3P0的xml配置文件创建数据源，C3P0的xml配置文件c3p0-config.xml必须放在src目录�?
            //ds = new ComboPooledDataSource();//使用C3P0的默认配置来创建数据�?
            ds = new ComboPooledDataSource("ORACLE");//使用C3P0的命名配置来创建数据�?
            
        }catch (Exception e) {
            throw new ExceptionInInitializerError(e);
        }
    }
    
    /**
    * @Method: getConnection
    * @Description: 从数据源中获取数据库连接
    * @Anthor:Flair
    * @return Connection
    * @throws SQLException
    */ 
    public static Connection getConnection() throws SQLException{
        //从数据源中获取数据库连接
        return ds.getConnection();
    }
    
    /**
    * @Method: release
    * @Description: 释放资源�?
    * 释放的资源包括Connection数据库连接对象，负责执行SQL命令的Statement对象，存储查询结果的ResultSet对象
    * @Anthor:Flair
    *
    * @param conn
    * @param st
    * @param rs
    */ 
    public static void release(Connection conn,Statement st,ResultSet rs){
        if(rs!=null){
            try{
                //关闭存储查询结果的ResultSet对象
                rs.close();
            }catch (Exception e) {
                e.printStackTrace();
            }
            rs = null;
        }
        if(st!=null){
            try{
                //关闭负责执行SQL命令的Statement对象
                st.close();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        if(conn!=null){
            try{
                //将Connection连接对象还给数据库连接池
                conn.close();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}