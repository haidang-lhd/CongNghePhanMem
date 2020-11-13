package open4um.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/**
 * 
 * 
 *
 */
public class SpringSecurityInitializer extends AbstractSecurityWebApplicationInitializer{
	public SpringSecurityInitializer() {
		super(tp.kits3.open4um.config.SecurityConfig.class);
	}
}	
