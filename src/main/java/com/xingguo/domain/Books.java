package com.xingguo.domain;

import org.springframework.stereotype.Component;

@Component
public class Books {
    private Integer book_id;
    private String book_name;
    private String author;
    private String kind;
    private Integer chapter_count;
    private String summary;
    private String book_img;
    private Integer hot;

    public Integer getBook_id() {
        return book_id;
    }

    public void setBook_id(Integer book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public Integer getChapter_count() {
        return chapter_count;
    }

    public void setChapter_count(Integer chapter_count) {
        this.chapter_count = chapter_count;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getBook_img() {
        return book_img;
    }

    public void setBook_img(String book_img) {
        this.book_img = book_img;
    }

    public Integer getHot() {
        return hot;
    }

    public void setHot(Integer hot) {
        this.hot = hot;
    }
}
