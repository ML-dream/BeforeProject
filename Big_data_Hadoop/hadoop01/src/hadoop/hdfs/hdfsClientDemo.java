package hadoop.hdfs;

import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.junit.Before;
import org.junit.Test;

public class hdfsClientDemo {

	private Configuration conf;
	private FileSystem fs;

	@Before
	public void init() throws Exception {
		conf = new Configuration();
		fs = FileSystem.get(conf);
	}
	
	@Test
	public void testUpLoad() throws IllegalArgumentException, IOException {
		fs.copyFromLocalFile(new Path("G:/20000.txt"), new Path("/"));
	}
	 
	
}
