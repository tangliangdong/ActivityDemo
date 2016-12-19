package edu.hziee.services;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.zlzkj.core.util.Fn;

import edu.hziee.mappers.ActivitysMapper;
import edu.hziee.mappers.AttendactivityMapper;
import edu.hziee.models.Activitys;
import edu.hziee.models.Attendactivity;
import edu.hziee.models.User;

@Repository
@Transactional
public class ActivityService {
	
	@Autowired
	private ActivitysMapper activitysMapper;
	
	@Autowired
	private AttendactivityMapper attendMapper;

    public List<Activitys> selectActivitys(){
    	return activitysMapper.selectByPass(1);
    }
    
    public List<Activitys> selectByPassAndPower(int pass,int power){
    	return activitysMapper.selectByPassAndPower(pass,power);
    }
    
    public List<Activitys> selectByPassAndPowerAndUserId(int pass,int power,int userId){
    	return activitysMapper.selectByPassAndPowerAndUserId(pass, power, userId);
    }
    public List<Activitys> selectAttendActivityByUserId(int userId){
		return activitysMapper.selectAttendActivityByUserId(userId);
	}
    
    public List<Activitys> selectCollectActivityByUserId(@Param("userId") int userId){
    	return activitysMapper.selectCollectActivityByUserId(userId);
    }
    
    public List<Activitys> selectPublicActivityByUserId(@Param("userId") int userId){
    	return activitysMapper.selectPublicActivityByUserId(userId);
    }
    
    public List<Activitys> selectWaitCheckActivityByUserId(@Param("userId") int userId){
    	return activitysMapper.selectWaitCheckActivityByUserId(userId);
    }
    
    public List<Activitys> DateFormat(List<Activitys> list){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");
    	for (Activitys activity : list) {
			//activity.setStartTime(sdf.format(activity.getStartTime()));
		}
    	return list;
    }
    
	public int insertActivity(int userId,String name, String place, int count, 
					int startTime, int endTime) {
		Activitys activity = new Activitys();
		activity.setName(name);
		activity.setPlace(place);
		activity.setStartTime(startTime);
		activity.setEndTime(endTime);
		activity.setPeopleCount(count);
		activity.setUserId(userId);
		return activitysMapper.insert(activity);
	}
	
	public Activitys selectByPrimaryKey(Integer id){
		return activitysMapper.selectByPrimaryKey(id);
	}
	
	public int DateToLong(String date) throws ParseException{
		char[] s = date.toCharArray();
		String str1 = "";
		for(char w : s){
			str1 += w;
		}
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm" );
		java.util.Date date1 = sdf.parse(str1);
		int timechuo = Integer.parseInt(String.valueOf(date1.getTime()).toString().substring(0,10));
		return timechuo;
	}
	
	public String longToDate(Long timechuo) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm" );
		String d = sdf.format(timechuo);
		return d;
	}
	
	public int updateActivityById(int activityId,int pass){
		return activitysMapper.updatePass(activityId, pass);
	}
	
	
	
	public int delete(int id){
		return activitysMapper.deleteByPrimaryKey(id);
	}
}
