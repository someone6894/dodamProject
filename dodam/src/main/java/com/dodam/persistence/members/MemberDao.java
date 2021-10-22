package com.dodam.persistence.members;

import java.sql.SQLException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.naming.NamingException;

import com.dodam.domain.members.MemberVo;

public interface MemberDao {

	public int insertMember(MemberVo mem);
	
	public boolean send(String emailAddr, String confirmCode) throws MessagingException, AddressException;

	MemberVo loginMember(MemberVo mem);
	
	int infoupdate(MemberVo mem) throws NamingException, SQLException;

	int passwordupdate(MemberVo mem) throws NamingException, SQLException;
	
	int deleteAccount(MemberVo mem) throws NamingException, SQLException;
	
}
