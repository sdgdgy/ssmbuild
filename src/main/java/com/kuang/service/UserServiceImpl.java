package com.kuang.service;

import com.kuang.dao.UserMapper;
import com.kuang.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
    public User queryUserById(String id) {
        return userMapper.queryUserById(id);
    }

    public User queryUser(User user) {
        return userMapper.queryUser(user);
    }

    public int addUesr(User user) {
        userMapper.addUesr(user);
        return 0;
    }
}
