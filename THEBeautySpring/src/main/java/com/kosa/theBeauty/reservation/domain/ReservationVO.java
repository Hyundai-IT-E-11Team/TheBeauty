package com.kosa.theBeauty.reservation.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservationVO {

	private int userSeq;
	private String userName;
	private int brandSeq;
	private String reserveDate;
	private String reserveTime;
	private String reserveStatus;
	private String consultRoomId;
}
