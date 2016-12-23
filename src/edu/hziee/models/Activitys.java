package edu.hziee.models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

public class Activitys {
    private Integer activityId;
    private String name;
    private Integer userId;
    private long startTime;
    private long endTime;
    private String place;
    private Integer peopleCount;
    private int pass;
    
//    public String start;
//    public String end;
    
    private List<User> uList;
    
    public Integer getActivityId() {
		return activityId;
	}

	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}

	public int getPass() {
		return pass;
	}

	public void setPass(int pass) {
		this.pass = pass;
	}

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

    public long getStartTime() {
        return startTime;
    }

    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }

    public long getEndTime() {
        return endTime;
    }

    public void setEndTime(long endTime) {
        this.endTime = endTime;
    }
    
    public String getDateStartTime(){
    	try {
			return longToDate(this.startTime);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
    
    public String getDateEndTime(){
    	try {
			return longToDate(this.endTime);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
    
    public String longToDate(Long timechuo) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm" );
		String d = sdf.format(timechuo*1000);
		return d;
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
		return "Activitys [activityId=" + activityId + ", name=" + name + ", userId=" + userId + ", startTime="
				+ startTime + ", endTime=" + endTime + ", place=" + place + ", peopleCount=" + peopleCount + ", pass="
				+ pass + ", uList=" + uList + "]";
	}

}