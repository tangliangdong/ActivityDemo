package edu.hziee.models;

import java.util.List;

public class CollectactivityKey {
    private Integer activityId;

    private Integer userId;
    
    private List<User> uList;
    
    public CollectactivityKey(){}
    
    public CollectactivityKey(Integer activityId, Integer userId) {
		super();
		this.activityId = activityId;
		this.userId = userId;
	}
	public Integer getActivityId() {
        return activityId;
    }
    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }
    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
	public List<User> getuList() {
		return uList;
	}
	public void setuList(List<User> uList) {
		this.uList = uList;
	}
	@Override
	public String toString() {
		return "CollectactivityKey [activityId=" + activityId + ", userId=" + userId + ", uList=" + uList + "]";
	}
}