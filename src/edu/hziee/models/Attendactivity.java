package edu.hziee.models;

import java.util.List;

public class Attendactivity {
    private Integer activityId;

    private Integer userId;
    
    public Attendactivity(){}
    
    public Attendactivity(Integer activityId, Integer userId) {
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

	@Override
	public String toString() {
		return "Attendactivity [activityId=" + activityId + ", userId=" + userId + "]";
	}
    
}