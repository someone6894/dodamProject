package com.dodam.etc.missing;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class IPChecking {
	private String ipAddr;
	
	public String getIp() throws IOException {
		// 아마존 클라우드가 무료로 아이피 주소를 가져와 줌
		// URL : 스트링을 URL주소로 바꿔줌
		try {
			URL ipCheck = new URL("http://checkip.amazonaws.com");
			BufferedReader in = new BufferedReader(new InputStreamReader(ipCheck.openStream()));
			this.ipAddr = in.readLine();
		} catch (MalformedURLException e) {
			this.ipAddr = null;
		}
		
		return ipAddr;
	}
}
