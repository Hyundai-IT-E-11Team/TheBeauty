package com.kosa.theBeauty.reservation.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.reservation.dao.reserveDAO;
import com.kosa.theBeauty.reservation.domain.ReservationVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class reserveService {

	private final reserveDAO dao;
	
	public BrandVO getBrandInfo(BrandVO vo) {
		try {
			return  dao.selectBrandInfo(vo);
		} catch (Exception e) {
			return null;
		}
	}

	public String getProductInfo(BrandVO vo) {
		try {
			return  dao.selectProductInfo(vo).getProductImgurl();
		} catch (Exception e) {
			return null;
		}
	}

	public boolean setReservation(ReservationVO vo) {
		try {
			
			if(dao.insertReservationInfo(vo)==1) {
				return true;
			} else {
				return  false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	public boolean getSchedule(ReservationVO reservationvo) {
		try {
			if(dao.selectReservationInfo(reservationvo).equals("예약확정")) {
				return true;
			}
			return false;
		} catch (Exception e) {
			return false;
		}
	}
	
}
