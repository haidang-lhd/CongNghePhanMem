package open4um.config;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ConnectionFactory {
	private static SqlSessionFactory sqlSessionFactory = null;
	
	public static SqlSessionFactory getInstance() {
		if(sqlSessionFactory == null) {
			try {
				Reader resource = Resources.getResourceAsReader("mybatis/mybatis-config.xml");
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(resource);
				resource.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sqlSessionFactory;
	}
}
