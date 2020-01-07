package com.kuang.dao;

import com.kuang.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    //增加一本书
    int addBook(Books books);
    //删除一本书
    int deleteBookById(@Param("id")int id);
    //修改一本书
    int updateBook(Books books);
    //查询一本书
    Books queryBookById(@Param("id")int id);
    //查询所有书
    List<Books> queryAllBook();
    //用名字查询一本书
    List<Books> queryBookByName(@Param("name")String name);

    int updateBookCount(@Param("bookid")int bookid,@Param("bookcount") int bookcount);
}
