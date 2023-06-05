package com.kosa.theBeauty.openvido.consult;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.reservation.domain.ReservationVO;
import com.kosa.theBeauty.reservation.domain.SatisfactionVO;
import com.kosa.theBeauty.reservation.service.reserveService;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("consult")
@RequiredArgsConstructor
@SessionAttributes(value = {"reservationSeq"})
public class ConsultController {

	private final reserveService service;
	
	@DebugLog
	@GetMapping("/{reservationSeq}")
	public String index(@SessionAttribute UserVO currUser,@PathVariable("reservationSeq") int reservationSeq ,Model model) {
		ReservationVO reserve = service.getReservationBySeq(reservationSeq);
		model.addAttribute("reservation", reserve);
		return "consult/rtcTest";
	}
	
	@DebugLog
	@GetMapping("/end/{reservationSeq}")
	public String end(@SessionAttribute UserVO currUser, @PathVariable("reservationSeq") int reservationSeq, Model model) {
		if(currUser.getRoleNum() == 0) {
			service.setReservationStatusSuccess(reservationSeq);
			model.addAttribute("reservationSeq", reservationSeq);
			return "redirect:/consult/survey";
		} else {
			return "redirect:/reserve/reserveManaging";
		}
	}
	
	@DebugLog
	@GetMapping("survey")
	public String survey() {
		return "consult/survey";
	}
	
	@DebugLog
	@PostMapping("survey")
	public ResponseEntity<String> survey(@SessionAttribute int reservationSeq, SatisfactionVO satisfaction) {
		satisfaction.setReservationSeq(reservationSeq);
		service.createSatisfaction(satisfaction);
		return new ResponseEntity<String>(HttpStatus.OK);
	}
}
