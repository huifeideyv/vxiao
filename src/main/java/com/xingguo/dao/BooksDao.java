package com.xingguo.dao;

import com.xingguo.domain.Books;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BooksDao {
    /**
     * findMaxHot:发现热度最高的10本书，输出在主页
     */
    @Select("select * from books  order by hot desc limit 10;")
    List<Books> findMaxHot();
    @Select("select * from books where book_id=#{id}")
    Books findById(Integer id);

    @Select("select count(*) from books where kind=#{kind}")
    Integer findCount(String kind);

    @Select("select * from books where book_name like concat('%', #{book_name}, '%') or author like concat('%', #{book_name}, '%');")
    List<Books> findByName_(String book_name);

}
