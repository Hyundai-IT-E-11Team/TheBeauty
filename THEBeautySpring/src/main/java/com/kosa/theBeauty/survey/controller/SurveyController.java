package com.kosa.theBeauty.survey.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kosa.theBeauty.survey.domain.SurveyVO;
import com.kosa.theBeauty.survey.service.SurveyService;
import com.kosa.theBeauty.user.domain.UserVO;
import com.kosa.theBeauty.util.annotation.DebugLog;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("survey")
@RequiredArgsConstructor
public class SurveyController {

	private final SurveyService surveyService;
	
	// 설문 페이지로 이동
	@DebugLog
	@GetMapping("surveyPage")
	public String surveyPage() {
		
		return "/survey/surveyPage";
	}
	
	// 설문 저장 및 상세 페이지 이동
	@DebugLog
	@PostMapping("surveyResult")
	public ResponseEntity<String> surveyResult(@SessionAttribute UserVO currUser,SurveyVO surveyVO) {
		
		String response;
		if(surveyService.insertSurvey(surveyVO)) {
			response = "/theBeauty/reserve/reservationDetailPage";
			return new ResponseEntity<>(response,HttpStatus.OK);
		} else {
			response = "/theBeauty/main/mainPage";
			return new ResponseEntity<>(response,HttpStatus.BAD_REQUEST);
		}
	}
}