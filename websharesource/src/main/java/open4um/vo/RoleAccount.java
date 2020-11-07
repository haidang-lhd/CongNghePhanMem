package tp.kits3.open4um.vo;

public class RoleAccount {

    private Integer roleaccountId;

    private String roleaccountName;

    public Integer getRoleaccountId() {
        return roleaccountId;
    }

    public void setRoleaccountId(Integer roleaccountId) {
        this.roleaccountId = roleaccountId;
    }

    public String getRoleaccountName() {
        return roleaccountName;
    }

    public void setRoleaccountName(String roleaccountName) {
        this.roleaccountName = roleaccountName;
    }

    // Roleaccount 모델 복사
    public void CopyData(RoleAccount param)
    {
        this.roleaccountId = param.getRoleaccountId();
        this.roleaccountName = param.getRoleaccountName();
    }
}