package edu.hziee.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.zlzkj.core.util.Fn;

import edu.hziee.mappers.ActivitysMapper;
import edu.hziee.models.Activitys;

@Repository
@Transactional
public class ActivityService {
	
	@Autowired
	private ActivitysMapper activitysMapper;

    public List<Activitys> selectActivitys(){
    	return activitysMapper.select();
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
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM" );
		java.util.Date date1 = sdf.parse(str1);
		int timechuo = Integer.parseInt(String.valueOf(date1.getTime()).toString().substring(0,10));
		System.out.println(timechuo);
		return timechuo;
	}
}
