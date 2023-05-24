package com.example.demo.model;

public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;


	private int displayPageNum = 10;


	private Criteria criteria;
	
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	private void calcData() {
		endPage = (int) (Math.ceil(criteria.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double) criteria.getPerPageNum()));
		
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
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
	
}
