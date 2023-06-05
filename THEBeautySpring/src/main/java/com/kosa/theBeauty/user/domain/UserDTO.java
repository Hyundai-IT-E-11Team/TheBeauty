package com.kosa.theBeauty.user.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserDTO {
	
	private String userName;
	private String userRegistration;
	private String userMail;
	private String userPw;
}
