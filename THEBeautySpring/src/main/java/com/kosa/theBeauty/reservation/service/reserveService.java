package com.kosa.theBeauty.reservation.service;

import java.util.List;

import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Service;

import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.reservation.dao.reserveDAO;
import com.kosa.theBeauty.reservation.domain.ReservationVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class reserveService {

	private final reserveDAO dao;
	
	//페이지 출력을 위한 브랜드 정보 가져오기
	public BrandVO getBrandInfo(int roleNum) {
		try {
			return dao.selectBrandInfo(roleNum);
		} catch (Exception e) {
			return null;
		}
	}

	//예약저장
	public void setReservation(ReservationVO vo) throws UncategorizedSQLException {
		dao.insertReservationInfo(vo);
	}
	
	//예약취소
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
	
	//시간출력을 위해 기존 예약스케줄 가져오기
	public boolean getSchedule(ReservationVO reservationvo) {
		try {
			reservationvo = dao.selectReservationInfo(reservationvo);
			if (reservationvo == null || reservationvo.getReserveStatus() == 3) {
				return false;
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public ReservationVO getReservation(int userSeq) {
		return dao.selectReservationByUser(userSeq);
	}
	
	//마이뷰티에서 고객예약리스트가져오기
	public List<ReservationVO> getReservation(ReservationVO reservationvo) {
	      return dao.selectReservationforDetail(reservationvo);
	}

	//관리자페이지에서 시간클릭시 단일예약내역 가져오기
	public ReservationVO getReserveforManage(ReservationVO reservationvo) {
		return dao.selectReservationInfo(reservationvo);
	}
	//정체 무엇?
	public List<ReservationVO> getBrandReservation(int brandSeq) {
		return dao.selectReservationBrand(brandSeq);
	}

	//이거는?
	public ReservationVO getReservationBySeq(int reservationSeq) {
		return dao.selectReservationBySeq(reservationSeq);
	}

}
