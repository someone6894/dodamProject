package com.dodam.persistence.members;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dodam.domain.adopt.AdoptVo;
import com.dodam.domain.members.MemberGradeVo;
import com.dodam.domain.members.MemberVo;
import com.dodam.domain.members.MypointVo;


@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Inject
	private SqlSession ses;  // sqlSessionTemplate 객체 주입
	
	private static String namespace = "com.dodam.mapper.MemberMapper";
	
	// 회원가입
	@Override
	public int insertMember(MemberVo mem) {
		String query = namespace + ".insertMember";
		int row = ses.insert(query, mem);
		return row;
	}

	// 이메일 확인 코드 보내기
//	public boolean send(String emailAddr, String confirmCode) throws MessagingException, AddressException {
//		// GMail의 SMTP(Send Mail Transfer Protocol)를 이용하여 메일 발송
//
//		final String userName = "bobjjong09@gmail.com";
//		final String password = "tkfkd2153!";
//
//		Properties prop = new Properties();
//
//		String subject = "Dodam Dodam에서 보낸 이메일 인증번호 입니다."; // 제목
//		String message = "Dodam Dodam의 회원가입을 환영합니다. <br />";
//		message += "<hr/> 회원 가입 화면에 인증번호를 아래의 번호로 기입해 주세요.";
//		message += "<b>인증 번호 : " + confirmCode + "<b/><br/>";
//		message += "감사합니다!";
//
//		prop.put("mail.smtp.host", "smtp.gmail.com"); // 메일을 보내는 서버의 주소, 틀리면 안보내짐
//		prop.put("mail.smtp.port", "587"); // TLS포트 587
//		prop.put("mail.smtp.auth", "true"); // 인증 과정을 할거냐 말거냐 true
//		prop.put("mail.smtp.starttls.enable", "true"); // starttls를 사용할 것인지 (tls == 보안)
//
//		Session mailSession = Session.getInstance(prop, new Authenticator() { // getInstance 세션객체를 만듬
//
//			@Override
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(userName, password);
//			}
//		
//		});
//
//		if (mailSession != null) {
//			System.out.println(mailSession.toString());
//
//			// 얻어온 mailSession에 받을 사람 주소, 제목, 내용등을 첨부하고 발송
//			MimeMessage mimeMessage = new MimeMessage(mailSession);
//			mimeMessage.setFrom(new InternetAddress("admin@dodam.com")); // 보내는 사람이름 //여기선 예외처리 넘김, 호출한 곳에서 예외처리할것
//			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(emailAddr)); // 받는 사람 주소 첨부 //BCC
//																								// 숨은참조, CC 참조, TO 받는주소
//			mimeMessage.setSubject(subject); // 제목 첨부
//			mimeMessage.setText(message); // 본문 첨부
//
//			Transport.send(mimeMessage); // 실제 메일 발송
//		}
//		
//		return true;
//
//	}
	
	// 회원 로그인
	@Override
	public MemberVo loginMember(MemberVo mem) {
		
		MemberVo member = ses.selectOne(namespace + ".loginMember", mem);
		
		return member;
	}

	// 회원 아이디/비밀번호 찾기
	@Override
	public MemberVo findMember(String email) {
		
		MemberVo member = ses.selectOne(namespace + ".findMember", email);
		
		return member;
	}

	
	
	
	
	@Override
	public int infoupdate(MemberVo mem) throws NamingException, SQLException {
		
		return ses.update(namespace + ".infoupdate", mem);
	}


	@Override
	public int passwordupdate(MemberVo mem) throws NamingException, SQLException {
		
		return ses.update(namespace + ".passwordupdate", mem);
	}


	@Override
	public int deleteAccount(MemberVo mem) throws NamingException, SQLException {
		return ses.delete(namespace + ".deleteAccount", mem);
	}

	@Override
	public int sumpoint(String userid) throws NamingException, SQLException {
		 
		return ses.selectOne(namespace + ".sumpoint", userid);
	}

	@Override
	public List<MypointVo> pointlist(String userid) throws NamingException, SQLException {

		   return ses.selectList(namespace + ".pointlist", userid);
	}

	@Override
	public int countboard(String userid) throws NamingException, SQLException {
		
		return ses.selectOne(namespace + ".countboard", userid);
	}

	@Override
	public int countreplyer(String userid) throws NamingException, SQLException {
		
		return ses.selectOne(namespace + ".countreplyer", userid);
	}

	@Override
	public List<MypointVo> boardhistory(String userid) throws NamingException, SQLException {
		   
		return ses.selectList(namespace + ".boardhistory", userid);
	}

	@Override
	public List<MypointVo> replyerhistory(String userid) throws NamingException, SQLException {
		   
		return ses.selectList(namespace + ".replyerhistory", userid);
	}

	@Override
	public int updateTmpPwd(MemberVo mem) {
		
		return ses.update(namespace + ".updateTmpPwd", mem);
	}

	public int countpoint(String userid) throws NamingException, SQLException  {
		
		return ses.selectOne(namespace + ".countpoint", userid);

	}


	// 회원가입시 중복 아이디 확인
	@Override
	public MemberVo checkDupliactedId(String userid) {
			
		MemberVo member = ses.selectOne(namespace + ".checkDupliactedId", userid);
		return member;
	}

	@Override
	public List<MemberGradeVo> membergrade() throws NamingException, SQLException {

		   return ses.selectList(namespace + ".membergrade");
	}

	@Override
	public String grade(int sumpoint) throws NamingException, SQLException {
		
		return ses.selectOne(namespace + ".grade", sumpoint);
	}

	@Override
	public List<MemberGradeVo> bookmark(String userid) throws NamingException, SQLException {
		
		   return ses.selectList(namespace + ".bookmark",userid);
	}

	@Override
	public int bookmarkcount(String userid) throws NamingException, SQLException {

		return ses.selectOne(namespace + ".bookmarkcount", userid);
	}

	@Override
	public MemberVo pwdCheck(Map<String, String> map) {
		return ses.selectOne(namespace + ".selectPwdCheck", map);
	}

	
	
	
}
