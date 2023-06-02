package com.kosa.theBeauty.reservation.dao;

import java.util.List;
import org.springframework.jdbc.UncategorizedSQLException;

import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.reservation.domain.ReservationVO;

public interface reserveDAO {
	
	BrandVO selectBrandInfo(BrandVO vo);
	int insertReservationInfo(ReservationVO vo) throws UncategorizedSQLException;
	String selectReservationInfo(ReservationVO reservationvo);
	List<ReservationVO> selectReservationforDetail(ReservationVO reservationvo);
	int updateReservation(ReservationVO reservationvo);
	ReservationVO selectReservationByUser(int userSeq);
}
