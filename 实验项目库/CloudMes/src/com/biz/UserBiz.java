package com.biz;

import com.entity.User;

public interface UserBiz {
	//�û���¼�����ؾ��ǵ�¼�û�����Ϣ
	public User login(User user);
	//ע���û�
	public int registerUser(User user);

}
