package com.haroo.dayoff.domain;

import lombok.Data;

@Data
public class DayoffVO {
	private int daNo;
	private String daName;
	private int daTotal;
	private int daCnt;
	private int daRemainder;
	private String daHdate;
	private int daApproval;
	private int emNo;
}
