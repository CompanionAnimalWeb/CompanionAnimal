package com.example.demo.model;

public class Place {
	private long service_idx;
	private String category;
	private String name;
	private String address;
	private String hours;
	private String tel;
	private String comment;
	private double latitude;
	private double longitude;
	private String imagePath;
	
	public long getService_idx() {
		return service_idx;
	}
	public String getCategory() {
		return category;
	}
	public String getName() {
		return name;
	}
	public String getAddress() {
		return address;
	}
	public String getHours() {
		return hours;
	}
	public String getTel() {
		return tel;
	}
	public String getComment() {
		return comment;
	}
	public double getLatitude() {
		return latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setService_idx(long service_idx) {
		this.service_idx = service_idx;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
}
