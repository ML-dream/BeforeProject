package cn.itcast.bigdata.hdfs;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;
import java.util.Iterator;
import java.util.Map.Entry;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.BlockLocation;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.LocatedFileStatus;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.fs.RemoteIterator;
import org.junit.Before;
import org.junit.Test;
/**
 * 
 * 客户端去操作hdfs时，是有一个用户身份的
 * 默认情况下，hdfs客户端api会从jvm中获取一个参数来作为自己的用户身份：-DHADOOP_USER_NAME=hadoop
 * 
 * 也可以在构造客户端fs对象时，通过参数传递进去
 * @author
 *
 */
public class HdfsClientDemo {
	FileSystem fs = null;
	Configuration conf = null;
	@Before
	public void init() throws Exception{
		
		conf = new Configuration();
//		conf.set("fs.defaultFS", "hdfs://mini1:9000");
		conf.set("dfs.replication", "5");
		
		//拿到一个文件系统操作的客户端实例对象
		fs = FileSystem.get(conf);
		//可以直接传入 uri和用户身份
		fs = FileSystem.get(new URI("hdfs://centos1:9000"),conf,"hadoop");
	}

	/**
	 * 上传文件
	 * @throws Exception
	 */
	@Test
	public void testUpload() throws Exception {
		
		fs.copyFromLocalFile(new Path("G:/hadoopSpace/angelababy.love"), new Path("/access.log.copy"));
		fs.close();
	}
	
	
	/**
	 * 下载文件
	 * @throws Exception
	 */
	@Test
	public void testDownload() throws Exception {
		
		fs.copyToLocalFile(new Path("/access.log.copy"), new Path("d:/"));
	}
	
	
	/**
	 * 打印参数
	 */
	@Test
	public void testConf(){
		
		Iterator<Entry<String, String>> it = conf.iterator();
		while(it.hasNext()){
			Entry<String, String> ent = it.next();
			System.out.println(ent.getKey() + " : " + ent.getValue());
			
		}
		
	}
	
	
	@Test
	public void testMkdir() throws Exception {
		boolean mkdirs = fs.mkdirs(new Path("/testmkdir/hhhsss"));
		System.out.println(mkdirs);
		
	}
	
	
	@Test
	public void testDelete() throws Exception {
		
		boolean flag = fs.delete(new Path("/testmkdir/aaa"), true);
		System.out.println(flag);
		
	}
	
	
	/**
	 * 递归列出指定目录下所有子文件夹中的文件
	 * @throws Exception
	 */
	@Test
	public void testLs() throws Exception {
		
		RemoteIterator<LocatedFileStatus> listFiles = fs.listFiles(new Path("/"), true);
		
		while(listFiles.hasNext()){
			LocatedFileStatus fileStatus = listFiles.next();
			System.out.println("blocksize: " +fileStatus.getBlockSize());
			System.out.println("owner: " +fileStatus.getOwner());
			System.out.println("Replication: " +fileStatus.getReplication());
			System.out.println("Permission: " +fileStatus.getPermission());
			System.out.println("Name: " +fileStatus.getPath().getName());
			System.out.println("------------------");
			BlockLocation[] blockLocations = fileStatus.getBlockLocations();
			for(BlockLocation b:blockLocations){
				System.out.println("块起始偏移量: " +b.getOffset());
				System.out.println("块长度:" + b.getLength());
				//块所在的datanode节点
				String[] datanodes = b.getHosts();
				for(String dn:datanodes){
				System.out.println("datanode:" + dn);
				}
			}
			
			
			
		}
		
	}
	
	
	
	@Test
	public void testLs2() throws Exception {
		
		FileStatus[] listStatus = fs.listStatus(new Path("/"));
		for(FileStatus file :listStatus){
			
			System.out.println("name: " + file.getPath().getName());
			System.out.println((file.isFile()?"file":"directory"));
			
		}
		
	}
	
	
	
	
	public static void main(String[] args) throws Exception {
		Configuration conf = new Configuration();
		conf.set("fs.defaultFS", "hdfs://centos1:9000");
		//拿到一个文件系统操作的客户端实例对象
		FileSystem fs = FileSystem.get(conf);
		
		fs.copyFromLocalFile(new Path("G:/hadoopSpace/angelababy.love"), new Path("/access.log.copy2"));
		fs.close();
	}
	

	
	
	
}
