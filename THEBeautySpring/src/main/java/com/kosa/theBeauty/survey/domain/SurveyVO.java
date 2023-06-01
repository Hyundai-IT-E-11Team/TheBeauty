package com.kosa.theBeauty.survey.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SurveyVO {
	private int userSeq;
	private String surveySkintype;
	private String surveyPersonalColor;
	private String surveyJewelryColor;
	private String surveySkintone;
}
