package com.kuang.service;

import com.kuang.pojo.UserBook;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookUserService {
    int addUserBook(UserBook userBook);
    int deleteUserBook(UserBook userBook);
    int updateUserBook(UserBook userBook);
    List<UserBook> queryAllUserBook();
    List<UserBook> queryAllUserBookById(String id);
    List<UserBook> queryAllUserBookByIdByName(UserBook userBook);
}
