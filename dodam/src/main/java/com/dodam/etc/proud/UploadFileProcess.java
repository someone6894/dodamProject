package com.dodam.etc.proud;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

/**
 * @author Chang
 * @packageName : com.miniProj.etc
 * @fileName : UploadFileProcess.java
 * @date : 2021. 9. 3.
 * description : 파일이 업로드 될 때 파일 이름처리, MIME 처리 등의 작업 수행
 * 
 */

public class UploadFileProcess {

	private UploadFiles files = new UploadFiles();
	
	/**
	 * @date : 2021. 9. 3.
	 * @author : chang
	 * @param upPath : 업로드되는 파일의 경로
	 * @param originalFilename : 업로드된 파일 오리지널 이름
	 * @param size : 업로드 된 파일의 사이즈
	 * return_value : DB에 저장될, 태그로 사용될 파일 이름
	 * @throws IOException 
	 */
	
	public UploadFiles uploadFile(String upPath, String originalFilename, byte[] file) throws IOException {
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString() + "_" + originalFilename; // 파일명
		String savePath = calculatePath(upPath); //datePath
		
		File target = new File(upPath + savePath + File.separator, savedName);
		FileCopyUtils.copy(file, target); // file을 target으로 저장
		
		// 썸네일을 만들자, substring indexof 시험
		String ext = originalFilename.substring(originalFilename.indexOf(".") + 1);
		
		String uploadFileName = null;
		if(MediaConfirm.getMediaType(ext.toLowerCase()) != null) { // 이미지 파일
			System.out.println("이미지 파일이다..");
			this.files.setOriginImgFileName(savePath + File.separator + savedName);
			 makeThumbnail(upPath, savePath, savedName);
		} else {
			System.out.println("이미지 파일이 아니다..");
			 makeIcon(upPath, savePath, savedName);
		}
		System.out.println("DB에 저장될 이름이자 태그로 사용될 이름 : " + this.files.toString());
		
		return this.files;
		// 썸네일과 원본 이미지를 둘다 DB에 넣어야하므로 배열이나 객체로 두개를 넘겨줘야 한다.
	}

	// TEMP경로로 저장되니까 파일명을 잘 구분해서 저장을 해줘야 한다.
	
	/**
	 * @date : 2021. 9. 3.
	 * @author : 
	 * @param upPath
	 * @param savePath
	 * @param savedName
	 * @description : 이미지 스케일 라이브러리를 이용하여 이미지를 thumnnail 이미지로 변환 한 파일이름을 넘겨줄 것임
	 * @return
	 * return_value : 썸네일 파일의 이름 반환
	 * @throws IOException 
	 */

	private void makeThumbnail(String upPath, String savePath, String savedName) throws IOException {
		System.out.println(upPath + savePath + File.separator+ savedName);
		String originUpFileName = upPath + savePath + File.separator + savedName; // 업로드된 원본 파일 이름
		
		BufferedImage originFile = ImageIO.read(new File(originUpFileName)); // 원본 이미지 파일 객체
		// 높이 100px 기준으로 리사이즈
		BufferedImage destFile = Scalr.resize(originFile, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100); // 높이 100 px 기준으로 리사이즈
		
		System.out.println(upPath);
		
		String thumbNailImgName = upPath + savePath + File.separator + "thumb_" + savedName;
		
		File newThumbNailFile = new File(thumbNailImgName);
//		
		System.out.println("썸네일 이미지의 파일 이름 : " + thumbNailImgName);
		String ext = savedName.substring(savedName.lastIndexOf(".") + 1);
		ImageIO.write(destFile, ext, newThumbNailFile); // 썸네일 파일을 실제 저장
		
		this.files.setThumbNailImgFileName(thumbNailImgName.substring(upPath.length()).replace(File.separatorChar, '/'));
		// 역슬래쉬를 슬러쉬로 바꾼다. jsp에서는 경로를 슬러쉬로 하니까 바꿔줘야 하다.
	}

	private void makeIcon(String upPath, String savePath, String savedName) {
		String iconName = upPath + savePath + File.separator + savedName;
		this.files.setNotImgFileName(iconName.substring(upPath.length()).replace(File.separatorChar, '/'));
	}

	/**
	 * @date : 2021. 9. 3.
	 * @author : 
	 * @param upPath : 업로드 되는 파일의 경로
	 * @return : 하위 폴더(연/월/일) 경로 반환
	 * return_value : 최종적으로 파일이 저장될 경로 반환
	 */
	private String calculatePath(String upPath) {
		Calendar cal = Calendar.getInstance();
		// 2021 폴더 안에 09 폴더 안에 03파일이 있는 식으로 정렬되어야 한다.
		String yearPath = File.separator + (cal.get(Calendar.YEAR) + ""); // \2021
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);  // \\2021\09
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // \\2021\09\03
		System.out.println(datePath);

		makeDir(upPath, yearPath, monthPath, datePath); 
		
		return datePath;
	}

	/**
	 * @date : 2021. 9. 3.
	 * @author : 
	 * @param upPath : 서버 업로드 폴더의 경로
	 * @param yearPath : 
	 * @param monthPath
	 * @param datePath
	 * 설명 : 서버 업로드 폴더의 하위에 년/월/일 폴더 생성
	 * return_value : 
	 */
	private void makeDir(String upPath, String... paths) {
		// String... paths 는 가변인자로 받을 것이라고 컴파일러에게 알려줌. yearPath, monthPath, datePath의 값을 배열로 넘겨준다.
		
		if(new File(upPath + paths[paths.length -1]).exists()) {
			// 해당 경로가 존재한다면, 폴더를 만들 필요가 없으므로 돌아간다.~~
			return;
		}
		
		// 폴더 안에 폴더를 만들어야 하므로 반복문을 만들어 돌린다.
		for (String path : paths) {
			File dirPath = new File(upPath + path);
			
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}

}
