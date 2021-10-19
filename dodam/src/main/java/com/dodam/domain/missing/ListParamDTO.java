package com.dodam.domain.missing;

public class ListParamDTO {
	private int pageNo;
	private String location;
	private String animal;
	private String category;
	private String searchWord;
	private int startNum;
	private int postPerPage;
	public ListParamDTO() {
		super();
	}
	public ListParamDTO(int pageNo, String location, String animal, String category, String searchWord) {
		super();
		this.pageNo = pageNo;
		this.location = location;
		this.animal = animal;
		this.category = category;
		this.searchWord = searchWord;
	}
	public ListParamDTO(int pageNo, String location, String animal, String category, String searchWord, int startNum,
			int postPerPage) {
		super();
		this.pageNo = pageNo;
		this.location = location;
		this.animal = animal;
		this.category = category;
		this.searchWord = searchWord;
		this.startNum = startNum;
		this.postPerPage = postPerPage;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAnimal() {
		return animal;
	}
	public void setAnimal(String animal) {
		this.animal = animal;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getPostPerPage() {
		return postPerPage;
	}
	public void setPostPerPage(int postPerPage) {
		this.postPerPage = postPerPage;
	}
	@Override
	public String toString() {
		return "ListParamDTO [pageNo=" + pageNo + ", location=" + location + ", animal=" + animal + ", category="
				+ category + ", searchWord=" + searchWord + ", startNum=" + startNum + ", postPerPage=" + postPerPage
				+ "]";
	}
	
}
