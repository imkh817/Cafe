package com.myhome.project.model;

public class PagingPgm {
	private int total; // 총 데이터 갯수
	private int rowPerPage; // 페이지 당 보여줄 데이터 갯수
	private int pagePerBlk = 10; // 페이지 버튼을 나타낼 갯수
	private int currentPage; // 현재 페이지
	private int startPage;  // 화면에 표시될 시작 페이지
	private int endPage; // 화면에 표시될 마지막 페이지
	private int totalPage; // 총 페이지

	public PagingPgm(int total, int rowPerPage, int currentPage) {
		this.total = total;
		this.rowPerPage = rowPerPage;
		this.currentPage = currentPage;
		
		totalPage = (int) Math.ceil((double) total / rowPerPage);
		startPage = currentPage - (currentPage - 1) % pagePerBlk;
		endPage = startPage + pagePerBlk - 1;
		
		if (endPage > totalPage)
			endPage = totalPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getRowPerPage() {
		return rowPerPage;
	}

	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}

	public int getPagePerBlk() {
		return pagePerBlk;
	}

	public void setPagePerBlk(int pagePerBlk) {
		this.pagePerBlk = pagePerBlk;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}