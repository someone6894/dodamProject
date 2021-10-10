package com.dodam.etc.missing;

public class MissingUploadImgs {
	private String originalImgName;
	private String thumbNailImgName;
	public MissingUploadImgs() {
		super();
	}
	public MissingUploadImgs(String originalImgName, String thumbNailImgName) {
		super();
		this.originalImgName = originalImgName;
		this.thumbNailImgName = thumbNailImgName;
	}
	public String getOriginalImgName() {
		return originalImgName;
	}
	public void setOriginalImgName(String originalImgName) {
		this.originalImgName = originalImgName;
	}
	public String getThumbNailImgName() {
		return thumbNailImgName;
	}
	public void setThumbNailImgName(String thumbNailImgName) {
		this.thumbNailImgName = thumbNailImgName;
	}
	@Override
	public String toString() {
		return "UploadImgs [originalImgName=" + originalImgName + ", thumbNailImgName=" + thumbNailImgName + "]";
	}
	
	
}
