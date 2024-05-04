package demospringmvc.Entity;

public class danhgia {
	private int danhgiaID;
	private String Description;
	private int CustomerID;
	
	public danhgia() {
		super();
	}

	public int getDanhgiaID() {
		return danhgiaID;
	}

	public void setDanhgiaID(int danhgiaID) {
		this.danhgiaID = danhgiaID;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public int getCustomerID() {
		return CustomerID;
	}

	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}
	
}
