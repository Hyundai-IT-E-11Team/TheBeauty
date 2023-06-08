package com.kosa.theBeauty.reservation.service;

import java.util.List;

import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.reservation.domain.ReservationVO;
import com.kosa.theBeauty.reservation.domain.SatisfactionVO;

public interface ReserveService {
	
	List<ReservationVO> getReservation(ReservationVO reservationVO);
	ReservationVO getReservation(int userSeq);
	ReservationVO getReserveforManage(ReservationVO reservationVO);
	ReservationVO getReservationBySeq(int reservationSeq);
	BrandVO getBrandInfo(int brandSeq);
	int setReservationStatusSuccess(int reservationSeq);
	boolean cancelReservation(ReservationVO reservationVO);
	boolean getSchedule(ReservationVO reservationVO);
	void setReservation(ReservationVO reservationVO);
	void createSatisfaction(SatisfactionVO satisfactionVO);
}
