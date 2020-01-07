package com.kuang.service;

import com.kuang.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserService {
    User queryUserById(String id);
    User queryUser(User user);
    int addUesr(User user);
}
