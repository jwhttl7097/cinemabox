package com.cinemabox.dto.Notice;

import lombok.Data;

@Data
public class NoticeDto {
	private String title;
	private String content;
	private String important ="0";
	private String division = "전체";
}
