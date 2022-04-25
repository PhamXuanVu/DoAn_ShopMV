package com.www.config;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.OAuthTokenCredential;
import com.paypal.base.rest.PayPalRESTException;

@Configuration
public class PaypalConfig {

//	@Value("${paypal.client.app}")
    private String clientId = "Aco7Lwe6eMaCfDCWTQGbWek4dN_-RfYGJEHcwoATvi4Ix8PFlcRZR4SVV1pb2BVnyEkbEjeh166S3qIB";
//	@Value("${paypal.client.secret}")
    private String clientSecret = "EAxEDu0CHqlzWBj4NtJvMJHWa8T9iRlLqrHhzqnVBFe8e99kv4saE_VYmACybsHiHpu8p2BGtKvFrY9F";
//	@Value("${paypal.mode}")
    private String mode = "sandbox";
	
//	@Value("${paypal.client.app}")
//    private String clientId;
//	@Value("${paypal.client.secret}")
//    private String clientSecret;
//	@Value("${paypal.mode}")
//    private String mode;
    
	@Bean
	public Map<String, String> paypalSdkConfig(){
		Map<String, String> sdkConfig = new HashMap<>();
		sdkConfig.put("mode", mode);
		return sdkConfig;
	}
	
	@Bean
	public OAuthTokenCredential authTokenCredential(){
		return new OAuthTokenCredential(clientId, clientSecret, paypalSdkConfig());
	}
	
	@Bean
	public APIContext apiContext() throws PayPalRESTException{
		APIContext apiContext = new APIContext(authTokenCredential().getAccessToken());
		apiContext.setConfigurationMap(paypalSdkConfig());
		return apiContext;
	}
}
