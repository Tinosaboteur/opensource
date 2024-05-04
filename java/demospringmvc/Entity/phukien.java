package demospringmvc.Entity;

public class phukien {
	private int PhukienID;
	private String Name;
	private String Description;
	private String quantity;
	private String Status;
	private String Img;
	private int Price;
	
	public phukien() {
		super();
	}
	public int getPhukienID() {
		return PhukienID;
	}

	public void setPhukienID(int PhukienID) {
		PhukienID = PhukienID;
	}
	
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getImg() {
		return Img;
	}
	public void setImg(String img) {
		Img = img;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	
}
