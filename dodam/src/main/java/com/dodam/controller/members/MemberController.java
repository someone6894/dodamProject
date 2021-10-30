package com.dodam.controller.members;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dodam.domain.members.MemberVo;
import com.dodam.domain.members.MypointVo;
import com.dodam.domain.proud.ProudVo;
import com.dodam.service.members.MemberService;

//import javax.mail.internet.MimeMessage;
//import org.springframework.mail.javamail.JavaMailSenderImpl;
//import org.springframework.mail.javamail.MimeMessageHelper;

// 이메일 파일 첨부시 import
//import org.springframework.core.io.FileSystemResource;
//import java.io.File;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	private MemberService service;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerMember() {
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginMember() {

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutMember(HttpServletRequest request) {

		HttpSession ses = request.getSession();
		ses.removeAttribute("loginSession"); // 로그인세션 갱신
		ses.removeAttribute("userid"); // 로그인한 아이디 갱신
		System.out.println("ses.toString() : " + ses.toString());

		return "index";

	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageMember(Model model, HttpServletRequest request, RedirectAttributes rt) throws NamingException, SQLException {

		HttpSession ses = request.getSession();				
		String userid = (String)ses.getAttribute("userid"); // 접속한 유저아이디
		
		String grade = null;
		int sumpoint = 0;
		if (service.countpoint(userid) != 0) {
			sumpoint = service.sumpoint(userid);

			grade = service.grade(sumpoint);
			model.addAttribute("grade", grade);
		}
		model.addAttribute("sumpoint", sumpoint); // 포인트 총합			
		
		int bookmarkcount = service.bookmarkcount(userid); // 북마크 개수
		model.addAttribute("bookmarkcount", bookmarkcount);
		
		int countboard = service.countboard(userid);
		model.addAttribute("countboard", countboard); // 게시판 작성 개수
		
		int countreplyer = service.countreplyer(userid);
		model.addAttribute("countreplyer", countreplyer); // 댓글 작성 개수
		
		
		return "member/mbInfo";
	}

	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmark(Model model, HttpServletRequest request, RedirectAttributes rt) throws NamingException, SQLException {

		HttpSession ses = request.getSession();				
		String userid = (String)ses.getAttribute("userid"); // 접속한 유저아이디
	
		Map<String, Object> map = service.bookmark(userid);
		List<MypointVo> lst = (List<MypointVo>)map.get("bookmark2");
		model.addAttribute("bookmark", lst); // 게시판 글 데이터
		System.out.println(lst);

		return "member/bookmark";
	}

	
	@RequestMapping(value = "/membergrade", method = RequestMethod.GET)
	public String membergrade(Model model, HttpServletRequest request, RedirectAttributes rt) throws NamingException, SQLException {

	
		Map<String, Object> map = service.membergrade();
		List<MypointVo> lst = (List<MypointVo>)map.get("membergrade2");
		model.addAttribute("membergrade", lst); // 게시판 글 데이터
		System.out.println(lst);

		return "member/membergrade";
	}
	
	@RequestMapping(value = "/pointlist", method = RequestMethod.GET)
	public String pointlist(Model model, HttpServletRequest request, RedirectAttributes rt) throws NamingException, SQLException {

		HttpSession ses = request.getSession();			
		String userid = (String)ses.getAttribute("userid");
		
		
		Map<String, Object> map = service.pointlist(userid);
		List<MypointVo> lst = (List<MypointVo>)map.get("pointlist2");
		model.addAttribute("pointlist", lst); // 게시판 글 데이터

		
		
		return "member/pointlist";
	}
	
	@RequestMapping(value = "/boardhistory", method = RequestMethod.GET)
	public String boardhistory(Model model, HttpServletRequest request, RedirectAttributes rt) throws NamingException, SQLException {

		HttpSession ses = request.getSession();			
		String userid = (String)ses.getAttribute("userid");
		
		
		Map<String, Object> map = service.boardhistory(userid);
		List<MypointVo> lst = (List<MypointVo>)map.get("boardhistory2");
		model.addAttribute("boardhistory", lst); // 게시판 글 데이터

		
		
		return "member/boardhistory";
	}
	
	@RequestMapping(value = "/replyerhistory", method = RequestMethod.GET)
	public String replyerhistory(Model model, HttpServletRequest request, RedirectAttributes rt) throws NamingException, SQLException {

		HttpSession ses = request.getSession();			
		String userid = (String)ses.getAttribute("userid");
		
		
		Map<String, Object> map = service.replyerhistory(userid);
		List<MypointVo> lst = (List<MypointVo>)map.get("replyerhistory2");
		model.addAttribute("replyerhistory", lst); // 게시판 글 데이터

		
		
		return "member/replyhistory";
	}
	
	@RequestMapping(value = "/registerMember.do", method = RequestMethod.POST)
	public String registerMember(MemberVo member, RedirectAttributes rt) {
		System.out.println(member.toString());

		if (service.addMember(member)) {
			rt.addFlashAttribute("status", "success");
			rt.addFlashAttribute("memberInfo", member);
		} else {
			rt.addFlashAttribute("status", "fail");
		}

		return "redirect:/member/mbInfo";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginMember(MemberVo mem, RedirectAttributes rt, HttpServletRequest request) {
		System.out.println("입력받은 회원정보 : " + mem.toString());

		MemberVo member = null;
		
		try {
			member = service.loginMember(mem);
			
			System.out.println("db에서 확인하여 가져온 회원정보 : " + member.toString());

			if (member != null) {
				rt.addFlashAttribute("status", "logingsuccess");
				rt.addFlashAttribute("memberInfo", member);

				HttpSession ses = request.getSession();
				ses.removeAttribute("loginSession"); // 로그인세션 갱신
				ses.setAttribute("userid", member.getUserid()); // session에 userid 이름으로 userid를 넣음(mypage용)
				ses.setAttribute("loginSession", member); // session에 member정보 loginSession 이름으로 할당함

				System.out.println("ses : " + ses.toString());
				System.out.println("loginSession : " + ses.getAttribute("loginSession"));
				System.out.println("유저아이디 : " + ses.getAttribute("userid"));
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
			
			if(member == null ) {
				rt.addFlashAttribute("status", "logingfail");
				return "redirect:/member/login";
			}
			
		}

		return "redirect:/";
	}

	@RequestMapping(value = "/mbInfo", method = RequestMethod.GET)
	public void mbInfo() {

	}

	

//	@RequestMapping(value = "/sendMail.do", method = RequestMethod.GET)
//	public ResponseEntity<String> sendMail(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		ResponseEntity<String> result = null;
//
//		if (service.sendMail(request, response)) {
//
//			result = new ResponseEntity<String>("success", HttpStatus.OK);
//		} else {
//			result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
//		}
//
//		return result;
//	}

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

	@RequestMapping(value = "/mailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> getMailCheckCode(String email, HttpServletRequest request) throws Exception {
		System.out.println("유저에게 받은 이메일 주소 : " + email);

		ResponseEntity<String> result = null;

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "dodamServer@gmail.com";
		String toMail = email;
		String title = "도담 회원가입 인증 이메일 입니다.";
		String content = "도담 홈페이지를 방문해주셔서 감사합니다." + " <br><br>" + "인증 번호는 " + checkNum + " 입니다." + "<br>"
				+ "해당 인증번호를 인증 번호 확인란에 기입하여 주세요." + "<br><br>" + "Thank you for visitng Dodam. " + "<br>"
				+ "certification code is " + checkNum + "<br>" + "Please write this in Dodam's register email checkbox."
				+ "<br><br>";
				
//"<img src=\"cid:dodam.jpg\">";

		try {
			MimeMessage message = mailSender2.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);

			// 이메일 내용에 파일 업로드할 때
//			FileSystemResource file = new FileSystemResource(new File(
//					"C:\\lecture\\dodamProject\\dodam\\src\\main\\webapp\\resources\\images\\main\\dodam.jpg"));
			
//			helper.addInline("dodam.jpg", file);

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

	@RequestMapping(value = "/getConfirmCode.do", method = RequestMethod.GET)
	public ResponseEntity<String> getConfirmCode(String userCode, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
//		String userCode = request.getParameter("userCode");
		System.out.println("유저에게 입력받은 이메일 확인코드 : " + userCode);
		ResponseEntity<String> result = null;

		HttpSession ses = request.getSession();
		String sessionCode = ses.getAttribute("confirmCode").toString();

		System.out.println("sessionCode : " + sessionCode);

		if (userCode.equals(sessionCode)) { // 세션에 저장했던 코드와 유저가 입력한 코드가 일치하는지 비교
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

	@RequestMapping(value = "/infoupdate", method = RequestMethod.GET)
	public String infoupdate() {

		return "member/infoupdate";
	}

	@RequestMapping(value = "/passwordupdate", method = RequestMethod.GET)
	public String passwordupdate() {

		return "member/passwordupdate";
	}

	@RequestMapping(value = "/emailupdate", method = RequestMethod.GET)
	public String emailupdate(HttpServletRequest request) {

		
		
		// 1. 유저가 입력한 이메일 정보로 가입된 회원정보 확인
			String email = request.getParameter("email");
			System.out.println("유저에게 받은 이메일 주소 : " + email);
			
			MemberVo mem = null;
			ResponseEntity<String> result = null;
			
			mem = service.findMember(email);
					
					if(mem != null) {
						// 입력한 이메일로된 회원정보가 있을때 뷰단에 findSuccess 바인딩, 성공 메세지 띄우기
//						rt.addFlashAttribute("status", "findSuccess");
						System.out.println("유저에게 받은 이메일의 회원 정보 : " + mem.toString());
					}
						
		
		
		return "member/emailupdate";
	}

	@RequestMapping(value = "/deleteAccount", method = RequestMethod.GET)
	public String deleteAccount() {

		return "member/deleteAccount";
	}

	@RequestMapping(value = "/infoupdatecomp", method = RequestMethod.POST)
	public String infoupdatecomp(MemberVo member, RedirectAttributes rttr, HttpServletRequest request) throws NamingException, SQLException {

		System.out.println("유저에게 입력받은 : " + member.toString());
		
		if (service.infoupdate(member)) {
			rttr.addFlashAttribute("result", "success");
			HttpSession ses = request.getSession();
			ses.removeAttribute("loginSession"); // 로그인세션 갱신
			ses.setAttribute("loginSession", member); // session에 member정보 loginSession 이름으로 할당함		
			
		} else {
			rttr.addFlashAttribute("result", "fail");
		}
		return "redirect:/member/mbInfo";
	}
	

	@RequestMapping(value = "/passwordupdatecomp", method = RequestMethod.POST)
	public String passwordupdatecomp(MemberVo member, RedirectAttributes rttr, HttpServletRequest request) throws NamingException, SQLException {
		
		System.out.println("유저에게 입력  : " + member.toString());
		
		if (service.passwordupdate(member)) {
			rttr.addFlashAttribute("result", "success");	

			HttpSession ses = request.getSession();
			ses.removeAttribute("loginSession"); // 로그인세션 갱신
		} else {
			rttr.addFlashAttribute("result", "fail");
		}
		
		return "index";
	}

	@RequestMapping(value = "/deleteAccountcomp", method = RequestMethod.POST)
	public String deleteAccountcomp(MemberVo member, RedirectAttributes rttr, HttpServletRequest request) throws NamingException, SQLException {

		System.out.println("유저에게 입력받 : " +  member.toString());
		
		if (service.deleteAccount(member)) {
			rttr.addFlashAttribute("result", "success");
			HttpSession ses = request.getSession();
			ses.removeAttribute("loginSession"); // 로그인세션 갱신
		} else {
			rttr.addFlashAttribute("result", "fail");
		}
		
		return "index";
	}

	
	// 유저 아이디 비밀번호 찾기 페이지 열기
	@RequestMapping(value = "/scanMember", method = RequestMethod.GET)
	public void scanMember() {
	}
	
	
	// 유저 아이디 비밀번호 찾기. 이메일로 회원정보 발송
	@RequestMapping(value = "/findAccount.do", method = RequestMethod.POST)
	public String findAccount(RedirectAttributes rt, HttpServletRequest request, HttpServletResponse response) {
		
		// 1. 유저가 입력한 이메일 정보로 가입된 이메일 주소 확인
		// 2. 해당 이메일로 회원정보 보냄
		
		String email = request.getParameter("email");
		System.out.println("유저에게 받은 이메일 주소 : " + email);
		
		MemberVo mem = null;
		ResponseEntity<String> result = null;
		
		
				mem = service.findMember(email);
				
				if(mem != null) {
					// 입력한 이메일로된 회원정보가 있을때 뷰단에 findSuccess 바인딩, 성공 메세지 띄우기
					rt.addFlashAttribute("status", "findSuccess");
					System.out.println("유저에게 받은 이메일의 회원 정보 : " + mem.toString());
					
					Random random = new Random();
					int changedPwd = random.nextInt(888888) + 111111;
					String StringifiedchangedPwd = String.valueOf(changedPwd);
					System.out.println("생성된 임시 비밀번호 : " + StringifiedchangedPwd);
					
					MemberVo changedMem = new MemberVo(mem.getUserid(), StringifiedchangedPwd, mem.getName(), mem.getNickname(), 
							email, mem.getPhone(), mem.getRegdate(), mem.getModifydate(), mem.getSessionid(), mem.getSessionage(), mem.getIsadmin());

							// 생성된 임시 비밀번호로 회원 정보 변경
					service.updateTmpPwd(changedMem);

					/* 이메일 보내기 */
					String setFrom = "dodamServer@gmail.com";
					String toMail = email;
					String title = "도담 회원 아이디 비밀번호 정보 입니다.";
					String content = "요청하신 계정 정보는 아래와 같습니다." + " <br><br>" 
							+ "<hr noshade='noshade'><br>"
							+ "사이트 : <a href='http://someone09.cafe24.com/'>http://someone09.cafe24.com/</a>" + "<br>"
							+ "아이디 : "+ mem.getUserid() + "<br>"
							+ "이메일 주소 : "+ mem.getEmail() +"<br>"
							+ "닉네임 : "+ mem.getNickname() +"<br>"
							+ "새로 생성된 임시 비밀번호 : "+ StringifiedchangedPwd +"<br>"
							+ "<br><hr noshade='noshade'>"
							+ "(회원 정보 보호를 위하여 비밀번호는 암호화되어 저장됩니다.)<br><br>"
					
							+ "로그인 후 다른 비밀번호로 변경해 주시기 바랍니다.<br>"
							
							+ "<br>";
					
//					+ "<img src=\"cid:dodam.jpg\">";

					
							try {
								MimeMessage message = mailSender2.createMimeMessage();
								MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
								helper.setFrom(setFrom);
								helper.setTo(toMail);
								helper.setSubject(title);
								helper.setText(content, true);

								// 이메일 내용에 파일 업로드할 때
//								FileSystemResource file = new FileSystemResource(new File(
//										"C:\\lecture\\dodamProject\\dodam\\src\\main\\webapp\\resources\\images\\main\\dodam.jpg"));
//								helper.addInline("dodam.jpg", file);

								mailSender2.send(message);
								result = new ResponseEntity<String>("success", HttpStatus.OK);
								
							} catch (MailException | MessagingException e) {
								e.printStackTrace();
								result = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
							}
						

				} // if(mem != null) 끝
				
				else if ( mem == null ){
					// 입력한 이메일로된 회원정보가 없을때 뷰단에 findFail 바인딩, 실패 메세지 띄우기
					rt.addFlashAttribute("status", "findFail");
				}
				
			return "redirect:/member/scanMember";
		
		} // findAccount 끝
	
	
	@RequestMapping(value = "/checkDuplicatedId", method = RequestMethod.GET)
	public String checkDuplicatedId(@RequestParam("userid") String userid, HttpServletRequest request, RedirectAttributes rt) {
		
//		String userid = request.getParameter("userid");
		System.out.println("유저에게 입력받은 userid : " + userid);
		MemberVo mem = null;
		try {
			
		    mem = service.checkId(userid);
			System.out.println("입력받은 userid의 회원정보 : " + mem.toString());
			
			// 유저가 입력한 아이디가 기존 회원 아이디와 동일한지 체크
			
			if( mem != null ) { // 유저가 입력한 userid로 회원정보가 있음 -> 아이디 중복
				rt.addFlashAttribute("status", "dupliacted");
			} 
			
			} 
		
		catch (Exception e) {
				e.printStackTrace();
				if( mem == null ) { // 유저가 입력한 userid로 회원정보가 없음 -> 아이디 사용가능
					rt.addFlashAttribute("status", "canUsed");
					rt.addFlashAttribute("userid", userid);
				}
			}
		
		return "redirect:/member/register";
		
	}
}
