package com.www.config;

import com.www.authentication.MyDBAuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
// @EnableWebSecurity = @EnableWebMVCSecurity + Extra features
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    MyDBAuthenticationService myDBAauthenticationService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        //Web resources
        web.ignoring().antMatchers("/css/**");
        web.ignoring().antMatchers("/js/**");
        web.ignoring().antMatchers("/images/**");
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

        // For User in database.
        auth.userDetailsService(myDBAauthenticationService).passwordEncoder(passwordEncoder());

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable();

        // The pages requires login as EMPLOYEE or MANAGER.
        // If no login, it will redirect to /login page.

        // For MANAGER only.
        http.authorizeRequests().antMatchers("/product/**").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests().antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests().antMatchers("/user/nguoimua").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests().antMatchers("/user/nguoiban").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests().antMatchers("/user/form-add-nguoi-mua").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests().antMatchers("/user/form-add-nguoi-ban").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests().antMatchers("/user/form-update-nguoi-mua/**").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests().antMatchers("/user/form-update-nguoi-ban/**").access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests().antMatchers("/danhmuc/**").access("!hasRole('ROLE_ADMIN')");
        http.authorizeRequests().antMatchers("/gioHang/**").access("hasRole('ROLE_MEMBER')");
        http.authorizeRequests().antMatchers("/user/login").permitAll();
        http.authorizeRequests().antMatchers("/user/register").permitAll();
        http.authorizeRequests().antMatchers("/chiTietSP/**").access("!hasRole('ROLE_ADMIN')");     
        http.authorizeRequests().antMatchers("/").permitAll();
        http.authorizeRequests().anyRequest().permitAll();

        // When the user has logged in as XX.
        // But access a page that requires role YY,
        // AccessDeniedException will throw.
        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");

        // Config for Login Form
        http.authorizeRequests()
        		.and().formLogin()//
                // Submit URL of login page.
                .loginProcessingUrl("/j_spring_security_check") // Submit URL
                .loginPage("/user/login")//
                .defaultSuccessUrl("/")
                .failureUrl("/user/login?error=true")
                .usernameParameter("email")//
                .passwordParameter("password")
                // Config for Logout Page
                // (Go to home page).
                .and().logout().logoutUrl("/perform_logout").logoutSuccessUrl("/");

    }

}
