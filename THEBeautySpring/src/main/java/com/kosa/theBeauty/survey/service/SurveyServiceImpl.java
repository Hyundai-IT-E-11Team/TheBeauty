package com.kosa.theBeauty.survey.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.survey.dao.SurveyDAO;
import com.kosa.theBeauty.survey.domain.SurveyVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SurveyServiceImpl implements SurveyService {

	private final SurveyDAO dao;

	public boolean insertSurvey(SurveyVO surveyVO) {

		int cnt = dao.insertSurvey(surveyVO);
		if (cnt != -1) {
			return false;
		} else {
			return true;
		}
	}

	public SurveyVO seleSurveyVO(int userSeq) {

		return dao.selectSurveyByUser(userSeq);
	}
}
