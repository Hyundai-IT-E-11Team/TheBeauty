package com.kosa.theBeauty.survey.dao;

import com.kosa.theBeauty.survey.domain.SurveyVO;

public interface SurveyDAO {
	
	int insertSurvey(SurveyVO surveyVO);
	SurveyVO selectSurveyByUser(int userSeq);
}
