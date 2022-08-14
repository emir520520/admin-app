package ca.fangyux.adminapp.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Subject {
    private String subjectName;
    private Integer subjectScore;
}