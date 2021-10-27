package com.dodam.domain.admin;

public class PagingInfoDTO {
	private int postPerPage; // 페이지당 글 갯수(고정할 거면 static final 상수 처리)
	private int pageCntPerBlock; // 블럭 당 페이지 수
	
	private int totalPage; // 전체 페이지 수
	private int startNum; // 출력 시작할 번호

	private int currentPagingBlock; // 현재 페이지가 속한 블록
	private int startPageNoOfBlock; // 블록의 시작 페이지 번호
	private int endPageNoOfBlock; // 블록의 끝 페이지 번호
	private int totalPagingBlockCnt; // 전체 페이징블록 개수
	
	public PagingInfoDTO() {
		
	}
	
	public PagingInfoDTO(int postPerPage, int pageCntPerBlock, int totalPage, int startNum, int currentPagingBlock,
			int startPageNoOfBlock, int endPageNoOfBlock, int totalPagingBlockCnt) {
		super();
		this.postPerPage = postPerPage;
		this.pageCntPerBlock = pageCntPerBlock;
		this.totalPage = totalPage;
		this.startNum = startNum;
		this.currentPagingBlock = currentPagingBlock;
		this.startPageNoOfBlock = startPageNoOfBlock;
		this.endPageNoOfBlock = endPageNoOfBlock;
		this.totalPagingBlockCnt = totalPagingBlockCnt;
	}
	public int getPostPerPage() {
		return postPerPage;
	}
	public void setPostPerPage(int postPerPage) {
		this.postPerPage = postPerPage;
	}
	public int getPageCntPerBlock() {
		return pageCntPerBlock;
	}
	public void setPageCntPerBlock(int pageCntPerBlock) {
		this.pageCntPerBlock = pageCntPerBlock;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPost) {
		// 전체 페이지 수 :  전체 글의 개수 / 페이지 당 보여줄 글의 개수(나누어 떨어지지 않았다면 + 1)
		if (totalPost % this.postPerPage != 0) {
			this.totalPage = (totalPost / this.postPerPage) + 1;
		} else {
			this.totalPage = totalPost / this.postPerPage;
		}
	}
	public int getStartNum() {
		return this.startNum;
	}
	public void setStartNum(int pageNo) {
		// x번째 페이지에서 출력시작할 번호 : ( 현재페이지번호 -1 ) * 한 페이지 당 보여줄 글의 갯수
		this.startNum = (pageNo - 1) * this.postPerPage;
	}
	public int getCurrentPagingBlock() {
		return currentPagingBlock;
	}
	public void setCurrentPagingBlock(int pageNo) {
		// 현재 페이징 블록 = 현재 페이지 번호 / 페이징 블록 (올림)
		this.currentPagingBlock = (int)(Math.ceil(pageNo / (float)this.pageCntPerBlock));
	}
	public int getStartPageNoOfBlock() {
		return startPageNoOfBlock;
	}
	public void setStartPageNoOfBlock(int currentPagingBlock) {
		// 현재 페이징 블록의 시작 페이지 번호 = ((현재 페이징 블록 - 1) * 페이징블록) + 1
		this.startPageNoOfBlock = ((currentPagingBlock - 1) * this.pageCntPerBlock) + 1;
	}
	public int getEndPageNoOfBlock() {
		return endPageNoOfBlock;
	}
	public void setEndPageNoOfBlock(int startPageNoOfBlock) {
		// 현재 페이징 블록의 끝 페이지 번호 = (현재 페이징 블록 시작페이지 번호 + 페이징블록) - 1
		this.endPageNoOfBlock = (startPageNoOfBlock + this.pageCntPerBlock) - 1;
		if (this.endPageNoOfBlock > this.totalPage) {
			this.endPageNoOfBlock = this.totalPage;
		}
	}
	public int getTotalPagingBlockCnt() {
		return totalPagingBlockCnt;
	}
	public void setTotalPagingBlockCnt(int totalPage) {
		// 전체 페이징 블록 수 = 전체 페이지 수 / 페이징 블록 (나누어 떨어지지 않으면 + 1)
		this.totalPagingBlockCnt = (int)Math.ceil(totalPage / (float)this.pageCntPerBlock);
	}
	@Override
	public String toString() {
		return "PagingInfoDTO [페이지당글개수=" + postPerPage + ", 블럭당페이지수=" + pageCntPerBlock + ", 전체페이지수="
				+ totalPage + ", 출력시작할번호=" + startNum + ", 현재페이징블록=" + currentPagingBlock
				+ ", 블럭의시작페이지번호=" + startPageNoOfBlock + ", 블럭의끝페이지번호=" + endPageNoOfBlock
				+ ", 전체페이징블럭수=" + totalPagingBlockCnt + "]";
	}
}
