package com.example.demo.model;

public class Place {
	private int service_idx;
	private String category;
	private String name;
	private String content;
	private double latitude;
	private double longitude;
	
	public int getService_idx() {
		return service_idx;
	}
	public void setService_idx(int service_idx) {
		this.service_idx = service_idx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
}
