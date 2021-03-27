package com.xingguo.service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface BooksService {
    public Map<String,Object> showZhuye();
    public Map<String, Object> findContent(Integer book_id);
    public Map<String, Object> findText(Integer id, Integer orders,HttpServletRequest httpServletRequest);
    public void setting(int code,int id,String value);
    public List<Integer> select14kind();

    public Map<String,Object> searchBookBybenzha(String benzhan);
}
