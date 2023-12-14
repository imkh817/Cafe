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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myhome.project.model.PagingPgm;
import com.myhome.project.model.Recommend;
import com.myhome.project.model.Reply;
import com.myhome.project.service.RecommendService;
import com.myhome.project.service.ReplyService;

@Controller
public class RecommendController {

	@Autowired
	private RecommendService service;

	@Autowired
	ReplyService replyService;
	
	@Autowired
	RecommendService recService;
	
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
		System.out.println("들어옴");
		String id = (String) session.getAttribute("id");
		System.out.println(rec_no);
		int deleteresult = 0;
	
		Recommend db = service.getBoard(rec_no);
		
		if(id.equals(db.getMember_id()) || id.equals("master")) { //아이디 일치시

			deleteresult = service.delete(rec_no);
		}		
		
		System.out.println("deleteresult : " + deleteresult);
		
	    if(deleteresult == 1) {
	    	return "Y";
	    }else {
	    	return "N";
	    }
		
	}
	
	// 클라이언트 추천 게시판 목록
	@RequestMapping("/recommendList")
	public String recommendList(String page, Model model, HttpSession session) {

		if (page == null || page.equals("")) {
			page = "1";
		}
		int currentPage = Integer.parseInt(page);
		// 일단 데이터(글)가 페이지에 몇 개를 띄워줄 건지 정해야함
		int rowPerPage = 5;
		// startRow와 endRow는 rowPerPage에 종속될 수 밖에 없다. 그래서 식에 꼭rowPerPage가 들어갈 수 밖에 없다.
		int startRow = (currentPage - 1) * rowPerPage + 1; // 1, 6, 11...
		int endRow = startRow + rowPerPage - 1; // 5, 10, 15...

		// total(db에 있는 전체 데이터 갯수)를 구해야 페이징할 때 페이지를 나눌 수 있으니까
		int total = recService.getTotal();

		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		Recommend recommend = new Recommend();
		recommend.setStartRow(startRow);
		recommend.setEndRow(endRow);

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		list = recService.getList(recommend);


		model.addAttribute("id", session.getAttribute("id"));
		model.addAttribute("list", list);
		model.addAttribute("page", pp);

		return "recommend/recommendList";
	}

	// 추천 게시판 상세 페이지로 이동
	@RequestMapping("/recommendDetail")
	public String recommendDetail(
	    @RequestParam("rec_no") int rec_no,
	    @RequestParam(value = "page", defaultValue = "1") String page,
	    												  Model model,
	    												  HttpSession session) {
	    // 조회수 업데이트
		recService.updatecount(rec_no);

	    // 추천 상세 정보 가져오기
	    Recommend recommend = recService.getBoard(rec_no);

	    String content = recommend.getRec_content().replace("\n", "<br>");
	    System.out.println(content);
	    
	    // 페이징 설정
	    if (page == null || page.equals("")) {
	    	page = "1";
	    }
	    int currentPage = Integer.parseInt(page);
	    int rowPerPage = 5;
	    int startRow = (currentPage - 1) * rowPerPage + 1;
	    int endRow = startRow + rowPerPage - 1;

	    // 해당 추천에 대한 댓글 총 개수 가져오기
	    int total = replyService.getReplyTotal(String.valueOf(rec_no));

	    // 페이징 정보 계산
	    PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

	    // 댓글 가져오기 위한 파라미터 설정
	    Reply reply = new Reply();
	    reply.setStartRow(startRow);
	    reply.setEndRow(endRow);
	    reply.setRec_no(rec_no);

	    // 댓글 목록 가져오기
	    List<Map<String, Object>> list = replyService.getReplyList(reply);

	    // 모델에 속성 추가
	    model.addAttribute("recommend", recommend);
	    model.addAttribute("content", content);
	    model.addAttribute("id", session.getAttribute("id"));
	    model.addAttribute("list", list);
	    model.addAttribute("page", pp);
	    model.addAttribute("rec_no",rec_no);
	    
	    return "recommend/recommendDetail";
	}


	
	// 추천 게시판 댓글 작성
	@RequestMapping("recommendReplyWrite")
	public String recommendReplyWrite( Reply reply, Model model, HttpSession session) {
		Reply check = replyService.replyCheck(reply);
		
	    if(check == null) {
		int result = replyService.insert(reply);
		
		model.addAttribute("reply", reply);
		model.addAttribute("result", result);
		
	    }else if(check != null){
	    	int result = replyService.reInsert(reply);
	    	model.addAttribute("result", result);
	    	
	    }
		return "recommend/replyInsertResult";
	}
	
	// 추천 게시판 댓글 삭제
	@RequestMapping("deleteReply")
	@ResponseBody
	public int deleteReply(Reply reply, Model model, HttpSession session) {
		
		int result = 0;
	    System.out.println("삭제컨트롤러 들어옴");
	    System.out.println("rec_no : " + reply.getRec_no());
	    System.out.println("member_id : " + reply.getMember_id());
	    if(session.getAttribute("id").equals(reply.getMember_id())) {
	    	System.out.println("아이디 일치");
	    	result = replyService.deleteReply(reply.getReply_no());
	    }
//	    System.out.println("result:" + result);
//	    System.out.println("reply_no:" + reply.getReply_no());
//	    
//	    model.addAttribute("result", result);
//	    model.addAttribute("rec_no", reply.getRec_no());	// result에서 디테일로 넘어갈 때 필요
		return result;
	}

}
