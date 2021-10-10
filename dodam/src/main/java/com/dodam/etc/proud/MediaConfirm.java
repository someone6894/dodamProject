package com.dodam.etc.proud;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

/**
 * @author Chang
 * @packageName : com.miniProj.etc
 * @fileName : MediaConfirm.java
 * @date : 2021. 9. 3.
 * description :
 * parameter :
 * return_value : 
 */
public class MediaConfirm {
	private static Map<String, MediaType> mediMap;
	
	{
		// 인스턴스 멤버를 초기화 하는 블록
	}

	static { // 현재 클래스의 멤버 중에서 static한 멤버가 초기화를 할 수 있는 블록
		mediMap = new HashMap<String, MediaType>();
		// 이미지 파일 형식을 Map에 넣어두고, Map 없는 확장자라면 이미지가 아니다.
		mediMap.put("jpg", MediaType.IMAGE_JPEG);
		mediMap.put("gif", MediaType.IMAGE_GIF);
		mediMap.put("png", MediaType.IMAGE_PNG);
		mediMap.put("jpeg", MediaType.IMAGE_JPEG);
	}
	
	/**
	 * @date : 2021. 9. 3.
	 * @author : 
	 * @param ext
	 * return_value : 
	 */
	public static MediaType getMediaType(String ext) {
		return mediMap.get(ext);
	}

}
