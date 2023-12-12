package com.myhome.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.UUID;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.myhome.project.model.Member;
import com.myhome.project.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	

	
	  // 회원가입
	   @RequestMapping("joinMember")
	   public String join(@ModelAttribute Member member, Model model) {
	      System.out.println("member_id : " + member.getMember_id());
	      int result = service.insert(member);
	      model.addAttribute("result",result);
	      
	      return "login/join_result";
	   
	}
	// ID 중복검사
	@RequestMapping("member_idCheck")
	public String idCheck(String id,Model model) {
		int result = service.idCheck(id);
		
		model.addAttribute("result",result);
		
		return "login/id_check";
	}
	
	// 닉네임 중복검사
	@RequestMapping("member_nicknameCheck")
	public String nicknameCheck(String nickname,Model model) {
		int result = service.nicknameCheck(nickname);
		
		model.addAttribute("result",result);
		
		return "login/nickname_check";
	}
	
	// 로그인 인증
	@RequestMapping(value = "/member_login_ok", method = RequestMethod.POST)
	public String memberLogins(Member member,
								  HttpSession session,
								  Model model,
								  HttpServletRequest request) throws Exception {
		
		int result = 0;
		System.out.println("폼에서 받아온 아이디 : " + member.getMember_id());
		Member m = service.userCheck(member.getMember_id());
		
		if(m == null) {		// 등록되지 않은 회원
			result = 1;
			
		}else {				// 등록된 회원
			System.out.println("DB에서 꺼낸 아이디 : "+ m.getMember_id());
			if(m.getMember_pw().equals(member.getMember_pw())) { 		// 비번이 같을 때
				session.setAttribute("id", m.getMember_id());
				session.setAttribute("member", m);
				String referer = request.getHeader("Referer");
				referer = referer.substring(referer.lastIndexOf("/")+1);
				
				return "redirect:"+referer;
				
			}else { // 비번 불일치
				result = 2;
			}
		}
		model.addAttribute("result", result);
		return "login/loginResult";
	}
	
	// 로그아웃
	@RequestMapping("member_logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "login/logout";
	}
	
	// 정보수정 폼
	@RequestMapping("member_update")
	public String memberUpdate(HttpSession session, Model model)throws Exception{
		
		Member member = service.getMember((String)session.getAttribute("id"));
		
		String phone = member.getMember_phone1()+"-"+member.getMember_phone2()+"-"+member.getMember_phone3();
//		String email = member.getMember_email()+"@"+member.getMember_domain();
//		
		model.addAttribute("phone", phone);
		model.addAttribute("member", member);
		
		return "mypage/memberupdate";
	}
	
	// 정보수정
	@RequestMapping(value="member_update_ok", method=RequestMethod.POST)
	public String memberUpdateOk(Member member,
								 HttpSession session,
								 Model model) throws Exception{		
		
		int result = service.memberUpdateOk(member);
		
		model.addAttribute("result", result);
		
		return "login/updateResult";
	}
	
	// 아이디 찾기
	@RequestMapping("find_id_ok")
	public String findIdOk(Member member,
						   Model model,
						   HttpSession session) throws Exception{
				
		System.out.println("받아온 member 이름 : " + member.getMember_name());
		Member db = service.findId(member);
		int result = -1;
		if(db != null && db.getMember_email().equals(member.getMember_email())
				      && db.getMember_domain().equals(member.getMember_domain())) {
			result = 1;
			model.addAttribute("id", db.getMember_id());
		}
		model.addAttribute("result", result);
		
		return "login/findIdResult";
		
	}
	// 비밀번호 찾기 이메일 인증 코드 발송
	@RequestMapping("sendVerificationCode")
	public String sendVerificationCode(Member member,
									   String totalEmail,
									   Model model) {
		
		// find_pw.jsp에서 이메일이 나뉘어져 있지 않아서 totalEmail로 받았다.		
		String email[] = totalEmail.split("@");
		member.setMember_email(email[0]);
		member.setMember_domain(email[1]);
		
		Member m = service.emailCheck(member);
		
		UUID uuid = UUID.randomUUID();
		String random = uuid.toString();
		int result;
		
		if(m != null) {	// 회원 정보가 일치
			// Mail Server 설정
						String charSet = "utf-8";
						String hostSMTP = "smtp.naver.com";
						String hostSMTPid = "dkswlgo6615";
						String hostSMTPpwd = "wlgo6615!"; 		// 비밀번호 입력해야함

						// 보내는 사람 EMail, 제목, 내용
						String fromEmail = "dkswlgo6615@naver.com";
						String fromName = "커피 한 잔 할래요";
						String subject = "임시 비밀번호 발급";

						// 받는 사람 E-Mail 주소
						String mail = totalEmail;
						
						try {
							HtmlEmail sendEmail = new HtmlEmail();
							sendEmail.setDebug(true);
							sendEmail.setCharset(charSet);
							sendEmail.setSSL(true);
							sendEmail.setHostName(hostSMTP);
							sendEmail.setSmtpPort(587);

							sendEmail.setAuthentication(hostSMTPid, hostSMTPpwd);
							sendEmail.setTLS(true);
							sendEmail.addTo(mail, charSet);
							sendEmail.setFrom(fromEmail, fromName, charSet);
							sendEmail.setSubject(subject);
							sendEmail.setHtmlMsg("<p align = 'center'>임시 비밀번호입니다.</p><br><p align='center'>로그인 후 비밀번호를 수정해주세요.</p><br>" + "<div align='center'> 임시 비밀번호 : "
									+ random + "</div>");
							sendEmail.send();
						} catch (Exception e) {
							System.out.println(e);
						}
						member.setMember_pw(random);
						service.pwUpdate(member);
						
						result = 1;	// 일치
						
		}else {						// 회원 불일치
			result = 2;
		}
		model.addAttribute("result", result);						
	
		return "login/emailCodeResult";
	}
	
	// 회원 탈퇴폼
	@RequestMapping("member_delete")
	public String memberDelete(HttpSession session, Model model)throws Exception{
		
		Member member = service.getMember((String)session.getAttribute("id"));
		
		model.addAttribute("member", member);
		
		return "mypage/memberDelete";
	}

	// 회원 탈퇴
	@RequestMapping(value = "member_delete_ok")
	public String memberDeleteOk(Member member,
								 HttpSession session) throws Exception{
		
		// session.getAttribute("id")를 쓰려면 무조건 로그인이 된 상태에서 사용할
		// 수 있는 기능들에만 사용해야한다. 왜냐하면 만약 로그인이 안 돼있거나 로그아웃을 했을
		// 경우에는 session에 id 값이 저장되어있지 않기 때문에 null값이니까!
		Member m = service.getMember((String)session.getAttribute("id"));
		
		if(m.getMember_pw().equals(member.getMember_pw())) {
			int reuslt = service.memberDelete(member.getMember_id());
			
			session.invalidate();
			
			return "redirect:main";
		}else {
			System.out.println("비번다름");
		}
		return "mypage/memberDeleteResult";
	}
	
	@RequestMapping("socialMemberDelete")
	public String socialMemberDelete() {
		return "";
	}
	
}













