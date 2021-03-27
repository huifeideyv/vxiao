package com.xingguo.controller;

import com.gargoylesoftware.htmlunit.html.*;

import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

import com.xingguo.dao.ChapterDao;
import com.xingguo.dao.UserDao;
import com.xingguo.domain.Books;
import com.xingguo.domain.BrowerBook;
import com.xingguo.domain.Chapter;
import com.xingguo.domain.User;
import com.xingguo.service.BooksService;
import com.xingguo.service.UserService;
import com.xingguo.service.serviceImpl.UserServiceImpl;
import com.xingguo.utils.Utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.util.*;

/**
 *用于登录和注册
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    User user;
    @Autowired
    UserService userService;
    @Autowired
    BooksService booksService;
    @Autowired
    Chapter chapter;
    @Autowired
    ChapterDao chapterDao;

    /**
     * 登录
     * @param params
     */
    @RequestMapping("/login")
    @ResponseBody
    public Map<String,String> login(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestBody Map<String,String> params){

        Map<String, String> map=new HashMap<String, String>();
        user.setUsername(params.get("loginUsername"));
        user.setPasswd(params.get("loginPassword"));
        //设置Cookie
        Cookie cookie1=new Cookie("loginUsername",params.get("loginUsername"));
        Cookie cookie2=new Cookie("loginPassword",params.get("loginPassword"));
        cookie1.setMaxAge(10000000);
        cookie2.setMaxAge(10000000);
        cookie1.setPath("/");
        cookie2.setPath("/");
        httpServletResponse.addCookie(cookie1);
        httpServletResponse.addCookie(cookie2);

        Date date=new Date();
        user.setEnddate(date);
        map.put("code",userService.loginUser(user));
        httpServletRequest.getSession().setAttribute("id",Utils.getIdByUserName(user));
        return map;
    }
    @RequestMapping("/Filterlogin")
    @ResponseBody
    public void Filterlogin(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws ServletException, IOException {
        user.setUsername((String) httpServletRequest.getAttribute("loginUsername"));
        user.setPasswd((String) httpServletRequest.getAttribute("loginPassword"));
        Date date=new Date();
        user.setEnddate(date);
        int code=Integer.parseInt(userService.loginUser(user));
        httpServletRequest.getSession().setAttribute("id",Utils.getIdByUserName(user));
        if(code==0) {
            httpServletRequest.getRequestDispatcher("/Login.jsp").forward(httpServletRequest,httpServletResponse);
        }
        else{
            httpServletRequest.getRequestDispatcher("/user/intoInterface").forward(httpServletRequest,httpServletResponse);
        }
        return ;
    }
    /**
     * 注册用户
     * @param params
     * @throws ParseException
     */
    @RequestMapping("/register")
    @ResponseBody
    public Map<String,String> register(@RequestBody Map<String,String > params){
        user.setUsername(params.get("registerUsername"));
        user.setPasswd(params.get("registerPassword"));
        Date date=new Date();
        user.setStartdate(date);
        user.setEnddate(date);
        String code=userService.registerUser(user);
        Map<String, String> map=new HashMap<String, String>();
        map.put("code",code);
        return map;
//        System.out.println("Controller"+user);
    }
    @RequestMapping("/intoInterface1")
    public String intoInterface1(HttpServletRequest httpServletRequest, Model model){

        return "zhuye";
    }
    @RequestMapping("/intoInterface")
    public String intoInterface(HttpServletRequest httpServletRequest, Model model){
        //将热度最高的10本书找出来，显示在主页上
        Map<String, Object> map;
        map=booksService.showZhuye();
        model.addAttribute("hotbooks",map.get("hotbooks"));
        List<Integer> list= booksService.select14kind();//用来查找书的数目，根据种类
        model.addAttribute("kinds",list);
        return "zhuye";
    }
    @RequestMapping("/content")
    public String intoContent(@RequestParam("book_id") int book_id, Model model){
        Map<String,Object>map=booksService.findContent(book_id);
        model.addAttribute("book",map.get("book"));
        model.addAttribute("chapter",map.get("chapter"));
        return "UserContent";
    }
    @RequestMapping("/showtext")
    public String intoRead(Model model,HttpServletRequest httpServletRequest,@RequestParam("id") Integer id,@RequestParam("orders") Integer orders){
        Map<String,Object>map=booksService.findText(id,orders,httpServletRequest);
        List<Chapter> chapters=chapterDao.findAllChapterById(id);
        model.addAttribute("chapters",chapters);
        model.addAttribute("book",map.get("book"));
        model.addAttribute("chapter",map.get("chapter"));
        model.addAttribute("setting",map.get("setting"));
        chapter=(Chapter) map.get("chapter");
        model.addAttribute("paramid",httpServletRequest.getSession().getAttribute("id"));
        model.addAttribute("paramorders",chapter.getOrders());
        return "UserShow";
    }
    @RequestMapping("setting")
    public void updateSetting(@RequestBody Map<String,String > params){
        booksService.setting(Integer.parseInt(params.get("code")),Integer.parseInt(params.get("id")),params.get("value"));
        return;
    }

    /**
     * 支持模糊查找，按照书名和作者名，从本站查
     * @param
     */
    @RequestMapping("/findbenzhan")
    public String findBenzhan( Model model,@RequestParam("authorOrBookname") String authorOrBookname,@RequestParam("searchBook") String searchBook) throws IOException {
        if(searchBook.equals("benzhan")){
            System.out.println(authorOrBookname);
            Map<String,Object>map=booksService.searchBookBybenzha(authorOrBookname);
            model.addAttribute("hotbooks",map.get("hotbooks"));
            System.out.println("1234");
            List<Integer> list= booksService.select14kind();//用来查找书的数目，根据种类
            model.addAttribute("kinds",list);
            System.out.println(map.get("hotbooks"));
            System.out.println(list);
        }else{

            HtmlPage htmlPage=Utils.getHtmlPage("http://www.xbiquge.la/");
            HtmlInput input = htmlPage.getHtmlElementById("wd");
            // 往输入框 “填值”
            input.setValueAttribute(authorOrBookname);
            // 获取搜索按钮

            HtmlButton btn = htmlPage.getHtmlElementById("sss");
            // “点击” 搜索
            HtmlPage page2 = btn.click();
            HtmlTable htmlTable= (HtmlTable) page2.getElementsByTagName("table").get(0);
            List<HtmlElement> list=htmlTable.getElementsByTagName("tr");

            List<BrowerBook>BrowerBooklist=new ArrayList<>();
            for(int i=1;i<list.size();i++){
                HtmlElement tr=list.get(i);

                List<HtmlElement> ths=tr.getElementsByTagName("td");
//                for(HtmlElement htmlElement:ths){
//                    System.out.println(htmlElement.asXml());
//                }

                String href=ths.get(0).getElementsByTagName("a").get(0).getAttribute("href");
                System.out.println(href);
                String bookname=ths.get(0).asText();
                String author=ths.get(2).asText();
                String html=Utils.getHtml(href,"GBK");
                System.out.println(html);
                Document document= Jsoup.parse(html);
                Element imgdiv=document.getElementById("fmimg");
                String imgsrc=imgdiv.getElementsByTag("img").get(0).getAllElements().attr("src");
                System.out.println(imgsrc);
                String context=document.getElementById("intro").getElementsByTag("p").get(1).text();
                System.out.println(context);
//                HtmlPage content=Utils.getHtmlPage(href);
//                HtmlElement imgdiv=content.getHtmlElementById("fmimg");
//                String imgsrc=imgdiv.getElementsByTagName("img").get(0).getAttribute("src");
//                String context=content.getElementById("intro").getElementsByTagName("p").get(1).asText();
                BrowerBook browerBook=new BrowerBook();
                browerBook.setBook_img(imgsrc);
                System.out.println(bookname);
                browerBook.setBook_author(author);
                browerBook.setBook_name(bookname);
                browerBook.setBook_href(href);
                browerBook.setIntroduce(context);
                BrowerBooklist.add(browerBook);
            }
            model.addAttribute("browerBooks",BrowerBooklist);
            List<Integer> list14= booksService.select14kind();//用来查找书的数目，根据种类
            model.addAttribute("kinds",list14);
        }

        return "zhuye";
    }
}
