package com.www.Util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.www.dto.NguoiDungDTO;
import com.www.entity.NguoiDung;
import com.www.entity.TaiKhoan;
import com.www.entity.VaiTro;
import com.www.repository.NguoiDungRepository;
import com.www.repository.RoleRepository;
import com.www.repository.UserRepository;

@Component
@PropertySource("classpath:ds-hibernate-cfg.properties")
public class GoogleUtils {
	@Autowired
	private NguoiDungRepository nguoiDungRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private Environment env;

	public String getToken(final String code) throws ClientProtocolException, IOException {
		String link = env.getProperty("google.link.get.token");

		String response = Request.Post(link)
				.bodyForm(Form.form().add("client_id", env.getProperty("google.app.id"))
						.add("client_secret", env.getProperty("google.app.secret"))
						.add("redirect_uri", env.getProperty("google.redirect.uri")).add("code", code)
						.add("grant_type", "authorization_code").build())
				.execute().returnContent().asString();

		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.readTree(response).get("access_token");
		return node.textValue();
	}

	public GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = env.getProperty("google.link.get.user_info") + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();
		ObjectMapper mapper = new ObjectMapper();
		GooglePojo googlePojo = mapper.readValue(response, GooglePojo.class);
		System.out.println(googlePojo);
		return googlePojo;

	}

	public UserDetails buildUser(GooglePojo googlePojo) {
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_MEMBER"));
		UserDetails userDetail = new User(googlePojo.getEmail(),
				"", enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		if (userRepository.findByEmail(googlePojo.getEmail()) == null) {
            VaiTro vaiTro = roleRepository.findByTenVaiTro("ROLE_MEMBER");

            TaiKhoan taiKhoan = new TaiKhoan();
            Set<VaiTro> vaiTros = new HashSet<>();
            vaiTros.add(vaiTro);
            taiKhoan.setVaiTros(vaiTros);
            taiKhoan.setEmail(googlePojo.getEmail());
            taiKhoan.setMatKhau(passwordEncoder.encode("123456"));
     
            userRepository.save(taiKhoan);

            NguoiDung nguoiDung = new NguoiDung();
            nguoiDung.setTaiKhoan(taiKhoan);
            nguoiDung.setTen("user google");
            nguoiDung.setSoDienThoai("0914526478");
            nguoiDung.setDiaChi("12,Nguyễn Văn Bảo, P4, Gò Vấp, HCM");
            nguoiDungRepository.save(nguoiDung);
		}	
		return userDetail;
	}

}
