package demospringmvc.Entity;

public class thietbi {
	private int EquipmentID;
	private String Name;
	private String Description;
	private String quantity;
	private String Status;
	private String Img;
	
	public thietbi() {
		super();
	}
	public int getEquipmentID() {
		return EquipmentID;
	}

	public void setEquipmentID(int equipmentID) {
		EquipmentID = equipmentID;
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
	
}
