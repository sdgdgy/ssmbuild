package com.kuang.service;


import com.kuang.dao.UserBookMapper;
import com.kuang.pojo.UserBook;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BookUserServiceImpl implements BookUserService {
    @Autowired
    private UserBookMapper userBookMapper;

    public void setUserBookMapper(UserBookMapper userBookMapper) {
        this.userBookMapper = userBookMapper;
    }

    public int addUserBook(UserBook userBook) {
        userBookMapper.addUserBook(userBook);
        return 0;
    }

    public int deleteUserBook(UserBook userBook) {
        userBookMapper.deleteUserBook(userBook);
        return 0;
    }

    public int updateUserBook(UserBook userBook) {
        userBookMapper.updateUserBook(userBook);
        return 0;
    }

    public List<UserBook> queryAllUserBook() {
        return userBookMapper.queryAllUserBook();
    }

    public List<UserBook> queryAllUserBookById(String id) {
        return userBookMapper.queryAllUserBookById(id);
    }

    public List<UserBook> queryAllUserBookByIdByName(UserBook userBook) {
        return userBookMapper.queryAllUserBookByIdByName(userBook);
    }
}
