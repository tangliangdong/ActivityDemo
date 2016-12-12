package edu.hziee.services;

import javax.imageio.spi.RegisterableService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.hziee.mappers.UserMapper;
import edu.hziee.models.User;
import edu.hziee.util.MD5String;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	public User selectByUsername(String username){
		return userMapper.selectByUsername(username);
	}
	public int insert(User user){
		return userMapper.insert(user);
	}
	
	/**
	 * 
	 * @param user
	 * @return
	 * 账户不存在：-1，密码错误：1，登录成功：0
	 */
	public User checkLogin(User user){
		User user1 = userMapper.selectByUsername(user.getUsername());
		if(user1 != null){
			String password = MD5String.getMD5Str(user.getPassword());
			if(user1.getPassword().equals(password)){
				user.setShowname(user1.getShowname());
				user.setId(user1.getId());
				return user;
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
	/**
	 * 
	 * @param user
	 * @return
	 * 账号已存在：-1,插入成功：0
	 */
	public int register(User user){
		System.out.println(user.getUsername());
		if( selectByUsername(user.getUsername())== null){
			System.out.println(insert(user));
			return 0;
		}else {
			return -1;
		}
		
	}
}