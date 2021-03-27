package com.xingguo.service.serviceImpl;

import com.xingguo.dao.BooksDao;
import com.xingguo.dao.ChapterDao;
import com.xingguo.dao.SettingDao;
import com.xingguo.domain.Books;
import com.xingguo.domain.Chapter;
import com.xingguo.domain.Setting;
import com.xingguo.service.BooksService;
import com.xingguo.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service("BooksService")
public class BooksServiceImpl implements BooksService {
    @Autowired
    BooksDao booksDao;
    @Autowired
    ChapterDao chapterDao;
    @Autowired
    SettingDao settingDao;
    @Override
    public Map<String, Object> showZhuye() {
        Map<String, Object>map=new HashMap<>();
        //显示热度前10的书
        List<Books> books= booksDao.findMaxHot();
        map.put("hotbooks",books);
        //显示各种种类书的数目
        return map;
    }
    @Override
    public Map<String, Object> findContent(Integer book_id){
        List<Chapter> chapter=chapterDao.findAllChapterById(book_id);
        Books book=booksDao.findById(book_id);
        Map<String, Object>map=new HashMap<>();
        map.put("book",book);
        map.put("chapter",chapter);
        return map;
    }
    @Override//书id   idd为用户id
    public Map<String, Object> findText(Integer id, Integer orders, HttpServletRequest httpServletRequest){
        Map<String, Object>map=new HashMap<>();
        System.out.println(1+" "+id+" "+orders);
        Books book= booksDao.findById(id);
        System.out.println(2);
        Chapter chapter=chapterDao.findChapterById(id,orders);
        System.out.println(3);
        HttpSession httpSession=httpServletRequest.getSession();
        System.out.println(4);
        int idd=(int) httpSession.getAttribute("id");
        System.out.println(idd);
        Setting setting=settingDao.findById(idd);
        if(setting==null) {
            setting=new Setting();
            setting.setId(idd);
            setting.setTheme("theme0");
            setting.setFontfamily("font-family01");
            setting.setFontsize(18);
            settingDao.insertSetting(setting);
           map.put("setting",setting);
        }else {
            map.put("setting",setting);
        }
        String html= Utils.deelText(chapter.getContexts());
        chapter.setContexts(html);
        map.put("book",book);
        map.put("chapter",chapter);
        return map;
    }
    @Override
    public void setting(int code,int id,String value){
        if(code==1){
            String theme=value;
            settingDao.updateTheme(id,theme);
        }
        else if(code==2){
            String fontfamily=value;
            settingDao.updateFontFamily(id,fontfamily);
        }else{
            int fontsize=Integer.parseInt(value);
            settingDao.updateFontSize(id,fontsize);
        }
    }
    @Override
    public List<Integer> select14kind(){
        String []kinds=new String []{"玄幻","奇幻","武侠","仙侠","都市","现实","军事","历史","游戏","体育","科幻","悬疑","言情","轻松"};
        List<Integer>list=new LinkedList<>();
        for(int i=0;i< kinds.length;i++){
            list.add(booksDao.findCount(kinds[i]));
        }
        return list;
    }
    @Override
    public Map<String,Object> searchBookBybenzha(String benzhan){
        Map<String,Object>map=new HashMap<String,Object>();
        List<Books>list=booksDao.findByName_(benzhan);
        map.put("hotbooks",list);
        return map;
    }
}
