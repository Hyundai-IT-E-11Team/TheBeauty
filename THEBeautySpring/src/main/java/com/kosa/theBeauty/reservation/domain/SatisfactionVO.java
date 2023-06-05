package com.kosa.theBeauty.reservation.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SatisfactionVO {

	int reservationSeq;
	int score;
	String comment;
}
