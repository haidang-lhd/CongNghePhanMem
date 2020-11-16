package open4um.vo;

import java.sql.Timestamp;

public class HistoryMoney {

    private Integer hismid;

    private Double money;

    private Timestamp date;

    private String discription;

    private Integer userid;

    public Integer getHismid() {
        return hismid;
    }

    public void setHismid(Integer hismid) {
        this.hismid = hismid;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    // Historymoney 
    public void CopyData(HistoryMoney param)
    {
        this.hismid = param.getHismid();
        this.money = param.getMoney();
        this.date = param.getDate();
        this.discription = param.getDiscription();
        this.userid = param.getUserid();
    }
}