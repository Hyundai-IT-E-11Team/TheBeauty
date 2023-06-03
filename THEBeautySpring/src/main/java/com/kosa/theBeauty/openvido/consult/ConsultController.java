package com.kosa.theBeauty.openvido.consult;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.reservation.domain.ReservationVO;
import com.kosa.theBeauty.reservation.service.reserveService;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("consult")
@RequiredArgsConstructor
public class ConsultController {

	private final reserveService service;
	
	@DebugLog
	@GetMapping("/{reservationSeq}")
	public String index(@SessionAttribute UserVO currUser,@PathVariable("reservationSeq") int reservationSeq ,Model model) {
		ReservationVO reserve = service.getReservationBySeq(reservationSeq);
		model.addAttribute("reservation", reserve);
		return "consult/rtcTest";
	}
}
