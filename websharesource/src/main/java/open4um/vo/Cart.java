package  open4um.vo;

public class Cart {

    private Integer cartid;

    private Integer proid;

    private Integer userid;

    public Integer getCartid() {
        return cartid;
    }

    public void setCartid(Integer cartid) {
        this.cartid = cartid;
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

     
    public void CopyData(Cart param)
    {
        this.cartid = param.getCartid();
        this.proid = param.getProid();
        this.userid = param.getUserid();
    }
}