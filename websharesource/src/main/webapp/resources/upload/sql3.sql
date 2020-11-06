	SELECT user.userid, username,phone,email, status, roleaccount_name FROM user
		INNER JOIN role_user
		ON user.userid = role_user.userid
		INNER JOIN role
		ON role_user.roleid = role.roleid
		where user.userid=3
		
		
		update user set
			username="nguyenthaii",
			phone="0909083333",
			email="nguyenthai1701@gmail.com",
			status="active"
		where userid = 1
		


UPDATE 
  	user JOIN role_user ON role_user.userid = user.userid
	SET 
  		user.username=#{username},
		user.phone=#{phone},
		user.email=#{email},
		user.status=#{status},
		
	WHERE 
   		role_user.userid=#{userid}
   		

select b.ctgname from category as a left join category as b on a.ctgid = b.parentid where a.parentid = 33 or a.parentid = 34


SELECT ctgname FROM category 
			WHERE parentid = 33 OR parentid = 34
			
 source*source INNER WHERE sourceid BETWEEN 0 AND 2 ;
 
 
 SELECT b.ctgname FROM category as a LEFT JOIN category as b ON a.ctgid = b.parentid WHERE a.parentid = 33 OR a.parentid = 34
 
 
SELECT sourceid, sourcename, avatar, ctgname FROM source 
			INNER JOIN category
			ON source.ctgid = category.ctgid 
			
			
SELECT b.ctgname FROM category as a LEFT JOIN category as b ON a.ctgid = b.parentid WHERE a.parentid = 33
 
SELECT sourceid, sourcename, avatar, ctgname FROM source 
			INNER JOIN category
			ON source.ctgid = category.ctgid
			WHERE ctgname="Source Web"