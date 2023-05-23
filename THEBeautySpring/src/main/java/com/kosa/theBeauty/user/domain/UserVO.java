package com.kosa.theBeauty.user.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class UserVO {

	private int userSequence;
	private String userName;
	private String userEMail;
	private String userPassword;
	private int userRegistration;
	private int userMobile;
	
}
