package com.kosa.theBeauty.survey.service;

import com.kosa.theBeauty.survey.domain.SurveyVO;

public interface SurveyService {

	boolean insertSurvey(SurveyVO surveyVO);
	SurveyVO seleSurveyVO(int userSeq);
}
