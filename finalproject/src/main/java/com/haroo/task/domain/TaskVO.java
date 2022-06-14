package com.haroo.task.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class TaskVO {

    private int id;
    private int groupId;
    private String title;
    private String writer;
    private String content;
    private String start;
    private String end;
    private boolean allDay;
    private String textColor;
    private String backgroundColor;
    private int emNo;
    private String location;
    private String latitude;
    private String longitude;

}
