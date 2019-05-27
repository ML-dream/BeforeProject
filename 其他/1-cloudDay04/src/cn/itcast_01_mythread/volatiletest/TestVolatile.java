package cn.itcast_01_mythread.volatiletest;
/**
 * 主线程
 * @author auduser
 *
 */
public class TestVolatile {

	public static void main(String[] args) throws Exception {
		repo re = new repo();
		for (int i = 0; i < 100; i++) {

			new Thread(new RunTest(re)).start();
		}
		
		Thread.sleep(200);
		System.out.println(re.numb);
	}

}

/**
 * 资源类
 * 
 */
class repo {
	
	
  static volatile	int numb = 0;
	
	static synchronized void add() {
		
		numb++;
	}
	
}


/**
 * 消费者
 * @author auduser
 *
 */

class RunTest implements Runnable{
	repo reposs=null;
	RunTest(repo repos){
		this.reposs=repos;
	}
	
		// TODO Auto-generated method stub
		public  void run(){
			
				//for (int i = 0; i < 100; i++) {
					reposs.add();
				
					
				//}
		}
}
