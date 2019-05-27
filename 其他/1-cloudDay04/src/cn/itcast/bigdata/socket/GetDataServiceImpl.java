package cn.itcast.bigdata.socket;

public class GetDataServiceImpl implements proxyInterface {
	
	public String getData(String param){
		
		return "ok-"+param;
	}

	@Override
	public String getString(String param) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	

}
