package tp.kits3.open4um.vo;

public class RoleUser {

    private Integer roleUserId;

    private Integer userid;

    private Integer roleid;

    public Integer getRoleUserId() {
        return roleUserId;
    }

    public void setRoleUserId(Integer roleUserId) {
        this.roleUserId = roleUserId;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    // RoleUser 모델 복사
    public void CopyData(RoleUser param)
    {
        this.roleUserId = param.getRoleUserId();
        this.userid = param.getUserid();
        this.roleid = param.getRoleid();
    }
}