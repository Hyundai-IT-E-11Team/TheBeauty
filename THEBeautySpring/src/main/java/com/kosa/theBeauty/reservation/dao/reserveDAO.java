package com.kosa.theBeauty.reservation.dao;

import java.util.List;
import org.springframework.jdbc.UncategorizedSQLException;

import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.reservation.domain.ReservationVO;
import com.kosa.theBeauty.reservation.domain.SatisfactionVO;

public interface reserveDAO {
	
	BrandVO selectBrandInfo(int brandSeq);
	int insertReservationInfo(ReservationVO vo) throws UncategorizedSQLException;
	ReservationVO selectReservationInfo(ReservationVO reservationvo);
	List<ReservationVO> selectReservationforDetail(ReservationVO reservationvo);
	int updateReservation(ReservationVO reservationvo);
	int updateReservationStatus(int reservationSeq);
	ReservationVO selectReservationByUser(int userSeq);
	List<ReservationVO> selectReservationBrand(int brandSeq);
	ReservationVO selectReservationBySeq(int reservationSeq);
	void createStatisfaction(SatisfactionVO satisfaction);
}
