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
	
	public int updatePowerByUserId(int userId,int power){
		return userMapper.updatePowerByUserId(userId,power);
	}
	
	public List<Activitys> select(){
		return activitysMapper.selectByPass(1);
	}
	
	public List<Activitys> selectActivity(){
		return activitysMapper.selectByPassAndPower(0, 1);
	}
	public List<Activitys> selectNoPassActivity(){
		return activitysMapper.selectByPass(2);
	}
	public List<Activitys> selectActivityByUserId(int userId){
		return activitysMapper.selectByUserId(userId);
	}
	public List<Activitys> selectDeleteActivity(){
		return activitysMapper.selectByPass(-1);
	}
	
	public int updatePass(int activityId,int pass){
		return activitysMapper.updatePass(activityId, pass);
	}
}
