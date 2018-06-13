package presentation.model;

import java.io.Serializable;
import java.util.Date;

public class Entry implements Serializable {

    private int e_id;
    private String title;
    private Date date;
    private String author;
    private String content;

    public int getE_id() {
        return e_id;
    }

    public void setE_id(int e_id) {
        this.e_id = e_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return String.format("entry bean:\n%3d | %15s | %tD | %s | %s", getE_id(), getTitle(), getDate(), getAuthor(), getContent());
    }
}
