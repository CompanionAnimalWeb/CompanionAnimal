package com.example.demo.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;


public class User {

	@NotBlank(message = "아이디는 필수 입력값입니다.")
	@Pattern(regexp = "^[a-z0-9]{4,10}$", message = "아이디는 영어 소문자와 숫자만 사용하여 4~10자리여야 합니다.")
	private String id;
	@NotBlank(message = "비밀번호는 필수 입력값입니다.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,16}", message = "비밀번호는 영문 대소문자, 숫자, 특수문자를 포함한 8~16자여야 합니다.")
	private String password;
	@NotBlank(message = "이름은 필수 입력값입니다.")
	@Pattern(regexp = "^[가-힣]{2,10}$" , message = "이름은 한글만 포함한 2~10자리여야 합니다.")
	private String name;
	@NotBlank(message = "핸드폰번호는 필수 입력값입니다.")
	@Pattern(regexp = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$", message = "공백 없이 숫자만 입력하세요.")
	private String phone;

	
	/* 싱글톤 패턴 적용 */
	private static User instance;
	
	private User() {
		User.instance = instance;
	}
		
	public static User getInstance() {
		if (instance == null) {
	       	instance = new User();
	    }
	    return instance;
	}
	
	
	public String getId() {
			return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
 
	
	/* 빌더 패턴 적용 */
	private User(UserBuilder userBuilder) {
		this.id = userBuilder.id;
	    this.password = userBuilder.password;
	    this.name = userBuilder.name;
	    this.phone = userBuilder.phone;
	}
		
	public static class UserBuilder {
		
		private String id;
		private String password;
		private String name;
		private String phone;
		
		public UserBuilder(String id, String password) {
			this.id = id;
			this.password = password;
		}
		
		public UserBuilder name (String name) {
			this.name = name;
			return this;
		}
		
		public UserBuilder phone(String phone) {
			this.phone = phone;
			return this;
		}
	
		public User build() {
			return new User(this);
        }
	  
	}
	
	
	public static class Main {
		public static void main(String[] args) {
			User user = new User.UserBuilder("loveanimal", "1234")
					.name("Jung Su Bin")
	                .phone("010-1234-5678")
	                .build();

	        System.out.println("id : " + user.getId());
	        System.out.println("password : " + user.getPassword());
	        System.out.println("name : " +user.getName());
	        System.out.println("phone : " + user.getPhone());
	        
	    }
	}

}
