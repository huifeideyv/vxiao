package com.xingguo.domain;

import org.springframework.stereotype.Component;

@Component
public class Setting {
    private Integer id;
    private String theme;
    private String fontfamily;
    private Integer fontsize;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getFontfamily() {
        return fontfamily;
    }

    public void setFontfamily(String fontfamily) {
        this.fontfamily = fontfamily;
    }

    public Integer getFontsize() {
        return fontsize;
    }

    public void setFontsize(Integer fontsize) {
        this.fontsize = fontsize;
    }
}
