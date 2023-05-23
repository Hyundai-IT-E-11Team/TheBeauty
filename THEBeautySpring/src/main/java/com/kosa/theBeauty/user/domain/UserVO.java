package com.kosa.theBeauty.user.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserVO {
	private int userSeq;
	private String roleName;
	private String userName;
	private String userMail;
	private String userPW;
	private String userRegistration;
	private String userMobile;
}
