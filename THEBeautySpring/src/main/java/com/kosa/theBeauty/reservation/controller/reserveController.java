package com.kosa.theBeauty.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.reservation.domain.BrandVO;
import com.kosa.theBeauty.reservation.service.reserveService;

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
	public String reservePage(BrandVO vo, Model model) {
		//상담예약버튼을 누르면 실행
		String brandImgurl = service.getBrandInfo(vo);
		String productImgurl = service.getProductInfo(vo);
		model.addAttribute("brandImgurl",brandImgurl);
		model.addAttribute("productImgurl",productImgurl);
		return "reservation/reservation";
	}
	
	@DebugLog
	@GetMapping("myReservaion")
	public String myReservation() {
		//예약내역 불러오기 로직
		return "reservation/myReservation";
	}
	
	@DebugLog
	@PostMapping("myReservation")
	public String myReservation(/* ReservationVO vo*/Model model) {
		
		//예약 저장하러가기 로직
		return "main/userMain";
	}
}
