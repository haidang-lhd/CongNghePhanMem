package  open4um.vo;

import java.sql.Timestamp;

public class OrderHistory {

    private Integer orid;

    private Timestamp orderdate;

    private Integer userid;

    private Integer sourceid;

    public Integer getOrid() {
        return orid;
    }

    public void setOrid(Integer orid) {
        this.orid = orid;
    }

    public Timestamp getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Timestamp orderdate) {
        this.orderdate = orderdate;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getSourceid() {
        return sourceid;
    }

    public void setSourceid(Integer sourceid) {
        this.sourceid = sourceid;
    }

     
    public void CopyData(OrderHistory param)
    {
        this.orid = param.getOrid();
        this.orderdate = param.getOrderdate();
        this.userid = param.getUserid();
        this.sourceid = param.getSourceid();
    }
}