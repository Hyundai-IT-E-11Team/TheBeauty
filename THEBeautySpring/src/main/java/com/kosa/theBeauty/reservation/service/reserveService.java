package com.kosa.theBeauty.reservation.service;

import java.util.List;

import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Service;

import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.reservation.dao.reserveDAO;
import com.kosa.theBeauty.reservation.domain.ReservationVO;
import com.kosa.theBeauty.reservation.domain.SatisfactionVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class reserveService {

	private final reserveDAO dao;
	
	public BrandVO getBrandInfo(int brandSeq) {
		try {
			return dao.selectBrandInfo(brandSeq);
		} catch (Exception e) {
			return null;
		}
	}


	public void setReservation(ReservationVO vo) throws UncategorizedSQLException {
		dao.insertReservationInfo(vo);
	}
	
	public boolean cancelReservation(ReservationVO reservationvo) {
	      try {
	         if(dao.updateReservation(reservationvo)==1) {
	            return true;
	         }
	         return false;
	      } catch (Exception e) {
	         return false;
	      }
	  }

	public boolean getSchedule(ReservationVO reservationvo) {
		try {
			System.out.println(reservationvo);
			reservationvo = dao.selectReservationInfo(reservationvo);
			System.out.println("try");
			System.out.println(reservationvo);
			if (reservationvo.getReserveStatus()==0) {
				System.out.println("success");
				System.out.println(reservationvo.getReserveStatus());
				return true;
			}
			return false;
		} catch (Exception e) {
			System.out.println("catch");
			System.out.println(reservationvo);
			return false;
		}
	}

	public ReservationVO getReservation(int userSeq) {
		return dao.selectReservationByUser(userSeq);
	}
	
	public List<ReservationVO> getReservation(ReservationVO reservationvo) {
	      return dao.selectReservationforDetail(reservationvo);
	   }


	public List<ReservationVO> getBrandReservation(int brandSeq) {
		return dao.selectReservationBrand(brandSeq);
	}


	public ReservationVO getReservationBySeq(int reservationSeq) {
		return dao.selectReservationBySeq(reservationSeq);
	}
	
	public int setReservationStatusSuccess(int reservationSeq) {
		return dao.updateReservationStatus(reservationSeq);
	}


	public void createSatisfaction(SatisfactionVO satisfaction) {
		dao.createStatisfaction(satisfaction);
		
	}

}
