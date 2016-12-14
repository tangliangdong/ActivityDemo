package edu.hziee.models;

import java.util.List;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String showname;

    private Integer power;
    
    private List<Activitys> aList;
    
    public User(){}
    
	public User(String username, String password, String showname, Integer power) {
		super();
		this.username = username;
		this.password = password;
		this.showname = showname;
		this.power = power;
	}
	public List<Activitys> getaList() {
		return aList;
	}
	public void setaList(List<Activitys> aList) {
		this.aList = aList;
	}
	public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getShowname() {
        return showname;
    }
    public void setShowname(String showname) {
        this.showname = showname;
    }
    public Integer getPower() {
        return power;
    }
    public void setPower(Integer power) {
        this.power = power;
    }
    
    @Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", showname=" + showname
				+ ", power=" + power + ", aList=" + aList + "]";
	}
}