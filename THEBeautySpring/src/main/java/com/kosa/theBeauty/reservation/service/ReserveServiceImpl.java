package com.kosa.theBeauty.reservation.service;

import java.util.List;

import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Service;

import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.reservation.dao.ReserveDAO;
import com.kosa.theBeauty.reservation.domain.ReservationVO;
import com.kosa.theBeauty.reservation.domain.SatisfactionVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReserveServiceImpl implements ReserveService{

	private final ReserveDAO dao;

	public BrandVO getBrandInfo(int brandSeq) {

		try {
			return dao.selectBrandByBrandSeq(brandSeq);
		} catch (Exception e) {
			return null;
		}
	}

	// 예약저장
	public void setReservation(ReservationVO vo) throws UncategorizedSQLException {

		dao.insertReservationByReservation(vo);
	}

	// 예약취소
	public boolean cancelReservation(ReservationVO reservationvo) {

		try {
			if (dao.updateReservationByReservation(reservationvo) == 1) {
				return true;
			}
			return false;
		} catch (Exception e) {
			return false;
		}
	}

	// 시간출력을 위해 기존 예약스케줄 가져오기
	public boolean getSchedule(ReservationVO reservationvo) {

		if (dao.selectReservationByReservation(reservationvo) != null) {
			return true;
		}
		return false;

	}

	public ReservationVO getReservation(int userSeq) {

		return dao.selectReservationByUserSeq(userSeq);
	}

	// 마이뷰티에서 고객예약리스트가져오기
	public List<ReservationVO> getReservation(ReservationVO reservationvo) {

		return dao.selectReservationListByReservation(reservationvo);
	}

	// 관리자페이지에서 시간클릭시 단일예약내역 가져오기
	public ReservationVO getReserveforManage(ReservationVO reservationvo) {

		return dao.selectReservationByReservation(reservationvo);
	}

	public ReservationVO getReservationBySeq(int reservationSeq) {

		return dao.selectReservationByReservationSeq(reservationSeq);
	}

	public int setReservationStatusSuccess(int reservationSeq) {

		return dao.updateReservationStatusByReservationSeq(reservationSeq);
	}

	public void createSatisfaction(SatisfactionVO satisfaction) {

		dao.insertStatisfactionBySatisfaction(satisfaction);
	}

}
