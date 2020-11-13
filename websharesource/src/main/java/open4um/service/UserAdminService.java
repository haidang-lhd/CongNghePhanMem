package open4um.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.open4um.daoimpl.UserToanAdminImpl;
import tp.kits3.open4um.dto.UserRoleDto;
import tp.kits3.open4um.vo.User;

@Service
public class UserToanAdminService {
	@Autowired
	private UserToanAdminImpl impl;
	//<!--Author:Toan-->
		public List<User> selectuserName() {
			List<User> list = impl.selectUserName();
			return list;
		}

		
		public List<UserRoleDto> selectthanhviencu(){
			List<UserRoleDto> list1= impl.selectThanhviencu();
			return list1;
		}


		
		
		
		
		//--/Het Author:Toan
		
}
