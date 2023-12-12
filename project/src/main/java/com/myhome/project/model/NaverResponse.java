package com.myhome.project.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class NaverResponse {

    @JsonProperty("resultcode")
    private String resultCode;

    private String message;

    @JsonProperty("response")
    private ResponseData responseData;

    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ResponseData {

        private String id;
        private String nickname;

        @JsonProperty("profile_image")
        private String profileImage;

        private String age;
        private String email;
        private String mobile;

        @JsonProperty("mobile_e164")
        private String mobileE164;

        private String name;
        private String birthday;

        // getters and setters

        @Override
        public String toString() {
            return "ResponseData{" +
                    "id='" + id + '\'' +
                    ", nickname='" + nickname + '\'' +
                    ", profileImage='" + profileImage + '\'' +
                    ", age='" + age + '\'' +
                    ", email='" + email + '\'' +
                    ", mobile='" + mobile + '\'' +
                    ", mobileE164='" + mobileE164 + '\'' +
                    ", name='" + name + '\'' +
                    ", birthday='" + birthday + '\'' +
                    '}';
        }
    }

    // getters and setters

    @Override
    public String toString() {
        return "ApiResponse{" +
                "resultCode='" + resultCode + '\'' +
                ", message='" + message + '\'' +
                ", responseData=" + responseData +
                '}';
    }
}
