package demospringmvc.Entity;

public class dangkiloptap {
	private int RegistrationID;
	private int CustomerID;
	private int ScheduleID;
	
	public dangkiloptap() {
		super();
	}
	public int getRegistrationID() {
		return RegistrationID;
	}
	public void setRegistrationID(int registrationID) {
		RegistrationID = registrationID;
	}
	public int getCustomerID() {
		return CustomerID;
	}
	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}
	public int getScheduleID() {
		return ScheduleID;
	}
	public void setScheduleID(int scheduleID) {
		ScheduleID = scheduleID;
	}
	
}
