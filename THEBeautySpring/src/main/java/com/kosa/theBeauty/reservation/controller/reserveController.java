package com.kosa.theBeauty.reservation.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.product.domain.BrandVO;
import com.kosa.theBeauty.reservation.domain.ReservationVO;
import com.kosa.theBeauty.reservation.service.reserveService;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("reserve")
@RequiredArgsConstructor
public class reserveController {

	private final reserveService service;

	// 예약페이지 이동
	@DebugLog
	@PostMapping("reservePage")
	public String reservePage(@SessionAttribute UserVO currUser, BrandVO vo, Model model) {
		// 상담예약버튼을 누르면 실행
		vo = service.getBrandInfo(vo);
		model.addAttribute("brandInfo", vo);
		model.addAttribute(currUser);
		return "reservation/reservation";
	}

	// 예약완료 후 예약상세페이지 아니고 메인에서 바로 누를 때
	@DebugLog
	@GetMapping("reservationDetailPage")
	public String reservationDetailPage(@SessionAttribute UserVO currUser, Model model) {
		ReservationVO reservationvo = new ReservationVO();
		List<ReservationVO> reservationList = new ArrayList<ReservationVO>();
		reservationvo.setUserSeq(currUser.getUserSeq());
		reservationList = service.getReservation(reservationvo);
		model.addAttribute("reservationList", reservationList);
		return "reservation/reservationDetail";
	}

	// 예약취소
	@DebugLog
	@PostMapping("cancelReservation")
	public ResponseEntity<String> cancelReservation(ReservationVO reservationvo) {
		if (service.cancelReservation(reservationvo)) {
			return new ResponseEntity<>(HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	// 예약저장하고 설문페이지로
	@DebugLog
	@PostMapping(value = "myReservation", produces = "application/text; charset=utf8")
	public ResponseEntity<String> myReservation(@SessionAttribute UserVO currUser, ReservationVO reservationvo,
			Model model) {
		reservationvo.setUserSeq(currUser.getUserSeq());
		reservationvo.setUserName(currUser.getUserName());
		try {
			service.setReservation(reservationvo);
			System.out.println("예약성공");
			return new ResponseEntity<>("/theBeauty/survey/surveyPage", HttpStatus.OK);
		} catch (UncategorizedSQLException e) {
			return new ResponseEntity<>(e.getMessage().split(":")[3], HttpStatus.BAD_REQUEST);

		}
	}

	// 예약 가능,불가능 시간 출력
	@DebugLog
	@PostMapping("checkSchedule")
	public ResponseEntity<String> checkSchedule(ReservationVO reservationvo) {
		String response = null;
		if (service.getSchedule(reservationvo)) {
			response = "notEmpty";
		} else {
			response = reservationvo.getReserveTime();
		}
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

}
