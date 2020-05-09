package com.jy.service.user;

import com.jy.model.user.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    void insertUser(User user);

    List<User> selectUserList(User user);

    Map<String,Object> login(User user);
}

