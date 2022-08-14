package ca.fangyux.adminapp.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Address {
    private String province;
    private String city;
    private String street;
}