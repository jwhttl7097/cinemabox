package com.cinemabox.form.user;

import java.util.Date;

import lombok.Data;

@Data
public class UserRegisterForm {

	private String id;
	private String password;
	private String passwordConfirm;
	private String name;
	private String email;
	private String birth;
	private String phone;
}
