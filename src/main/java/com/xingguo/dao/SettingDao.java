package com.xingguo.dao;

import com.xingguo.domain.Setting;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface SettingDao {
    @Select("select * from setting where id=#{id};")
    Setting findById(Integer id);
    @Insert("insert into setting values(#{setting.id},#{setting.theme},#{setting.fontfamily},#{setting.fontsize});")
    Integer insertSetting(@Param("setting")Setting setting);
    @Update("update setting set theme=#{theme} where id=#{id}")
    void updateTheme(@Param("id") int id,@Param("theme") String theme);
    @Update("update setting set fontfamily=#{fontfamily} where id=#{id}")
    void updateFontFamily(@Param("id") int id,@Param("fontfamily") String fontfamily);
    @Update("update setting set fontsize=#{fontsize} where id=#{id}")
    void updateFontSize(@Param("id") int id,@Param("fontsize") int fontsize);
}
