package model.board;

import oracle.sql.DATE;

public class commentDTO {
	private int C_CODE;
	private int B_CODE;
	private String WRITER;
	private String CONTENT;
	private DATE POSTDATE;
	
	public commentDTO() {}
	public commentDTO(int c_CODE, int b_CODE, String wRITER, String cONTENT, DATE pOSTDATE) {
		super();
		C_CODE = c_CODE;
		B_CODE = b_CODE;
		WRITER = wRITER;
		CONTENT = cONTENT;
		POSTDATE = pOSTDATE;
	}

	public int getC_CODE() {
		return C_CODE;
	}

	public void setC_CODE(int c_CODE) {
		C_CODE = c_CODE;
	}

	public int getB_CODE() {
		return B_CODE;
	}

	public void setB_CODE(int b_CODE) {
		B_CODE = b_CODE;
	}

	public String getWRITER() {
		return WRITER;
	}

	public void setWRITER(String wRITER) {
		WRITER = wRITER;
	}

	public String getCONTENT() {
		return CONTENT;
	}

	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}

	public DATE getPOSTDATE() {
		return POSTDATE;
	}

	public void setPOSTDATE(DATE pOSTDATE) {
		POSTDATE = pOSTDATE;
	}
	
	
}
