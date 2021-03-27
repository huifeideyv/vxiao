package com.xingguo.utils;


import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.xingguo.dao.UserDao;
import com.xingguo.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Component
public class Utils {
    public static  WebClient webClient;
    public static UserDao userDao;
    static{
         webClient = new WebClient();
    }
    public UserDao getUserDao() {
        return userDao;
    }
    @Autowired
    public void setUserDao(UserDao userDao) {
        Utils.userDao = userDao;
    }

    public static int getIdByUserName(User user){
        List<User> list=userDao.findByUserName(user);
        return list.get(0).getId();
    }
    public static String deelText(String md) {
        String html=md.replaceAll(" ", "&nbsp;");
        html=html.replaceAll("\n", "<br/>");
        return html;
    }
    /*
     *查外网的小说
     */
    public static Map<String,String> searchBook(){

        return null;
    }
    public static HtmlPage getHtmlPage(String url){
        //调用此方法时加载WebClient

        // 取消 JS 支持
//        webClient.setJavaScriptEnabled(false);
//        // 取消 CSS 支持
//        webClient.setCssEnabled(false);
        HtmlPage page=null;
        try{
            // 获取指定网页实体
            page = (HtmlPage) webClient.getPage(url);
        }catch (MalformedURLException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
//        System.out.println(page);
        return page;
    }
    public static String getHtml(String url,String encoding) {
     StringBuffer sb=new StringBuffer();
     BufferedReader bf = null;
     InputStreamReader isr = null;
try {
//创建网络连接
URL url1=new URL(url);
//打开网络
URLConnection uc=url1.openConnection();
uc.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
//建立文件输入流
isr=new InputStreamReader(uc.getInputStream(),encoding);
//高效率读取
bf=new BufferedReader(isr);
//下载页面源码

String temp=null;
while((temp=bf.readLine())!=null) {
sb.append(temp+"\n");
}
//System.out.println(sb.toString());

} catch (MalformedURLException e) {
System.out.println("网页打开失败，请重新输入网址。");
e.printStackTrace();
}catch (IOException e) {
System.out.println("网页打开失败,请检查网络。");
e.printStackTrace();
}finally {
if(bf!=null) {try {
bf.close();
} catch (IOException e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
if(isr!=null) {
try {
isr.close();
} catch (IOException e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
}
}
}
return sb.toString();

    }




}
