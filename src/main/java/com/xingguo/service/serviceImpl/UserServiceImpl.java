package com.xingguo.service.serviceImpl;

import com.xingguo.dao.UserDao;
import com.xingguo.domain.User;
import com.xingguo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service("UserService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Override
    public String loginUser(User user){
        List<User> list=userDao.findByUserName(user);
        if(list.size()!=0){//用户存在
            if(!user.getPasswd().equals(list.get(0).getPasswd()))
                return "0";
            if(user.getUsername().equals("会飞的鱼")&&user.getPasswd().equals("123456"))
                return "1";
            user.setId(list.get(0).getId());
            user.setStartdate(list.get(0).getStartdate());
            userDao.updateEndDate(user);
            return "2";//进入用户登录界面
        }else{//用户不存在
            return "0";
        }
    }


    @Override
    public String registerUser(User user) {
        List<User> list=userDao.findByUserName(user);
        if(list.size()!=0){
            //System.out.println("用户已经存在"+list);
            return "0";
        }else{
            int bool=userDao.insertUser(user);
            if(bool==1) return "1";
            else return "0";
            //System.out.println("用户不存在");
        }
    }
}
