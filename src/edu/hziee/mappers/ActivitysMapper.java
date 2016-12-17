package edu.hziee.mappers;

import edu.hziee.models.Activitys;
import edu.hziee.models.ActivitysExample;
import edu.hziee.models.User;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ActivitysMapper {
    long countByExample(ActivitysExample example);

    int deleteByExample(ActivitysExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Activitys record);

    int insertSelective(Activitys record);

    List<Activitys> selectByExample(ActivitysExample example);

    Activitys selectByPrimaryKey(Integer id);
    
    List<Activitys> selectByPass(@Param("pass") int pass);
    
    List<Activitys> selectByUserId(@Param("userId") int userId);
    
    List<Activitys> selectAttendActivityByUserId(@Param("userId") int userId);

    List<Activitys> selectCollectActivityByUserId(@Param("userId") int userId);
    
    List<Activitys> selectPublicActivityByUserId(@Param("userId") int userId);
    
    List<Activitys> selectWaitCheckActivityByUserId(@Param("userId") int userId);
    
    /*List<Activitys> selectWaitCheckActivity();
    
    List<Activitys> selectNoCheckActivity();*/
    
    int updatePass(@Param("activityId") int activityId,@Param("pass") int pass);
    
    int updateByExampleSelective(@Param("record") Activitys record, @Param("example") ActivitysExample example);

    int updateByExample(@Param("record") Activitys record, @Param("example") ActivitysExample example);

    int updateByPrimaryKeySelective(Activitys record);

    int updateByPrimaryKey(Activitys record);
}