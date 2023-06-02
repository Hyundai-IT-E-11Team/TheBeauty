package com.kosa.theBeauty.openvido.consult;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kosa.theBeauty.reservation.domain.ReservationVO;
import com.kosa.theBeauty.reservation.service.reserveService;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("consult")
@RequiredArgsConstructor
public class ConsultController {

	private final reserveService service;
	
	@GetMapping("")
	public String index(@SessionAttribute UserVO currUser,Model model) {
		ReservationVO reserve = service.getReservation(currUser.getUserSeq());
		model.addAttribute("reservation", reserve);
		return "consult/rtcTest";
	}
}
