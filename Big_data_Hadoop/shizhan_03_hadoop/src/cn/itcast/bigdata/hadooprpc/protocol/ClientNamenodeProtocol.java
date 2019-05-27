package cn.itcast.bigdata.hadooprpc.protocol;

public interface ClientNamenodeProtocol {
	public static final long versionID=1L; //会读取这个版本号， 但可以和客户端的不一样， 没有校验
	public String getMetaData(String path);
}
