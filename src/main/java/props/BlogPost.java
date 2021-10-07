package props;

import java.util.Date;

public class BlogPost {
    private int bid;
    private int fk_aid;
    private String title;
    private String title_detail;
    private String content;
    private Date date_time;
    private String name;


    public BlogPost(){
    }

    public BlogPost(int bid, String title, String title_detail, String content, int fk_aid, Date date_time) {
        this.bid = bid;
        this.fk_aid = fk_aid;
        this.title = title;
        this.title_detail = title_detail;
        this.content = content;
        this.date_time = date_time;
    }

    public Date getDate_time() {
        return date_time;
    }

    public void setDate_time(Date date_time) {
        this.date_time = date_time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getFk_aid() {
        return fk_aid;
    }

    public void setFk_aid(int fk_aid) {
        this.fk_aid = fk_aid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle_detail() {
        return title_detail;
    }

    public void setTitle_detail(String title_detail) {
        this.title_detail = title_detail;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
