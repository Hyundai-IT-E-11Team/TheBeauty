package com.kosa.theBeauty.reservation.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	@DebugLog
	@GetMapping("test")
	public String reservePage() {
		//확인용
		return "reservation/test";
	}
	
	@DebugLog
	@PostMapping("reservePage")
	public String reservePage(@SessionAttribute UserVO currUser, BrandVO vo, Model model) {
		//상담예약버튼을 누르면 실행
		vo = service.getBrandInfo(vo);
		model.addAttribute("brandInfo",vo);
		model.addAttribute(currUser);
		return "reservation/reservation";
	}
	
	@DebugLog
	@GetMapping("")
	public String myReservation() {
		//예약내역 불러오기 로직
		return "reservation/myReservation";
	}
	
	//예약저장
	@DebugLog
	@PostMapping("myReservation")
	public String myReservation(@SessionAttribute UserVO currUser,ReservationVO reservationvo, Model model) {
		System.out.println(reservationvo);
		reservationvo.setUserSeq(currUser.getUserSeq());
		reservationvo.setUserName(currUser.getUserName());
		int check = service.setReservation(reservationvo);
		System.out.println(check);
		return "redirect:../main/mainPage";
	}
	
	@DebugLog
	@PostMapping("checkSchedule")
	public  ResponseEntity<String> checkSchedule(ReservationVO reservationvo) {
		String response = null;
		boolean status = service.getSchedule(reservationvo);
		if(status) {
			response = "notEmpty";
			System.out.println(response);
		} else {
			response = reservationvo.getReserveTime();
		}
		/* System.out.println(response); */
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
}
