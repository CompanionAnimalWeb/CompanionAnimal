package com.example.demo.model;

public class DogDetailDisease {
	
	private int diseaseIdx;
	private String detailSymptom;
	private String classification;
	private String diseaseName;
	private String treatment;
	
	public String getDetailSymptom() {
		return detailSymptom;
	}
	public void setDetailSymptom(String detailSymptom) {
		this.detailSymptom = detailSymptom;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	public String getTreatment() {
		return treatment;
	}
	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}
	public int getDiseaseIdx() {
		return diseaseIdx;
	}
	public void setDiseaseIdx(int diseaseIdx) {
		this.diseaseIdx = diseaseIdx;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	
	
	
}
