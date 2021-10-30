package com.dodam.domain.missing;

public class RecommendVo {
	String animal;
	int numOfRec;
	public RecommendVo() {
		super();
	}
	public RecommendVo(String animal, int numOfRec) {
		super();
		this.animal = animal;
		this.numOfRec = numOfRec;
	}
	public String getAnimal() {
		return animal;
	}
	public void setAnimal(String animal) {
		this.animal = animal;
	}
	public int getNumOfRows() {
		return numOfRec;
	}
	public void setNumOfRows(int numOfRec) {
		this.numOfRec = numOfRec;
	}
	@Override
	public String toString() {
		return "RecommendVo [animal=" + animal + ", numOfRec=" + numOfRec + "]";
	}
	

}
