package com.kosa.theBeauty.survey.dao;

import com.kosa.theBeauty.survey.domain.SurveyVO;

public interface SurveyDAO {
	
	// 설문 답변 등록
	int insertSurvey(SurveyVO surveyVO);
	SurveyVO selectSurveyByUser(int userSeq);
}
