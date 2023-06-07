package com.kosa.theBeauty.user.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserVO {
	private int userSeq;
	private int roleNum;
	private String userName;
	private String userMail;
	private String userPw;
	private String userRegistration;
	private String userMobile;
}
