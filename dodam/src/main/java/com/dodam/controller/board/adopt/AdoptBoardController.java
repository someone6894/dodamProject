package com.dodam.controller.board.adopt;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dodam.domain.adopt.AdoptVo;
import com.dodam.domain.adopt.PagingInfoDTO;
import com.dodam.etc.adopt.UploadFileProcess;
import com.dodam.etc.adopt.UploadFiles;
import com.dodam.service.board.adopt.AdoptBoardService;


@Controller
@RequestMapping("/board/adopt/*")
public class AdoptBoardController {

	@Inject
	private AdoptBoardService service;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

	private static Logger logger = LoggerFactory.getLogger(AdoptBoardController.class);

	// adoptboarduser 게시판 등록
	@RequestMapping(value = "/createBoard", method = RequestMethod.POST)
	public String createBoard(AdoptVo vo, RedirectAttributes rttr) throws NamingException, SQLException {
		System.out.println(vo.toString());

		if (service.addBoard(vo)) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "fail");
		}

		return "redirect:/board/adopt/listAll"; // 게시판 등록후 전체 게시글 목록으로 페이지이동

	}

	// adoptboarduser 게시판 게시글 등록 controller호출..
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerBoard() {
		return "/board/adopt/createBoard";
	}

	// adoptboarduser show list all 게시글 전체 출력
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model, @RequestParam(value="pageNo", required=false, defaultValue="1") String tmp ) throws Exception {

		int pageNo = 1;
		if (!tmp.equals("") || tmp != null) {
			pageNo = Integer.parseInt(tmp);
		}
		
		logger.info("adopt user 게시물 출력...페이지넘버 : " + pageNo);

		Map<String, Object> map = service.readAllAdopt(pageNo);
		List<AdoptVo> lst = (List<AdoptVo>) map.get("boardList");
		model.addAttribute("listBoard", lst); // 게시판 글 데이터
		
		
		PagingInfoDTO pi = (PagingInfoDTO)map.get("pagingInfo");
		model.addAttribute("pagingInfo", pi); // 페이징 정보
		
		
	}
	
	
	// adoptboarduser upload file
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> upFile(MultipartFile upFiles, HttpServletRequest request) {
		// MultipartFile 객체의 변수명은 jsp파일내에 ajax에서 첨부하는 name과 같아야 한다

		logger.info("업로드 된 파일 처리 시작....");

		logger.info("업로드된 파일 이름 : " + upFiles.getOriginalFilename());
		logger.info("파일사이즈 : " + upFiles.getSize());
		logger.info("업로드된 파일의 타입 : " + upFiles.getContentType());
		logger.info("파일 separator : " + File.separator);

		String upPath = request.getSession().getServletContext().getRealPath("resources/uploads/phs");
		logger.info("업로드 되는 실제 경로 : " + upPath);

		UploadFiles files;
		try {
			files = new UploadFileProcess().uploadFileRename(upPath, upFiles.getOriginalFilename(), upFiles.getBytes());

			String returnVal = null;
			if (files.getThumbNailImgFileName() != null) {
				// 이미지 파일이므로 썸네일 이미지 경로 반환
				returnVal = files.getThumbNailImgFileName();
			} else if (files.getNotImgFileName() != null) {
				// 이미지 파일이 아니므로 경로 반환
				returnVal = files.getNotImgFileName();
			}
			return new ResponseEntity<String>(returnVal, HttpStatus.OK); // 텍스트로 이미지 경로명 파일명 반환
		} catch (IOException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); // 에러
		}

	}

	// adoptboarduser uploaded file del
	@RequestMapping(value = "/delFile", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> delFile(@RequestParam("origin") String origin, @RequestParam("thumb") String thumb,
			@RequestParam("notImg") String notImg, HttpServletRequest request) {
		System.out.println("origin : " + origin + ", thumb : " + thumb);
		String path = request.getSession().getServletContext().getRealPath("resources");
		path += File.separator + "uploads/phs";
		System.out.println(path);

		// 이미지가 아닌 파일의 삭제
		if (!notImg.equals("") && origin.equals("")) {
			notImg = notImg.replace('/', File.separatorChar);
			File notImgF = new File(path + notImg);
			if (notImgF.delete()) {
				return new ResponseEntity<String>(HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
		} else if (notImg.equals("") && !origin.equals("")) { // 이미지 파일 삭제
			origin = origin.replace('/', File.separatorChar);
			File originFile = new File(path + origin);

			System.out.println("지울 파일 : " + (path + origin));
			boolean oBoolean = originFile.delete();
			boolean tBoolean = false;

			thumb = thumb.replace('/', File.separatorChar);
			File thumbFile = new File(path + thumb);

			System.out.println("지울 파일 : " + (path + thumb));
			tBoolean = thumbFile.delete();
			tBoolean = true;

			if (oBoolean && tBoolean) {
				return new ResponseEntity<String>(HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
		} else {
			return new ResponseEntity<String>(HttpStatus.OK);
		}

	}

	// adoptboarduser show detail page 게시글 상세페이지 보기. 게시글 조회..
	@RequestMapping(value = "/readBoard", method = RequestMethod.GET)
	public void readBoard(@RequestParam("no") String tmp, Model model) throws NamingException, SQLException {
		int no = Integer.parseInt(tmp);
		System.out.println("상세페이지보기");
		AdoptVo vo = service.readBoard(no);

		model.addAttribute("board", vo);
	}

	// adoptboarduser 게시글 수정용 상세페이지 보기
	@RequestMapping(value = "/updateBoard", method = RequestMethod.GET)
	public void updateBoardShow(@RequestParam("no") String tmp, Model model) throws NamingException, SQLException {
		int no = Integer.parseInt(tmp);
		System.out.println("수정용 상세페이지보기 번호: " + no);
		AdoptVo vo = service.readBoard(no);

		model.addAttribute("board", vo);
	}

	// adoptboarduser 게시글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removeBoard(@RequestParam("no") String tmp, Model model) throws NamingException, SQLException {
		int no = Integer.parseInt(tmp);
		service.removeBoard(no);

		System.out.println("게시글 삭제 완료");

		return "redirect:/board/adopt/listAll";
	}

	// adoptboarduser 게시판 수정
	@RequestMapping(value = "/updateBoardInsert", method = RequestMethod.POST)
	public String updateBoardInsert(AdoptVo vo, RedirectAttributes rttr) throws NamingException, SQLException {
		System.out.println(vo.toString());

		if (service.updateBoard(vo)) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "fail");
		}

		System.out.println("수정 완료. 수정된 페이지 번호: " + vo.getNo());
		
		return "redirect:/board/adopt/listAll"; // 게시판 수정후 전체 게시글 목록으로 페이지이동

	}

	
	// 공고 게시판 전체 글 보여주기
	// adoptboardPublic show list all
//	@RequestMapping(value = "/publicAdoptList", method = RequestMethod.GET)
//	public void publicAdoptList(Model model) throws Exception {
//
//		logger.info("adopt Public 게시물 출력...");
//
//		Map<String, Object> map = service.readAllAdoptPublic();
//
//		List<PublicAdoptVo> lst = (List<PublicAdoptVo>) map.get("boardList");
//
//		model.addAttribute("listBoard", lst); // 게시판 글 데이터
//
//	}
	
//	@CrossOrigin(origins = "http://localhost:8081") // 요청 자원을 허락할 origin
	@RequestMapping(value = "/publicAdoptList", method = RequestMethod.GET)
	public String publicAdoptList() throws Exception {
		
		return "board/adopt/public";
	}

	
	// 유기동물 공고 api 불러오기
	@RequestMapping(value = "/public.do", method = RequestMethod.GET)
	public void publicDo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		// 유기동물 보호관리 시스템. 유기동물 조회 api 주소
		// String apiUrl = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20140301&endde=20140430&pageNo=1&numOfRows=10&ServiceKey=LhtsYqsaFhYYq3GuCIigdN7A5khhuIdcyZsvVTvwBZTmkMJ28dJMaAU78ccZMy1isz6RnT6kiaYvHFjB9pDNSA%3D%3D";

		// **경고 numOfRows 너무크게 주면 다운됨 **
		// endde 없앰 -> 20210101 ~ 최근 자료까지나옴 , pageNo=1 , numOfRows=50 줌
		String apiUrl = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20210101&endde=&pageNo=1&numOfRows=50&ServiceKey=LhtsYqsaFhYYq3GuCIigdN7A5khhuIdcyZsvVTvwBZTmkMJ28dJMaAU78ccZMy1isz6RnT6kiaYvHFjB9pDNSA%3D%3D";

		HttpURLConnection con = connect(apiUrl); // con 디비 접속 객체 = api 연결 준비
		String adoptApiSource = null;
		
		
		try {
			con.setRequestMethod("GET"); // 통신방식 지정

			int respCode = con.getResponseCode(); // 응답 코드 가져옴
			
			System.out.println("respCode : " + respCode); // 결과가 200이면 통신성공
			if (respCode == HttpURLConnection.HTTP_OK) { // 응답 완료 == 통신성공
				adoptApiSource = readBody(con.getInputStream()); // api 읽어와서 String타입 json 변수에 할당.
			}

		} catch (IOException e1) {
			// TODO Auto-generated catch block
			System.out.println("통신실패");
			e1.printStackTrace();
		} finally {
			con.disconnect();
		}
		
		//
		System.out.println("받아온 adoptApiSource list : " + adoptApiSource); 

		response.setContentType("application/xml; charset=utf-8;");
		PrintWriter out = response.getWriter();
		out.print(adoptApiSource); // adoptApiSource 을 JSP의 ajax로 되돌려줌. => xml형식
		
	}
	// 유기동물 공고 api 불러오기 publicDo 메소드 끝
	
	
	// pageInfo Page 호출
		@RequestMapping(value = "/publicInfo", method = RequestMethod.GET)
		public void publicInfo(@RequestParam("no") String no) throws Exception {
			System.out.println("앞단의 선택한 dsertionNo : " + no);
			
			// return "board/adopt/publicInfo";
		}
		
		
	
	// pageInfo 정보 ajax 통신 호출
	@RequestMapping(value = "/publicInfo.do", method = RequestMethod.GET)
	public void publicInfo(HttpServletResponse response, @RequestParam("no") String no) throws Exception {
		System.out.println("앞단의 선택한 dsertionNo : " + no);
		
		
		
		String apiUrl = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20210101&endde=&pageNo=1&numOfRows=100&ServiceKey=LhtsYqsaFhYYq3GuCIigdN7A5khhuIdcyZsvVTvwBZTmkMJ28dJMaAU78ccZMy1isz6RnT6kiaYvHFjB9pDNSA%3D%3D";
		HttpURLConnection con = connect(apiUrl); // con 디비 접속 객체 = api 연결 준비
		String adoptApiSource = null;
		
		try {
			con.setRequestMethod("GET"); // 통신방식 지정
			int respCode = con.getResponseCode(); // 응답 코드 가져옴
			System.out.println("respCode : " + respCode); // 결과가 200이면 통신성공
			if (respCode == HttpURLConnection.HTTP_OK) { // 응답 완료 == 통신성공
				adoptApiSource = readBody(con.getInputStream()); // api 읽어와서 String타입 json 변수에 할당.
			}

		} catch (IOException e1) {
			// TODO Auto-generated catch block
			System.out.println("통신실패");
			e1.printStackTrace();
		} finally {
			con.disconnect();
		}
		
		//
		System.out.println("받아온 adoptApiSource detail : " + adoptApiSource); 
		response.setContentType("application/xml; charset=utf-8;");
		PrintWriter out = response.getWriter();
		out.print(adoptApiSource); // adoptApiSource 을 JSP의 ajax로 되돌려줌. => xml형식
		
		// return "board/adopt/publicInfo";
	}
	
	
	
	
	// api url 접속개체 생성 메소드
	private static HttpURLConnection connect(String apiUrl) {
		HttpURLConnection con = null;

		try {
			URL url = new URL(apiUrl); // String 타입의 apiUrl 을 담은 url객체 생성
			con = (HttpURLConnection) url.openConnection(); // 객체를 통해서 접속준비, HttpURLConnection 객체 con 에 할당
		} catch (MalformedURLException e) {
			System.out.println("url주소가 잘못되었습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("서버 접속 실패");
			e.printStackTrace();
		}
		return con;
	}
	// api url 접속개체 생성 메소드 끝
	
	
	// db접속 con 객체 설정 한후의 응답코드로 api 읽어오는 메소드
	private String readBody(InputStream inputStream ) { // InputStream 은 con.getInputStream()을 할당 받는다.

		InputStreamReader streamReader = null;

		try {
			streamReader = new InputStreamReader(inputStream, "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		BufferedReader lineReader = new BufferedReader(streamReader);
		StringBuilder responseBody = new StringBuilder();

		String line = null;

		try {
			while ( (line = lineReader.readLine() ) != null ) {
				responseBody.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return responseBody.toString();
	}
	// readBody 끝

	// adoptboardmini 최상단 3개 게시글 출력용 -> homeController로 이동
//	@RequestMapping(value = "/adoptboardmini", method = RequestMethod.GET)
//	public String boardminiList(Model model, @RequestParam(value="pageNo", required=false, defaultValue="1") String tmp ) throws Exception {
//
//		System.err.println("boardmini 컨트롤단 출력");
//		int pageNo = 1;
//		if (!tmp.equals("") || tmp != null) {
//			pageNo = Integer.parseInt(tmp);
//		}
//		
//		logger.info("boardmini 게시물 출력...페이지넘버 : " + pageNo);
//
//		Map<String, Object> map = service.readAllAdopt(pageNo);
//		List<AdoptVo> lst = (List<AdoptVo>) map.get("boardList");
//		model.addAttribute("boardminiList", lst); // 게시판 글 데이터
//		
//		return "board/adopt/adoptboardmini";
//	}
	
} // controller 끝
