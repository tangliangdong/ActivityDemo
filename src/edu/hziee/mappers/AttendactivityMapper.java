package edu.hziee.mappers;

import edu.hziee.models.Activitys;
import edu.hziee.models.Attendactivity;
import edu.hziee.models.AttendactivityExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AttendactivityMapper {
    long countByExample(AttendactivityExample example);

    int deleteByExample(AttendactivityExample example);

    int insert(Attendactivity record);

    int insertSelective(Attendactivity record);

    List<Attendactivity> selectByExample(AttendactivityExample example);
    
//    List<Attendactivity> selectByUserId(@Param("userId") int userId);
    
    Attendactivity selectByUserIdAndActivityId(@Param("userId") int userId,@Param("activityId") int activityId);

    int updateByExampleSelective(@Param("record") Attendactivity record, @Param("example") AttendactivityExample example);

    int updateByExample(@Param("record") Attendactivity record, @Param("example") AttendactivityExample example);

    int delete(Attendactivity a);
    
    int deleteByActivityId(int activityId);
    
    
}