package com.xingguo.dao;

import com.xingguo.domain.Chapter;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChapterDao {
    /**
     *findAllChapterById:用于根据书的id，来查找所有章节
     */
    @Select("select * from chapter where id=#{id} order by orders;")
    List<Chapter> findAllChapterById(Integer id);
    @Select("select * from chapter where id=#{id} and orders=#{orders};")
    Chapter findChapterById(@Param("id") Integer id, @Param("orders") Integer orders);
}
