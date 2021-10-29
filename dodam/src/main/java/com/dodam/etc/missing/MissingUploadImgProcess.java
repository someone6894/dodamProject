package com.dodam.etc.missing;

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
 * @packageName : com.dodam
 * @author : Kim MinJi
 * @fileName : MissingUploadImgProcess.java
 * @date : 2021. 10. 3.
 * @description :
 */
public class MissingUploadImgProcess {
	
	private MissingUploadImgs imgs = new MissingUploadImgs();
	
	/**
	 * @MethodName : uploadImgRename
	 * @description : DB와 서버에 저장될 이미지의 파일명을 지정하는 메서드
	 * @author : Kim MinJi
	 * @date : 2021. 10. 3.
	 * @param uploadFolder : 파일이 업로드 될 경로
	 * @param originalImgName : 업로드 된 파일의 원래 파일명
	 * @param file : DB에 저장될 파일 이름
	 * @return
	 * @throws IOException 
	 */
	public MissingUploadImgs uploadImgRename(String uploadFolder, String originalImgName, byte[] file) throws IOException {
		UUID uuid = UUID.randomUUID();
		
		String saveName = uuid.toString() + "_" + originalImgName;
		String savePath = calculatePath();
		
		makeDir(uploadFolder, savePath);
		
		// originalImgName에 업로드 할 경로를 포함한 이미지 파일 이름 저장
		this.imgs.setOriginalImgName(savePath + File.separator + saveName);
		
		// 파일을 경로에 복사(저장)
		File target = new File(uploadFolder + savePath + File.separator, saveName);
		FileCopyUtils.copy(file, target); // file을 target에 복사해주는 메서드

		
		// 썸네일 만들기
		makeThumbnail(uploadFolder, savePath, saveName);
		
		return this.imgs;
	}

	/**
	 * @MethodName : makeThumbnail
	 * @description : 썸네일크기의 작은 사이즈로 이미지를 
	 * @author : Kim MinJi
	 * @date : 2021. 10. 3.
	 * @param uploadFolder : 이미지가 업로드될 폴더의 경로
	 * @param savePath : uploadFolder 하위의 년/월/일 폴더 경로
	 * @param saveName : 이미지가 업로드될 때 저장될 이름
	 * @throws IOException 
	 */
	private void makeThumbnail(String uploadFolder, String savePath, String saveName) throws IOException {
		String originalImgName = uploadFolder + savePath + File.separator + saveName;
		System.out.println(originalImgName);
		
		BufferedImage originalImg = ImageIO.read(new File(originalImgName));
		
		// 읽어온 이미지 파일을 높이 200px 기준으로 리사이즈
		BufferedImage destFile = Scalr.resize(originalImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 200);
		
		String thumbNailImgName = uploadFolder + savePath + File.separator + "thumb_" + saveName;
		File ThumbNailImg = new File(thumbNailImgName);
		
		System.out.println("썸네일 이미지의 파일 이름 : " + thumbNailImgName);
		String ext = saveName.substring(saveName.lastIndexOf(".") + 1);
		boolean bo = ImageIO.write(destFile, ext, ThumbNailImg); // 썸네일(리사이즈 된 파일)을 실제 저장
		System.out.println(destFile.getType() + ", " + ext + ", " + ThumbNailImg + ", " + bo);
		// jsp(서버)에서 사용될 경로이므로 파일 구분자 / 사용
		this.imgs.setThumbNailImgName(thumbNailImgName.substring(uploadFolder.length()).replace(File.separatorChar, '/'));
	}

	/**
	 * @MethodName : makeDir
	 * @description : 서버 업로드 폴더 하위에 년/월/일 폴더 생성하는 메서드
	 * @author : Kim MinJi
	 * @date : 2021. 10. 3.
	 * @param uploadFolder : 파일이 업로드 될 경로
	 * @param savePath : uploadFolder이후 년/월/일 폴더의 경로
	 */
	private void makeDir(String uploadFolder, String savePath) {
		
		File dirPath = new File(uploadFolder + savePath);
		
		if(dirPath.exists()) {
			// 만들고자 하는 날짜의 폴더가 이미 존재한다면, 폴더를 생성할 필요가 없으므로 생성하지 않고 호출한 곳으로 돌아간다.
			return;
		} else {
			// 만들고자 하는 날짜의 폴더가 존재하지 않는다면, 년/월/일 폴더가 존재하는지 확인 후
			// 존재하지 않는다면 각각의 폴더를 생성한다.
			dirPath.mkdirs();
		}
		
	}

	/**
	 * @MethodName : calculatePath
	 * @description : 파일이 업로드 되는 년/월/일의 폴더 경로을 만들어주는 메서드
	 * @author : Kim MinJi
	 * @date : 2021. 10. 3.
	 * @param upPath : 파일이 업로드 될 경로
	 * @return : 년/월/일 폴더들의 경로 반환
	 */
	private String calculatePath() {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + (cal.get(Calendar.YEAR) + ""); // 년에 해당하는 폴더의 경로(\2021)
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); // 월에 해당하는 폴더의 경로(\2021\10)
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // 일에 해당하는 폴더의 경로(\2021\10\03)
		System.out.println(datePath);
		
		return datePath;
	}
}
