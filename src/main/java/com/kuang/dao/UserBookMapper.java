package com.kuang.dao;

import com.kuang.pojo.UserBook;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserBookMapper {
    int addUserBook(UserBook userBook);
    int deleteUserBook(UserBook userBook);
    int updateUserBook(UserBook userBook);
    List<UserBook> queryAllUserBook();
    List<UserBook> queryAllUserBookById(@Param("id")String id);
    List<UserBook> queryAllUserBookByIdByName(UserBook userBook);
}
