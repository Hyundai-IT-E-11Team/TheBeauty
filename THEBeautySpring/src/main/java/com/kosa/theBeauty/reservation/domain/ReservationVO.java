package com.kosa.theBeauty.reservation.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservationVO {

	private int reservationSeq;
	private int userSeq;
	private String userName;
	private int brandSeq;
	private String brandName;
	private String reserveDate;
	private String reserveTime;
	private int reserveStatus;
	private String consultRoomId;
}
