package ca.fangyux.adminapp.entity;

import lombok.*;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Student {
    private Integer studentID;
    private String studentName;
    private Address address;
    private List<Subject> subjects;
}