package com.tools;
//
//import org.apache.commons.codec.digest.DigestUtils;
//
///**
// * MD5生成工具
// * @author Flair
// * @version   1.0
// * @date  2015.11.11
// * */
//public class MD5 {
//private MD5(){}
//    
//    /**
//     * MD5加密
//     * @param data 待加密数�?
//     * @return byte[] 消息摘要
//     * @throws Exception
//     */
//    public static byte[] encodeMD5(String data)
//        throws Exception
//    {
//        // 执行消息摘要
//        return DigestUtils.md5(data);
//    }
//    
//    /**
//     * MD5加密
//     * @param data 待加密数�?
//     * @return byte[] 消息摘要
//     * @throws Exception
//     */
//    public static String encodeMD5Hex(String data)
//        throws Exception
//    {
//        // 执行消息摘要
//        return DigestUtils.md5Hex(data);
//    }
//    
//    public static void main(String[] args)
//        throws Exception
//    {
//        String str = "123456";
//        // 获得摘要信息
//        String data1 = MD5.encodeMD5Hex(str);
//        String data2 = MD5.encodeMD5Hex(str);
//        System.err.println("原文：\t" + str);
//        System.err.println("MD5Hex-1：\t" + data1);
//        System.err.println("MD5Hex-2：\t" + data2);
//    }
//}

import java.security.*;

public class MD5 {
	public final static String MD5Convert(String s){
		char hexDigits[] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
		try {
			byte[] strTemp = s.getBytes();
			MessageDigest mdTemp = MessageDigest.getInstance("MD5");
			mdTemp.update(strTemp);
			byte[] md = mdTemp.digest();
			int j = md.length;
			char str[] = new char[j*2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4&0xf];
				str[k++] = hexDigits[byte0&0xf];
				
			}
			return new String(str);
		} catch (Exception e) {
			return null;
		}		
	}
//	public static void main(String [] args){
//		System.out.println(MD5.MD5Convert("wanglu"));
//	}
}
