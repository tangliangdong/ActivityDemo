package edu.hziee.mappers;

import edu.hziee.models.User;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);
    
    User selectByUsername(String username);
    
    User selectAttendActivtitysByUserId(@Param("userId") int userId);
    
    List<User> selectUser();
    
    User selectAdmin(String username);
    
    int updatePowerByUserId(@Param("userId")int userId,@Param("power") int power);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
}