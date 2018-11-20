package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SimsSignAddressPojo {
    private String indoor_building_id;
    private double latitude;
    private String accuracy;
    private String indoor_building_floor;
    private String indoor_building_type;
    private String speed;
    private double longitude;
    private String errMsg;
}
