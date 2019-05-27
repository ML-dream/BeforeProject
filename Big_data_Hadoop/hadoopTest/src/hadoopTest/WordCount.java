package hadoopTest;

import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class WordCount
{
    public static class Map extends Mapper<LongWritable, Text, Text, IntWritable>
    {
        private final static IntWritable one = new IntWritable(1);
        private Text word = new Text();

        public void map(LongWritable key, Text value, Context context)
        {
            StringTokenizer tokenizer = new StringTokenizer(value.toString());
            while (tokenizer.hasMoreTokens())
            {
            	try {
					Thread.sleep(1000);
				} catch (InterruptedException e1) {
				// TODO Auto-generated catch block
					e1.printStackTrace();
				}
            	word.set(tokenizer.nextToken());
                try
                {
                    context.write(word, one);
                }
                catch (IOException | InterruptedException e)
                {
                    e.printStackTrace();
                }
            }
        }
    }
//内存中会存在所有的信息，用于快速服务
    public static class Reduce extends Reducer<Text, IntWritable, Text, IntWritable>
    {
        private IntWritable result = new IntWritable();

        public void reduce(Text key, Iterable<IntWritable> values, Context context)
        {
            int sum = 0;
            for (IntWritable val : values)
            {
                sum += val.get();
            }
            result.set(sum);
            try
            {
                context.write(key, result);
            }
            catch (IOException | InterruptedException e)
            {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args)
    {
        Configuration conf = new Configuration();

        Job job = null;
        try
        {
            job = Job.getInstance(conf);
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        job.setJarByClass(WordCount.class);

        job.setMapperClass(Map.class);
        job.setReducerClass(Reduce.class);

        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);

        try
        {
//            FileInputFormat.addInputPath(job, new Path("G:/20000.txt"));//�����ڱ���
//            FileOutputFormat.setOutputPath(job, new Path("F:/data/output/o1"));//����ڱ���
          FileInputFormat.setInputPaths(job, new Path("hdfs://centos1:9000/wordcount/input/wordcount.txt"));
        FileOutputFormat.setOutputPath(job, new Path("hdfs://centos1:9000/wordcount/output.txt"));
            //���������hdfs��
//          FileInputFormat.addInputPath(job, new Path("F:/data/input/input.txt"));//�����ڱ���
//          FileOutputFormat.setOutputPath(job, new Path("hdfs://192.168.237.147:8020/user/guixiaolin/output/o1"));//�����hdfs

        }
        catch (IllegalArgumentException | IOException e)
        {
            e.printStackTrace();
        }

        try
        {
            job.submit();
        }
        catch (ClassNotFoundException | IOException | InterruptedException e)
        {
            e.printStackTrace();
        }
    }
}
