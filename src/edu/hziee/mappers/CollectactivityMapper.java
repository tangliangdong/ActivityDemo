package edu.hziee.mappers;

import edu.hziee.models.CollectactivityExample;
import edu.hziee.models.CollectactivityKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollectactivityMapper {
    long countByExample(CollectactivityExample example);

    int deleteByExample(CollectactivityExample example);

    int deleteByPrimaryKey(CollectactivityKey key);

    int insert(CollectactivityKey record);

    int insertSelective(CollectactivityKey record);

    List<CollectactivityKey> selectByExample(CollectactivityExample example);

    int updateByExampleSelective(@Param("record") CollectactivityKey record, @Param("example") CollectactivityExample example);

    int updateByExample(@Param("record") CollectactivityKey record, @Param("example") CollectactivityExample example);

    int delete(CollectactivityKey c);
    
    int deleteByActivityId(int activityId);
    
    CollectactivityKey selectByUserIdAndActivityId(@Param("userId") int userId,@Param("activityId") int activityId);
}