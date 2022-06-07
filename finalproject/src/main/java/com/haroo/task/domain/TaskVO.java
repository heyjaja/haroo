package com.haroo.task.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;

@Data
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

}
