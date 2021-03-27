package com.xingguo.dao;

import com.xingguo.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    /**
     * findByUserName:通过用户名查找用户信息
     *insertUser:插入用户信息
     * updateEndDate:更新最新登录时间
     * @param user
     * @return
     */
    @Select("select * from user where username=#{user.username}")
    List<User> findByUserName(@Param("user")User user);
    @Insert("insert into user(username,passwd,startdate,enddate)values(#{user.username},#{user.passwd},#{user.startdate},#{user.enddate})")
    Integer insertUser(@Param("user")User user);
    @Update("update user set enddate=#{user.enddate} where id=#{user.id}")
    Integer updateEndDate(@Param("user")User user);

    @Select("select * from user limit #{page},#{limit}")
    List<User> SelectLimit(@Param("page") Integer page,@Param("limit") Integer limit);

    @Delete("delete from user where id=#{id}")
    Integer deleteUser(Integer id);

}
