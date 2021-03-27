package com.xingguo.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.mysql.cj.xdevapi.JsonArray;
import com.xingguo.dao.UserDao;
import com.xingguo.domain.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class ManagerController {
    @Autowired
    UserDao userDao;
    @RequestMapping("/selectuser")
    @ResponseBody
    public JSONObject selectUserByFenye(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit, HttpServletRequest httpServletRequest){
       page=(page-1)*limit;
        List<User>list=userDao.SelectLimit(page,limit);
        JSONObject jsonpObject=new JSONObject();
        JSONArray array=new JSONArray();
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        for (User user:list) {
            JSONObject lan=new JSONObject();
            lan.accumulate("id",user.getId());lan.accumulate("username",user.getUsername());
            lan.accumulate("passwd",user.getPasswd());
            String startdate=format1.format(user.getStartdate());
            String enddate=format1.format(user.getEnddate());
            lan.accumulate("startdate",startdate);
            lan.accumulate("enddate",enddate);
            array.add(lan);
        }
        jsonpObject.accumulate("code",0);
        jsonpObject.accumulate("count",30000);
        jsonpObject.accumulate("data",array);
        jsonpObject.accumulate("msg","");
        System.out.println(jsonpObject);
        return jsonpObject;

    }
    @RequestMapping("/manageInferface")
    public String manageInferface(){
        return "ManagerInferface";
    }
    @RequestMapping("userInfor")
    public String guanliyuan(){
        return "UserInformation";
    }
    @RequestMapping("deleteuser")
    @ResponseBody
    public Integer deleteUser( @RequestBody Map<String,String> params){
        int id=Integer.parseInt(params.get("id"));
        System.out.println(id);
        return userDao.deleteUser(id);
    }
    @RequestMapping("/selectbook")
    public void selectBook(){
        return ;
    }
}
