package edu.hziee.mappers;

import edu.hziee.models.Activitys;
import edu.hziee.models.ActivitysExample;
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
    
    List<Activitys> select();

    int updateByExampleSelective(@Param("record") Activitys record, @Param("example") ActivitysExample example);

    int updateByExample(@Param("record") Activitys record, @Param("example") ActivitysExample example);

    int updateByPrimaryKeySelective(Activitys record);

    int updateByPrimaryKey(Activitys record);
}