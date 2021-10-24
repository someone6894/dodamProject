package com.dodam.controller.board.proud;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dodam.domain.members.MypointVo;
import com.dodam.domain.proud.PagingProud;
import com.dodam.domain.proud.ProudVo;
import com.dodam.etc.proud.UploadFileProcess;
import com.dodam.etc.proud.UploadFiles;
import com.dodam.service.board.proud.ProudService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/board/proud/*")
public class ProudController {

	@Inject
	private ProudService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ProudController.class);

	@RequestMapping(value ="/listAll", method=RequestMethod.GET)
	public void listAll(Model model, @RequestParam(value="pageNo", required=false, defaultValue="1") String tmp,
			@RequestParam(value ="searchBy", required = false, defaultValue="title") String type,
			@RequestParam(value ="searchWord", required = false, defaultValue="") String word) throws Exception { 
		int pageNo = 1;
		if(!tmp.equals("") || tmp != null) {
			pageNo = Integer.parseInt(tmp);
		} 
		
		System.out.println("검색 타입 : " + type + ", 검색 단어 : " + word);		
		
		Map<String, Object> map = service.readAllBoard(pageNo, type, word);

		List<ProudVo> lst = (List<ProudVo>)map.get("boardList");
		PagingProud pi = (PagingProud)map.get("pagingInfo");

		model.addAttribute("pagingInfo", pi); // 페이징 정보0
		model.addAttribute("proudlistBoard", lst); // 게시판 글 데이터
		
	}
	
	@RequestMapping(value = "/readboard", method=RequestMethod.GET)
	public void readBoard(@RequestParam("no") String tmp, Model model) throws NamingException, SQLException {
		int no = Integer.parseInt(tmp);
		
		ProudVo vo = service.readBoard(no);
		
		model.addAttribute("board", vo);
		
	}
	
	@RequestMapping(value = "/updateboard", method=RequestMethod.GET)
	public void updateBoard(@RequestParam("no") String tmp, Model model) throws NamingException, SQLException {
		int no = Integer.parseInt(tmp);
		
		ProudVo vo = service.readBoard(no);
		
		model.addAttribute("board", vo);
		
	}
	
	
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerBoard() {
		return "/board/proud/registerboard";
	}
	
	
	
	@RequestMapping(value="/uploadFile", method=RequestMethod.POST, produces="text/plain; charset=utf-8")
	public ResponseEntity<String> upFile(MultipartFile upFile, HttpServletRequest request)  { //MultipartFile ��ü�� �������� jsp���ϳ��� ajax���� ÷���ϴ� name�� ���ƾ� �Ѵ�.
		logger.info("업로드 된 파일 처리 시작...");
		
		logger.info("업로드된 파일 이름 : " + upFile.getOriginalFilename());
		logger.info("파일 사이즈 : " + upFile.getSize());
		logger.info("업로드된 파일의 타입 : " + upFile.getContentType());
		logger.info("파일 separator : " + File.separator);
		
		String upPath = request.getSession().getServletContext().getRealPath("resources/uploads/lcj");
		logger.info("업로드 되는 파일 경로 : " + upPath);
		
		UploadFiles files;
		try {
			files = new UploadFileProcess().uploadFile(upPath, upFile.getOriginalFilename(), upFile.getBytes());
			String returnVal = null;
//			if (files.getThumbNailImgFileName() != null) {
				// 이미지 파일이므로 썸네일 이미지 경로 반환
//				returnVal = files.getThumbNailImgFileName();
//			}
//			else if ( files.getNotImgFileName() != null) {
				// 이미지 파일이 아니므로 경로 반환
				returnVal = files.getOriginImgFileName();
//			}
			return new ResponseEntity<String>(returnVal, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value="/delFile", method=RequestMethod.POST, produces="text/plain; charset=utf-8")
	public ResponseEntity<String> delFile(@RequestParam("origin") String origin, @RequestParam("thumb") String thumb,
			@RequestParam("notImg") String notImg, HttpServletRequest request) {
		System.out.println("origin : " + origin + ", thumb : " + thumb);
		String path = request.getSession().getServletContext().getRealPath("resources");
		path += File.separator + "uploads/lcj";
		
		// 이미지가 아닌 파일의 삭제
		if(!notImg.equals("") && origin.equals("")) {	// not이미지가 빈문자열이 아니고 origin이 빈문자열일때.. 이미지가 아닐때
			notImg = notImg.replace('/', File.separatorChar);
			File notImgF = new File(path + notImg); 
			if( notImgF.delete()) {
				return new ResponseEntity<String>(HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);	
			}
			
		}  else if(notImg.equals("") && !origin.equals("")){ // not이미지가 비어있고 이미지가 빈문자열이 아닐 때.. 이미지 일때
			origin = origin.replace('/', File.separatorChar);
			File originFile = new File(path + origin);
				
			System.out.println("지울 파일 :" + (path + origin));
			boolean oBoolean = originFile.delete();
			boolean tBoolean = false;
				
			thumb = thumb.replace('/', File.separatorChar);
			File thumbFile = new File(path + thumb);

			System.out.println("지울 파일 :" + (path + origin));
			tBoolean = thumbFile.delete();
			tBoolean = true;
			
			if (oBoolean && tBoolean) {
			return new ResponseEntity<String>(HttpStatus.OK);
			}	else {
				return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);	
			}
		}
		else {
			return new ResponseEntity<String>(HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="/createBoard", method=RequestMethod.POST)
	public String createBoard(ProudVo vo, RedirectAttributes rttr, HttpServletRequest request) throws NamingException, SQLException {
		System.out.println(vo.toString());

		HttpSession ses = request.getSession();				
		String userid = (String)ses.getAttribute("userid"); // 접속한 유저아이디
		
		if (service.addBoard(vo)) {
			rttr.addFlashAttribute("result", "success");
			service.addpoint(new MypointVo(userid, null, 5, "게시판 작성"));
		} else {
			rttr.addFlashAttribute("result", "fail");
		}
		return "redirect:/board/proud/listAll?pageNo=1";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(ProudVo vo, RedirectAttributes rttr) throws NamingException, SQLException {
		System.out.println(vo.toString());
		
		if (service.updateBoard(vo)) {
			rttr.addFlashAttribute("result", "success");			
		} else {
			rttr.addFlashAttribute("result", "fail");
		}
		return "redirect:/board/proud/listAll?pageNo=1";
	}

	@RequestMapping(value = "/deleteboard", method=RequestMethod.GET)
	public String deleteBoard(@RequestParam("no") String tmp, RedirectAttributes rttr) throws NamingException, SQLException {
		int no = Integer.parseInt(tmp);
		
		if (service.deleteBoard(no)) {
			rttr.addFlashAttribute("result", "success");			
		} else {
			rttr.addFlashAttribute("result", "fail");
		}
		
		return "redirect:/board/proud/listAll?pageNo=1";
	}
	
	@RequestMapping(value = "/writetest", method=RequestMethod.GET)
	public String writetest() throws NamingException, SQLException {
		
		return "product_write";
	}
}
