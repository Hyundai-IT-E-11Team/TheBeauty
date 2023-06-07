package com.kosa.theBeauty.reservation.dao;

import java.util.List;
import org.springframework.jdbc.UncategorizedSQLException;

import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.reservation.domain.ReservationVO;
import com.kosa.theBeauty.reservation.domain.SatisfactionVO;

public interface ReserveDAO {
	
	List<ReservationVO> selectReservationListByReservation(ReservationVO reservationVO);
	List<ReservationVO> selectReservationListByBrandSeq(int brandSeq);
	ReservationVO selectReservationByReservation(ReservationVO reservationVO);
	ReservationVO selectReservationByUserSeq(int userSeq);
	ReservationVO selectReservationByReservationSeq(int reservationSeq);
	BrandVO selectBrandByBrandSeq(int brandSeq);
	int insertReservationByReservation(ReservationVO reservationVO) throws UncategorizedSQLException;
	int updateReservationByReservation(ReservationVO reservationVO);
	int updateReservationStatusByReservationSeq(int reservationSeq);
	void insertStatisfactionBySatisfaction(SatisfactionVO satisfactionVO);
}
