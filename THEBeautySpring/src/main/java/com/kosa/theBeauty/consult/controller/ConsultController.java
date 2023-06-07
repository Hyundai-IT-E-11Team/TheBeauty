package com.kosa.theBeauty.consult.controller;

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

import com.kosa.theBeauty.reservation.domain.ReservationVO;
import com.kosa.theBeauty.reservation.domain.SatisfactionVO;
import com.kosa.theBeauty.reservation.service.ReserveService;
import com.kosa.theBeauty.reservation.service.ReserveServiceImpl;
import com.kosa.theBeauty.survey.service.SurveyService;
import com.kosa.theBeauty.user.domain.UserVO;
import com.kosa.theBeauty.util.annotation.DebugLog;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("consult")
@RequiredArgsConstructor
@SessionAttributes(value = {"reservationSeq"})
public class ConsultController {

	private final ReserveService reserveService;
	private final SurveyService surveyService;
	
	@DebugLog
	@GetMapping("/{reservationSeq}")
	public String index(@SessionAttribute UserVO currUser,@PathVariable("reservationSeq") int reservationSeq ,Model model) {
		
		ReservationVO reserve = reserveService.getReservationBySeq(reservationSeq);
		model.addAttribute("reservation", reserve);
		model.addAttribute("userInfo", surveyService.seleSurveyVO(reserve.getUserSeq()));
		return "consult/rtcTest";
	}
	
	@DebugLog
	@GetMapping("/end/{reservationSeq}")
	public String end(@SessionAttribute UserVO currUser, @PathVariable("reservationSeq") int reservationSeq, Model model) {
		
		if(currUser.getRoleNum() == 0) {
			reserveService.setReservationStatusSuccess(reservationSeq);
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
		reserveService.createSatisfaction(satisfaction);
		return new ResponseEntity<String>(HttpStatus.OK);
	}
}
