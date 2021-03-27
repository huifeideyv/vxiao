package com.xingguo.domain;

import org.springframework.stereotype.Component;

@Component
public class BrowerBook {
    private String book_name;
    private String book_img;
    private String book_author;
    private String book_href;
    private String introduce;

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_img() {
        return book_img;
    }

    public void setBook_img(String book_img) {
        this.book_img = book_img;
    }

    public String getBook_author() {
        return book_author;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public String getBook_href() {
        return book_href;
    }

    public void setBook_href(String book_href) {
        this.book_href = book_href;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
}
