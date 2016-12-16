package edu.hziee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.hziee.mappers.UserMapper;
import edu.hziee.models.User;

@Repository
@Transactional
public class AdminService {

	@Autowired
	private UserMapper userMapper;
	
	public List<User> selectUser(){
		return userMapper.selectUser();
	}
}
