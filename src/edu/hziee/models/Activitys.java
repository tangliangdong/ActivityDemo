package edu.hziee.models;

import java.util.List;

public class Activitys {
    private Integer activityId;
    private String name;
    private Integer userId;
    private Integer startTime;
    private Integer endTime;
    private String place;
    private Integer peopleCount;
    
    private List<User> uList;
    public Integer getId() {
        return activityId;
    }

    public void setId(Integer id) {
        this.activityId = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getStartTime() {
        return startTime;
    }

    public void setStartTime(Integer startTime) {
        this.startTime = startTime;
    }

    public Integer getEndTime() {
        return endTime;
    }

    public void setEndTime(Integer endTime) {
        this.endTime = endTime;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Integer getPeopleCount() {
        return peopleCount;
    }

    public void setPeopleCount(Integer peopleCount) {
        this.peopleCount = peopleCount;
    }

	public List<User> getuList() {
		return uList;
	}

	public void setuList(List<User> uList) {
		this.uList = uList;
	}

	@Override
	public String toString() {
		return "Activitys [activityId=" + activityId + ", name=" + name + ", userId=" + userId + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", place=" + place + ", peopleCount=" + peopleCount + ", uList=" + uList
				+ "]";
	}
    
}