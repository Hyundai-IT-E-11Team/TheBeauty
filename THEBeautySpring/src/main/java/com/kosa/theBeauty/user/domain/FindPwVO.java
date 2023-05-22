package com.kosa.theBeauty.user.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FindPwVO {
	
    private String userName;
    private String userMail;
    private String userPw;
	private int userRegistration;
//	private int userMobile;
}


