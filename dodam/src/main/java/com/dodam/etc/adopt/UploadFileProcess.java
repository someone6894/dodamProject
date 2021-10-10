package com.dodam.etc.adopt;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileProcess {
	
	private UploadFiles files = new UploadFiles();
	
	public UploadFiles uploadFileRename(String upPath, String originalFilename, byte[] file) throws IOException {
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString() + "_" + originalFilename;
		String savePath = calculatePath(upPath);
		
		File target = new File(upPath + savePath + File.separator, savedName);
		FileCopyUtils.copy(file, target); // file을 target으로  실제 저장
		
		// 썸네일을 만듦
		String ext = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
		
		String uploadFileName = null;
		if (MediaConfirm.getMediaType(ext.toLowerCase()) != null) { // 이미지 파일
			System.out.println("이미지 파일이다..");
			this.files.setOriginImgFileName(savePath + File.separator + savedName);
			makeThumbnail(upPath, savePath, savedName);
			
		} else { 
			System.out.println("이미지 파일이 아니다..");
			makeIcon(upPath, savePath, savedName);
			
		}
		System.out.println("DB에 저장될 이름이자 태그로 사용될 이름 : " + this.files.toString());
		
		return this.files;
	}

	
	private void makeThumbnail(String upPath, String savePath, String savedName) throws IOException {
		System.out.println("upPath + savePath + savedName : " + upPath + savePath + savedName);
		String originUpFileName = upPath + savePath + File.separator + savedName; // 업로드된 원본 파일 이름
		
		BufferedImage originFile = ImageIO.read(new File(originUpFileName)); // 원본 이미지 파일 객체
		BufferedImage destFile = Scalr.resize(originFile, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		String thumbNailImgName = upPath + savePath + File.separator + "thumb_" + savedName;
		
		File newThumbNailFile = new File(thumbNailImgName);
	
		System.out.println("썸네일 이미지의 파일 이름 : " + thumbNailImgName);
		String ext = savedName.substring(savedName.lastIndexOf(".") + 1);
		ImageIO.write(destFile, ext, newThumbNailFile); // 썸네일 파일을 실제 저장
		
		this.files.setThumbNailImgFileName(thumbNailImgName.substring(upPath.length()).replace(File.separatorChar, '/'));
	}

	private void makeIcon(String upPath, String savePath, String savedName) {
		String iconName = upPath + savePath + File.separator + savedName;
		this.files.setNotImgFileName(iconName.substring(upPath.length()).replace(File.separatorChar, '/'));
	}

	private String calculatePath(String upPath) {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + (cal.get(Calendar.YEAR) + ""); // \2021
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); // \2021\09
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // \2021\09\03
		System.out.println("datePath : " + datePath);
		
		makeDir(upPath, yearPath, monthPath, datePath);		
	
		return datePath;
	}

	private void makeDir(String upPath, String... paths ) {
		
		if(new File(upPath + paths[paths.length -1]).exists()) {
			return;
		}
		
		for (String path : paths) {
			File dirPath = new File(upPath + path);
			
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}

}
