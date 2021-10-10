package com.dodam.controller.members;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dodam.domain.members.MemberVo;
import com.dodam.service.members.MemberService;

//import javax.mail.internet.MimeMessage;
//import org.springframework.mail.javamail.JavaMailSenderImpl;
//import org.springframework.mail.javamail.MimeMessageHelper;

// 이메일 파일 첨부시 import
//import org.springframework.core.io.FileSystemResource;
//import java.io.File;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService service;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerMember() {
	}
	
	@RequestMapping(value="/registerMember.do", method=RequestMethod.POST)
	public String registerMember(MemberVo member, RedirectAttributes rt) {
		System.out.println(member.toString());
		
		if(service.addMember(member)) {
			rt.addFlashAttribute("status", "success");
			rt.addFlashAttribute("memberInfo", member);
		} else {
			rt.addFlashAttribute("status", "fail");
		}
		
		
		return "redirect:/member/mbInfo";  
	}
	
	@RequestMapping(value="/mbInfo", method=RequestMethod.GET)
	public void mbInfo() {
		
	}
	
	@RequestMapping(value="/sendMail.do", method=RequestMethod.GET)
	public ResponseEntity<String> sendMail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResponseEntity<String> result = null;
		
		
		if(service.sendMail(request, response)) {
			
			result = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
	
	
	
	
//	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
//    public void sendMailTest() throws Exception{
//        
//        String subject = "test 메일";
//        String content = "메일 테스트 내용";
//        String from = "bobjjong09@gmail.com";
//        String to = "받는이 아이디@도메인주소";
//        
//        try {
//            MimeMessage mail = mailSender2.createMimeMessage();
//            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
//            // true는 멀티파트 메세지를 사용하겠다는 의미
//            
//            /*
//             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
//             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
//             */
//            
//            mailHelper.setFrom(from);
//            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
//            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
//            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
//            mailHelper.setTo(to);
//            mailHelper.setSubject(subject);
//            mailHelper.setText(content, true);
//            // true는 html을 사용하겠다는 의미입니다.
//            
//            /*
//             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
//             */
//            
//            mailSender2.send(mail);
//            
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//        
//    }



	
	@Autowired
	private JavaMailSender mailSender2;
	
	@RequestMapping(value="/mailCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> getMailCheckCode(String email, HttpServletRequest request) throws Exception{
		System.out.println("유저에게 받은 이메일 주소 : " + email);
		
		ResponseEntity<String> result = null;
		
		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		
		/* 이메일 보내기 */
		String setFrom = "dodamServer@gmail.com";
		String toMail = email;
		String title = "도담 회원가입 인증 이메일 입니다.";
		String content = "도담 홈페이지를 방문해주셔서 감사합니다." +
						" <br><br>" +
						"인증 번호는 " + checkNum +" 입니다." +
						"<br>" + 
						"해당 인증번호를 인증 번호 확인란에 기입하여 주세요." +
						"<br><br>" + 
						"Thank you for visitng Dodam. " +
						"<br>" +
						"certification code is " +checkNum +
						"<br>" +
						"Please write this in Dodam's register email checkbox." + 
						"<br><br>" +
						"<img src=\"cid:dodam.jpg\">";    
		
		try {
			MimeMessage message = mailSender2.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			
			// 이메일 내용에 파일 업로드할 때
			FileSystemResource file = new FileSystemResource(new File("C:\\lecture\\dodamProject\\dodam\\src\\main\\webapp\\resources\\images\\main\\dodam.jpg"));
			helper.addInline("dodam.jpg", file);
			
			
			
			
			mailSender2.send(message);
			result = new ResponseEntity<String>("success", HttpStatus.OK);
			
			HttpSession ses = request.getSession();
			ses.removeAttribute("confirmCode"); // 아래에서 갱신함
			ses.setAttribute("confirmCode", checkNum); // session에 checkNum 이메일인증 번호 confirmCode로 할당함.
		
			System.out.println("ses : " + ses.toString());
			System.out.println("confirmCode : " + ses.getAttribute("confirmCode"));
			
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
//		String checkNumString = Integer.toString(checkNum);
		
		
		return result;
	}
	
	
	
//	/* 이메일 인증 */
//    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
//    @ResponseBody
//    public void mailCheckGET(String email) throws Exception{
//        
//        /* 뷰(View)로부터 넘어온 데이터 확인 */
//        logger.info("이메일 데이터 전송 확인");
//        logger.info("인증번호 : " + email);
//                
//        
//    }
	
	@RequestMapping(value="/getConfirmCode.do", method=RequestMethod.GET)
	public ResponseEntity<String> getConfirmCode(String userCode, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String userCode = request.getParameter("userCode");
		System.out.println("유저에게 입력받은 이메일 확인코드 : " + userCode);
		ResponseEntity<String> result = null;
		
		HttpSession ses = request.getSession();
		String sessionCode = ses.getAttribute("confirmCode").toString();
		
		System.out.println("sessionCode : " + sessionCode);
		
		if (userCode.equals(sessionCode)) {  // 세션에 저장했던 코드와 유저가 입력한 코드가 일치하는지 비교
			result = new ResponseEntity<String>(sessionCode, HttpStatus.OK);
		} else {
			result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
	
	
//	@RequestMapping(value = "/testLogin")
//	public String isComplete(HttpSession session) {
//		return "/naver/naverlogin";
//
//	}
//	
//	@RequestMapping(value = "/callback")
//	public String navLogin(HttpServletRequest request) throws Exception {	
//		return "naver/callback";
//	}	

	
	
	
	
}
