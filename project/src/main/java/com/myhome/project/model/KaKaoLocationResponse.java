package com.myhome.project.model;

import java.util.List;

import lombok.Data;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class KaKaoLocationResponse {

    @JsonProperty("documents")
    private List<Document> documents;

    @JsonProperty("meta")
    private Meta meta;

    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Meta {
        @JsonProperty("total_count")
        private Integer totalCount;
    }

    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Document {

    	 @JsonProperty("address")
        private Address address;

        @JsonProperty("road_address")
        private RoadAddress roadAddress;
    }

    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Address {

        @JsonProperty("address_name")
        private String addressName;

        @JsonProperty("region_1depth_name")
        private String region1depthName;

        @JsonProperty("region_2depth_name")
        private String region2depthName;

        @JsonProperty("region_3depth_name")
        private String region3depthName;

        @JsonProperty("mountain_yn")
        private String mountainYn;

        @JsonProperty("main_address_no")
        private String mainAddressNo;

        @JsonProperty("sub_address_no")
        private String subAddressNo;
    }

    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class RoadAddress {

        @JsonProperty("address_name")
        private String addressName;

        @JsonProperty("region_1depth_name")
        private String region1depthName;

        @JsonProperty("region_2depth_name")
        private String region2depthName;

        @JsonProperty("region_3depth_name")
        private String region3depthName;

        @JsonProperty("road_name")
        private String roadName;

        @JsonProperty("underground_yn")
        private String undergroundYn;

        @JsonProperty("main_building_no")
        private String mainBuildingNo;

        @JsonProperty("sub_building_no")
        private String subBuildingNo;

        @JsonProperty("building_name")
        private String buildingName;

        @JsonProperty("zone_no")
        private String zoneNo;
    }
}
