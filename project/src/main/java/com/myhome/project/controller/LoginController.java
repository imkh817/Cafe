package com.myhome.project.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.myhome.project.model.KakaoProfile;
import com.myhome.project.model.Member;
import com.myhome.project.model.NaverLoginBO;
import com.myhome.project.model.OAuthToken;
import com.myhome.project.service.MemberService;
 
/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
 
    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
    @Autowired
	MemberService service;
 
    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
        
        /* 생성한 인증 URL을 View로 전달 */
        return "login/loginModal";
    }
    
    
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/callback", method = RequestMethod.GET)
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
        System.out.println("여기는 callback");
        
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(apiResult);
        
        // Jackson ObjectMapper를 사용하여 JSON 데이터 파싱
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(apiResult);

        // "response" 객체 내의 "id" 필드 추출
        JsonNode responseNode = jsonNode.get("response");
        String naverId = responseNode.get("id").asText();
        String naverName = responseNode.get("name").asText();
        String naverNickname = responseNode.get("nickname").asText();
        // 이메일 등록안되어 있는 사람도 있음 ㅜ
        String naverEmail = responseNode.get("email").asText();
        // 전화번호 파싱(2줄로)
        String phone = responseNode.get("mobile").asText();
        String phoneParsing[] = phone.split("-");
        // 이메일 파싱(1줄로)
       String emailParsing[] = responseNode.get("email").asText().split("@");
        
        Member member = new Member();
        member.setMember_id(naverId);
        member.setMember_name(naverName);
        member.setMember_nickname(naverNickname);
        //파싱한 이메일 등록
        member.setMember_email(emailParsing[0]);
        member.setMember_domain(emailParsing[1]);
        // 파싱한 폰넘버 등록
        member.setMember_phone1(phoneParsing[0]);
        member.setMember_phone2(phoneParsing[1]);
        member.setMember_phone3(phoneParsing[2]);
        
        // 회원 확인
        int result = 0;  // 카카오 로그인 성공여부 확인 -> 1:신규, 2:기존 회원
        Member userCheck = service.userCheck(naverId);
        if(userCheck == null) {	// 신규 회원
        	result = service.insert(member); // --> 신규 회원 DB등록
        }
       
        model.addAttribute("naverResult",result);
        model.addAttribute("name",member.getMember_nickname());
        session.setAttribute("id", member.getMember_id());
        session.setAttribute("member", member);
        
        /* 네이버 로그인 성공 페이지 View 호출 */
        return "login/join_result";
    }    
    
    // 카카오
    @GetMapping("/callback2")
	public String callback(String code, Member member, Model model, HttpSession session) { // @ResponseBody : 데이터를 리턴해주는
																							// 함수
		// code 로 데이터를 쿼리 스트링으로 넘겨주니까
		// token 을 발급 받는 이유 : 카카오 리소스 서버에 등록된 (현재 로그인을 한 사람의 )개인정보를 응답 받기 위해서

		// POST방식으로 key-value 데이터를 카카오 쪽으로 요청
		// HttpsURLConnection url = new HttpsURLConnection(); --> 예전에 사용하던 코드
		RestTemplate rt = new RestTemplate();

		// Http Header 데이터를 담을 Object 생성
		HttpHeaders headers = new HttpHeaders();
		// HTML 폼(form) 데이터를 서버로 전송할 때 사용되는 인코딩 타입(Content-Type) 중 하나이다.
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); 
		
		// 내가 지금 전송할 HTTP body데이터가 key-value 형태의 데이터임을 알려주는 것.

		// Http body 데이터를 담을 Object 생성
		// MultiValueMap -> Map의 상위 버전 (spring API 공식 문서에 있음)
		// -> 여러 값을 저장하는 맵 인터페이스의 확장
		// 그냥 Map을 사용하면 안되는 것 인가?
		// --> MultiValueMap을 사용하는 이유는 하나의 키에 여러 값을 가질 수 있기 때문이다. 여러 값이 동일한 키를 공유할 때 유용하다.
		// 일반적으로 HTTP 폼 데이터나 쿼리 매개변수와 같이 여러 값이 하나의 키에 매핑되는 경우에 많이 사용된다.

		// 만약 여러 값을 가지는 데이터를 처리해야 할 때 Map 대신 MultiValueMap을 사용하는 것이 좋다.
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();

		params.add("grant_type", "authorization_code");
		params.add("client_id", "bdffe1412686d86c80754e7a2a386569");
		params.add("redirect_uri", "http://localhost/project/callback2");
		params.add("code", code);
// ------------------------------------------
		// Header 와 Body 데이터를 가지고 있는 하나의 Object Entity가 된다.
		// 왜 Entity에 넣냐면, exchage 함수가 HttpEntity Object를 받기 때문이다.
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// Http 요청하기 - POST방식으로 - 그리고 response변수의 응답을 받음 .
		// rt.exchange -> Http헤더를 새로 만들 수 있고, 어떤 HTTP 메소드 사용가능하다.
		ResponseEntity<String> response = rt.exchange(

				// 자원 , 행위, 표현
				// 토큰 요청시 발급 주소
				"https://kauth.kakao.com/oauth/token", HttpMethod.POST, kakaoTokenRequest, String.class

		);

		// Gson, Json Simple, ObjectMapper 라이브러리 추가해야함.
		ObjectMapper objectMapper = new ObjectMapper();

		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) { // 파싱할 때 이름이 매치가 안되서 오류나는 것을 찾아줌.
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		System.out.println("카카오 엑세스 토큰: " + oauthToken.getAccess_token());

		
		RestTemplate rt2 = new RestTemplate();

		// Http Header 데이터를 담을 Object 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		// 내가 지금 전송할 HTTP body데이터가 key-value 형태의 데이터임을 알려주는 것.

		// Header 와 Body 데이터를 가지고 있는 하나의 Object Entity가 된다.
		// 왜 Entity에 넣냐면, exchage 함수가 HttpEntity Object를 받기 때문이다.
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);

		// Http 요청하기 - POST방식으로 - 그리고 response변수의 응답을 받음 .
		ResponseEntity<String> response2 = rt2.exchange(
				// 토큰 요청시 발급 주소
				"https://kapi.kakao.com/v2/user/me", HttpMethod.POST, kakaoProfileRequest2, String.class

		);

		ObjectMapper objectMapper2 = new ObjectMapper();

		KakaoProfile kakaoProfile = null;

		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) { // 파싱할 때 이름이 매치가 안되서 오류나는 것을 찾아줌.
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		if (kakaoProfile != null) {
			System.out.println("카카오 아이디(번호): " + kakaoProfile.getId());
			System.out.println("카카오 이메일: " + kakaoProfile.getKakao_account().getEmail());

		} else {
			System.out.println("카카오 프로필이 null입니다.");
		}

		// KakaoProfile에서 필요한 정보 추출하여 member에 설정

		member.setMember_id(kakaoProfile.getId());

		member.setMember_name(kakaoProfile.getKakao_account().getName());

		member.setMember_nickname(kakaoProfile.getProperties().getNickname());

		// 이메일 설정
		String[] emailPashing = kakaoProfile.getKakao_account().getEmail().split("@");
		member.setMember_email(emailPashing[0]);
		member.setMember_domain(emailPashing[1]);

		System.out.println("파싱성공");
		
		String phonePashing = kakaoProfile.getKakao_account().getPhone_number();
		System.out.println("phonePashing : " + phonePashing);
		System.out.println("pashingLength : " + phonePashing.length());
		
		
		
	
		
		
		if (phonePashing != null && !phonePashing.isEmpty()) {
			// 숫자만 추출하여 전화번호 설정
			String pp = phonePashing.substring(4);
			
			System.out.println("pp : " + pp);
			String pashing[] = pp.split("-");
			pashing[0] = "0"+pashing[0];
			
			for(int i=0; i<pashing.length; i++) {
				System.out.println("pashing["+i+"] : " + pashing[i]);
			}

			if (pashing.length == 3) {
				try {
					member.setMember_phone1(pashing[0]);
					member.setMember_phone2(pashing[1]);
					member.setMember_phone3(pashing[2]);
				} catch (NumberFormatException e) {
					// 숫자로 변환할 수 없는 경우 예외 처리
					// 적절한 오류 메시지 또는 로깅을 추가하세요
				}
			} else {
				// 오류 처리: 전화번호의 형식이 올바르지 않음
				// 예를 들어, 파트가 3개가 아닌 경우 등의 상황 처리를 추가하세요
				// 적절한 오류 메시지 또는 로깅을 추가하세요
			}
		}

		// 회원 확인
		Member userCheck = service.KakaoUserCheck(member.getMember_id());
		int result = 0;
		if (userCheck == null) { // 신규 회원
			result = service.insertKakao(member);
		} else { // 기존 회원
		}
		session.setAttribute("id", member.getMember_id());
		model.addAttribute("kakaoResult", result);
		model.addAttribute("name",member.getMember_name());
		session.setAttribute("member", member);

		return "login/join_result";

	}


}




