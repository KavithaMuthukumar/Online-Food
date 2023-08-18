package ecart.project.model;

public class Payment {

	private int cardNo;
	private String validity;
	private int cvv;
	private String name;

	public Payment(int cardNo, String validity, int cvv, String name) {
		this.cardNo = cardNo;
		this.validity = validity;
		this.cvv = cvv;
		this.name = name;
	}

	public Payment() {
	}

	public Payment(String validity, int cvv, String name) {
		super();
		this.validity = validity;
		this.cvv = cvv;
		this.name = name;
	}

	public int getCardNo() {
		return cardNo;
	}

	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}

	public String getValidity() {
		return validity;
	}

	public void setValidity(String validity) {
		this.validity = validity;
	}

	public int getCvv() {
		return cvv;
	}

	public void setCvv(int cvv) {
		this.cvv = cvv;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Payment [cardNo=" + cardNo + ", validity=" + validity + ", cvv=" + cvv + ", name=" + name + "]";
	}

}
