package com.example.demo.model;

public class Place {
	private long service_idx;
	private String category;
	private String name;
	private String address;
	private double latitude;
	private double longitude;
	
	public long getService_idx() {
		return service_idx;
	}
	public void setService_idx(long service_idx) {
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
