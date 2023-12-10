package com.myhome.project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myhome.project.model.Cafe;
import com.myhome.project.model.Liked;
import com.myhome.project.model.Review;
import com.myhome.project.service.CafeService;
import com.myhome.project.service.LikedService;
import com.myhome.project.service.MemberService;
import com.myhome.project.service.ReviewService;

@Controller
public class CafeController {

	@Autowired
	private CafeService cafeService;

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LikedService likedService;

	// 관리자 장소등록
	@RequestMapping(value = "/newPlace_ok", method = RequestMethod.POST)
	public String newPlace_ok(@RequestParam("cafe_image1") MultipartFile mf, 
							Cafe cafe, 
							HttpSession session,
							HttpServletRequest request,
			Model model) throws Exception {

		System.out.println("newPlace_ok");

		// 관리자 ID session에서 가져오기
		String adminID = (String)session.getAttribute("adminID");
		// 첨부파일명
		String filename = mf.getOriginalFilename();
		// 첨부파일 크기
		int size = (int) mf.getSize();
		// 저장 디렉토리 위치
		String path = request.getRealPath("upload");

		// 확인해보기
		System.out.println("mf:" + mf);
		System.out.println("filename:" + filename);
		System.out.println("size:" + size);
		System.out.println("Path:" + path);

		// 중복 문제에 사용할 result 변수 생성
		int result = 0;
		// 파일명을 스플릿할 배열 생성
		String file[] = new String[2];
		// 중복 문제에 사용할 새로운 난수 변수 생성
		String newfilename = "";

		// 첨부 파일이 전송된 경우
		if (filename != "") {
			// 파일 중복 문제 해결
			// 확장자 구하기
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			// 파일명 뒤에 붙일 난수를 담을 변수 생성
			UUID uuid = UUID.randomUUID();
			// 난수 + 확장자명 만들기
			newfilename = uuid.toString() + extension;
			// 파일명 문자열을 "."을 기준으로 분리
			StringTokenizer st = new StringTokenizer(filename, ".");
			// 파일명 저장
			file[0] = st.nextToken();
			// 확장자 저장
			file[1] = st.nextToken();

			// 첨부 파일 크기가 100000KB 이상일 때
			if (size > 100000000) {
				result = 1;
				model.addAttribute("result", result);

				return "admin/uploadResult";

			} else if (!file[1].equals("jpg") && 
					!file[1].equals("jpeg") && 
					!file[1].equals("gif") && 
					!file[1].equals("png")) {

				result = 2;
				model.addAttribute("result", result);

				return "admin/uploadResult";
			}
		}

		// 첨부 파일이 있는 경우
		if (size > 0) {
			// cafe_image 변수에 첨부 파일 저장
			mf.transferTo(new File(path + "/" + newfilename));
		}
		
		
		cafe.setCafe_image(newfilename);
		cafeService.cafe_insert(cafe);

		return "admin/newPlace";

	}

	// 관리자 장소 수정
		@RequestMapping(value = "/modifyPlace_ok", method = RequestMethod.POST)
		public String modifyPlace_ok(@RequestParam("cafe_image1") MultipartFile mf, 
								Cafe cafe, 
								HttpSession session,
								HttpServletRequest request,
								Review review,
								Model model) throws Exception {

			
			// 관리자 ID session에서 가져오기
			String adminID = (String)session.getAttribute("adminID");
			
			// 첨부파일명
			String filename = mf.getOriginalFilename();
			// 첨부파일 크기
			int size = (int) mf.getSize();
			// 저장 디렉토리 위치
			String path = request.getRealPath("upload");
			
			// 확인해보기
			System.out.println("mf:" + mf);
			System.out.println("filename:" + filename);
			System.out.println("size:" + size);
			System.out.println("Path:" + path);

			// 중복 문제에 사용할 result 변수 생성
			int result = 0;
			// 파일명을 스플릿할 배열 생성
			String file[] = new String[2];
			// 중복 문제에 사용할 새로운 난수 변수 생성
			String newfilename = "";

			// 첨부 파일이 전송된 경우
			if (filename != "") {
				// 파일 중복 문제 해결
				// 확장자 구하기
				String extension = filename.substring(filename.lastIndexOf("."), filename.length());
				// 파일명 뒤에 붙일 난수를 담을 변수 생성
				UUID uuid = UUID.randomUUID();
				// 난수 + 확장자명 만들기
				newfilename = uuid.toString() + extension;
				// 파일명 문자열을 "."을 기준으로 분리
				StringTokenizer st = new StringTokenizer(filename, ".");
				// 파일명 저장
				file[0] = st.nextToken();
				// 확장자 저장
				file[1] = st.nextToken();

				// 첨부 파일 크기가 100000KB 이상일 때
				if (size > 100000000) {
					result = 1;
					model.addAttribute("result", result);

					return "admin/uploadResult";

				} else if (!file[1].equals("jpg") && 
						!file[1].equals("jpeg") && 
						!file[1].equals("gif") && 
						!file[1].equals("png")) {

					result = 2;
					model.addAttribute("result", result);

					return "admin/uploadResult";
				}
			}

			// 첨부 파일이 있는 경우
			if (size > 0) {
				// cafe_image 변수에 첨부 파일 저장
				mf.transferTo(new File(path + "/" + newfilename));
			}
			
			int cafe_no = cafe.getCafe_no();
			Cafe cafeSelect = cafeService.select(cafe_no);
			
			// 첨부파일 수정 시
			if(size > 0) {
				cafe.setCafe_image(newfilename);
			// 첨부파일 미수정 시
			}else {
				cafe.setCafe_image(cafeSelect.getCafe_image());
			}
			System.out.println("마지막 cafe_image 값:" + cafe.getCafe_image());
			cafeService.cafe_update(cafe);
			
			
			// select
				// 카페 정보
			cafe = cafeService.select(cafe_no);
			System.out.println("cafe:" + cafe);
				// 해시 태그 평균 값
			List<Map<String, Object>> hashAvg = new ArrayList<Map<String, Object>>();
			hashAvg = reviewService.hash_avg(review);
				// 넘어온 값 확인
			for (int i = 0; i < hashAvg.size(); i++)
				System.out.println(hashAvg.get(i));	
				// 별점 평균 값
			double star = reviewService.starAvg(cafe_no);
			System.out.println("star:" + star);
			
			// 하트
			// liked테이블에서 해당 값을 구해오려면 cafe_no와 member_id값이 필요하다.
			session.setAttribute("id", "test1");
			String id = (String) session.getAttribute("id");
			System.out.println("session에 저장된 값:" + id);
			System.out.println("cafe_no: " + cafe_no);
			int result2 = 0;
			if (id != null) {
				Liked liked = new Liked();
				liked.setCafe_no(cafe_no);
				liked.setMember_id(id);
				Liked tmpLiked = likedService.selectLike(liked);
				
				System.out.println("tmpLiked :"+ tmpLiked);
				if (tmpLiked != null) {
					result2 = 1;
				}
			}
			
			
			// 카페 정보
			model.addAttribute("cafe", cafe);
				// 해시 태그 평균 값
			model.addAttribute("hashAvg", hashAvg);
				// 별점 가져오기
			model.addAttribute("star", star);
				// 찜 상태 가져오기
			model.addAttribute("liked",result2);
			return "cafe/detail";

		}
	
	// 찜
		@RequestMapping("/heartClick")
		public void heartClick(String cafe_no, String like_state,HttpSession session) {
			System.out.println("heartClick");
			String id = (String) session.getAttribute("id");
			System.out.println("heartClick id:" + id);
			System.out.println("heartClick cafe_no : " + cafe_no);
			System.out.println("heartClick like_state : " + cafe_no);
			Liked liked = new Liked();
			liked.setCafe_no(Integer.parseInt(cafe_no));
			liked.setMember_id(id);
				
			System.out.println("좋아요 cafe_no : " + cafe_no);
			// 사실 result 변수 필요없음 바꾸기 귀찮아서 안바꿈
			System.out.println("like_state : " + like_state);
			if(like_state.equals("1")) { // 채워진 하트 즉, 찜 했다는 뜻
				likedService.insertLike(liked);
			}else { // 찜을 해제했을 때
				likedService.deleteLike(liked);
			}
			
		}

}
