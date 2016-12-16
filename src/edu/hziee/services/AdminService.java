package edu.hziee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.hziee.mappers.ActivitysMapper;
import edu.hziee.mappers.UserMapper;
import edu.hziee.models.Activitys;
import edu.hziee.models.User;

@Repository
@Transactional
public class AdminService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private ActivitysMapper activitysMapper;
	
	public List<User> selectUser(){
		return userMapper.selectUser();
	}
	
	public List<Activitys> select(){
		return activitysMapper.select();
	}
	
	public List<Activitys> selectActivity(){
		return activitysMapper.selectWaitCheckActivity();
	}
	
	public int updatePass(int activityId,int pass){
		return activitysMapper.updatePass(activityId, pass);
	}
}
