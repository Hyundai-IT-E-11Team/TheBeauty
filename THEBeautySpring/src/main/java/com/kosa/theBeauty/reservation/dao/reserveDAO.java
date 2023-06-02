package com.kosa.theBeauty.reservation.dao;

import org.springframework.jdbc.UncategorizedSQLException;

import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.reservation.domain.ProductVO;
import com.kosa.theBeauty.reservation.domain.ReservationVO;

public interface reserveDAO {
	
	BrandVO selectBrandInfo(BrandVO vo);
	ProductVO selectProductInfo(BrandVO vo);
	int insertReservationInfo(ReservationVO vo) throws UncategorizedSQLException;
	String selectReservationInfo(ReservationVO reservationvo);
	ReservationVO selectReservationByUser(int userSeq);
}
