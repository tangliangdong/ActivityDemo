package edu.hziee.services;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.hziee.mappers.CollectactivityMapper;
import edu.hziee.models.CollectactivityKey;

@Repository
@Transactional
public class CollectService {

	@Autowired
	private CollectactivityMapper collectMapper;
	
	public CollectactivityKey selectByUserIdAndActivityId(int userId,int activityId){
		return collectMapper.selectByUserIdAndActivityId(userId, activityId);
	}
	public int collect(CollectactivityKey c){
		return collectMapper.insert(c);
	}
	public int cancelCollect(CollectactivityKey c){
		return collectMapper.deleteByPrimaryKey(c);
	}
	public int delete(CollectactivityKey c){
		return collectMapper.delete(c);
	}
	
	public int deleteByActivityId(int activityId){
		return collectMapper.deleteByActivityId(activityId);
	}
	
}
