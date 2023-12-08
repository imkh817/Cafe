package com.myhome.project.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myhome.project.model.Recommend;
import com.myhome.project.service.RecommendService;

@Controller
public class RecommendController {

	@Autowired
	private RecommendService service;

	// 글작성 폼
	@RequestMapping("/recommendWrite")
	public String boardform() {

		return "recommend/recommendWrite";
	}

	// 파일업로드
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public String fileupload(@RequestParam("rec_image1") MultipartFile mf, HttpSession session, Recommend board,
			String page, HttpServletRequest request, Model model) throws Exception {

		String id = (String) session.getAttribute("id");

		System.out.println("테스트 :" + id);
		// 청부파일명
		String filename = mf.getOriginalFilename();
		// 첨부파일 크기
		int size = (int) mf.getSize(); // getSize() 메서드는 long 형식을 반환

		String path = request.getRealPath("upload");
		// 실제 파일 시스템 경로를 반환하는 메서드
		// 이 메서드는 서블릿 컨테이너가 웹 애플리케이션을 배포할 때 생성하는 디렉터리 구조를 기반으로 함.

		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);

		int result = 0;
		// 파일 업로드 후 업로드가 성공했는지 실패했는지를 나타내기 위해

		// 파일 중복 문제 해결
		String file[] = new String[2];
		String newfilename = "";

		// 파일 이름에서 확장자를 추출하는 과정
		// 추출된 확장자는 새로운 파일 이름과 조합되어 고유한 이름으로 사용됨. 이를 통해 업로드되는 파일이 서버에 저장될 때 중복을 피할 수 있음.
		String extension = filename.substring(filename.lastIndexOf("."));

		System.out.println("확장자:" + extension);

		UUID uuid = UUID.randomUUID();
		// 랜덤하게 생성되는 128비트의수

		newfilename = uuid.toString() + extension;

		System.out.println("newfilename:" + newfilename);

		StringTokenizer st = new StringTokenizer(filename, ".");
		// StringTokenizer 클래스는 문자열을 특정 구분자를 기준으로 나누는 데 사용함.

		file[0] = st.nextToken(); // 파일명
		file[1] = st.nextToken(); // 확장자

		if (size > 10000000) {
			result = 1;

			model.addAttribute("result", result);

			return "recommend/sizeResult";

		} else if (!extension.equals(".jpg") && !extension.equals(".jpeg") && !extension.equals(".gif")
				&& !extension.equals(".png")) {

			result = 2;

			System.out.println("result:" + result);
			model.addAttribute("result", result);

			return "recommend/recommendWrite";

		}

		// 첨부파일이 전송된 경우
		if (size > 0) {
			mf.transferTo(new File(path + "/" + newfilename));
			// transferTo() 메서드를 사용하여 업로드된 파일을 서버의 지정된 경로에 저장
			// new File(path + "/" + newfilename)은 저장될 파일의 경로와 파일 이름을 지정하는 부분
		}

		board.setRec_image(newfilename);
		board.setMember_id(id);

		int tmp = service.insert(board);

		if (tmp == 1) {
			model.addAttribute("insertResult", tmp);
			model.addAttribute("page", page);
		}

		return "recommend/insertResult";

	}

	// 글목록
//	@RequestMapping("/recommendList")
//	public String recommendList(@RequestParam(value = "page", defaultValue = "1") int page,
//
//			Model model) {
//
//		int limit = 10;
//		// 한페이지에 출력할 데이터 갯수
//
//		// page = 1, startRow=1, endRow=10
//		// page = 2, startRow=11, endRow=20
//		int startRow = (page - 1) * limit + 1;
//		// 출력하는 데이터의 시작번호
//		int endRow = (page + limit) - 1;
//		// 출력하는 데이터의 끝번호
//
//		// 총데이터 갯수가 있어야 몇페이지로 나눌지 확인할 수 있다.
//		int listcount = service.getCount();
//		System.out.println("listcount:" + listcount);
//
//		// 총페이지
//		int pageCount = listcount / limit + ((listcount % 10 == 0) ? 0 : 1);
//
//		// 페이지바 에서 나타내는 시작하는 번호
//		int startPage = ((page - 1) / 10) * limit + 1; // 1,11,21..
//		// 페이지바에서 나타내는 끝나는 번호
//		int endPage = startPage + 10 - 1; // 10,20,30..
//
//		if (endPage > pageCount)
//			endPage = pageCount;
//
//		List<Map<String, Object>> resultList = new ArrayList<>();
//
//		Recommend recommend = new Recommend();
//
//		recommend.setStartRow(startRow);
//		recommend.setEndRow(endRow);
//
//		resultList = service.getList(recommend);
//
//		model.addAttribute("list", resultList);
//		model.addAttribute("startPage", startPage);
//		model.addAttribute("endPage", endPage);
//		model.addAttribute("pagePerBlk", limit);
//
//		return "recommend/recommendList";
//	}

	// 상세 페이지 : 조회수 1증가 + 상세정보 구하기
//	@RequestMapping("/recommendDetail")
//	public String recommendDetail(@RequestParam("rec_no") int rec_no,
//			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
//
//		// System.out.println("조회수 콘트롤러 rec_no:" + rec_no);
//		service.updatecount(rec_no); // 조회수 1증가
//
//		Recommend recommend = service.getBoard(rec_no); // 상세정보 구하기
//
//		String content = recommend.getRec_content().replace("\n", "<br>");
//
//		model.addAttribute("recommend", recommend);
//		model.addAttribute("rec_no", rec_no);
//		model.addAttribute("page", page);
//		model.addAttribute("content", content);
//
//		return "recommend/recommendDetail";
//	}

	// 수정 폼
	@RequestMapping("/recommendUpdateForm")
	public String boardupdateform(@RequestParam("rec_no") int rec_no,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		System.out.println("들어옴~");
		System.out.println(rec_no);
		System.out.println(page);

		Recommend board = service.getBoard(rec_no); // 상세정보 구하기
		model.addAttribute("board", board);
		model.addAttribute("rec_no", rec_no);
		model.addAttribute("page", page);

		return "recommend/recommendUpdateForm";
	}

	// 글수정
	@RequestMapping("/recommendUpdate")
	public String recommendupdate(Recommend board, @RequestParam("rec_no") int rec_no,
			@RequestParam(value = "page", defaultValue = "1") String page, @RequestParam("rec_image1") MultipartFile mf,
			HttpSession session, HttpServletRequest request, Model model) throws Exception {

		
		
		
		int updateresult = 0;
		
		Recommend db = service.getBoard(board.getRec_no());
		System.out.println(rec_no);

		String id = (String) session.getAttribute("id");
		System.out.println(id);
		System.out.println(db.getMember_id());

		// 청부파일명
		String filename = mf.getOriginalFilename();
		// 첨부파일 크기
		int size = (int) mf.getSize(); // getSize() 메서드는 long 형식을 반환

		String path = request.getRealPath("upload");
		// 실제 파일 시스템 경로를 반환하는 메서드
		// 이 메서드는 서블릿 컨테이너가 웹 애플리케이션을 배포할 때 생성하는 디렉터리 구조를 기반으로 함.

		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);

		int result = 0;
		// 파일 업로드 후 업로드가 성공했는지 실패했는지를 나타내기 위해

		// 파일 중복 문제 해결
		String file[] = new String[2];
		String newfilename = "";

		// 파일 이름에서 확장자를 추출하는 과정
		// 추출된 확장자는 새로운 파일 이름과 조합되어 고유한 이름으로 사용됨. 이를 통해 업로드되는 파일이 서버에 저장될 때 중복을 피할 수 있음.
		String extension = filename.substring(filename.lastIndexOf("."));

		System.out.println("확장자:" + extension);

		UUID uuid = UUID.randomUUID();
		// 랜덤하게 생성되는 128비트의수

		newfilename = uuid.toString() + extension;

		System.out.println("newfilename:" + newfilename);

		StringTokenizer st = new StringTokenizer(filename, ".");
		// StringTokenizer 클래스는 문자열을 특정 구분자를 기준으로 나누는 데 사용함.

		file[0] = st.nextToken(); // 파일명
		file[1] = st.nextToken(); // 확장자

		if (size > 10000000) {
			result = 1;

			model.addAttribute("result", result);

			return "recommend/sizeResult";

		} else if (!extension.equals(".jpg") && !extension.equals(".jpeg") && !extension.equals(".gif")
				&& !extension.equals(".png")) {

			result = 2;

			System.out.println("result:" + result);
			model.addAttribute("result", result);

			return "recommend/recommendWrite";

		}

		// 첨부파일이 전송된 경우
		if (size > 0) {
			mf.transferTo(new File(path + "/" + newfilename));
			// transferTo() 메서드를 사용하여 업로드된 파일을 서버의 지정된 경로에 저장
			// new File(path + "/" + newfilename)은 저장될 파일의 경로와 파일 이름을 지정하는 부분
		}

		board.setRec_image(newfilename);
		board.setMember_id(id);

		if (id.equals(db.getMember_id())) {// 아이디 일치시

			updateresult = service.update(board);
		} else { // 아이디 불일치시
			updateresult = -1;
		}
		System.out.println(updateresult);

		model.addAttribute("result", updateresult);
		model.addAttribute("board", board);
		model.addAttribute("page", page);

		return "recommend/updateResult";
	}


	// 글삭제
	@RequestMapping(value= "/recommendDelete", method= RequestMethod.POST)
	@ResponseBody
	public String recommendDelete(@RequestParam("rec_no") int rec_no, HttpSession session ) {
		
		String id = (String) session.getAttribute("id");
		System.out.println(rec_no);
		int deleteresult = 0;
	
		Recommend db = service.getBoard(rec_no);
		
		if(id.equals(db.getMember_id())) { //아이디 일치시
			deleteresult = service.delete(rec_no);
		}		
		
		System.out.println("deleteresult : " + deleteresult);
		
	    if(deleteresult == 1) {
	    	return "Y";
	    }else {
	    	return "N";
	    }
		
	}

}
