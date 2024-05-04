package demospringmvc.Entity;

import java.sql.Date;

public class chitietgoitap {
	private int SubscriptionID;
	private String CustomerID;
	private String PackageID;
	private Date StartDate;
	private Date EndDate;

	
	public chitietgoitap() {
		super();
	}
	public int getSubscriptionID() {
		return SubscriptionID;
	}
	public void setSubscriptionID(int subscriptionID) {
		SubscriptionID = subscriptionID;
	}
	public String getCustomerID() {
		return CustomerID;
	}
	public void setCustomerID(String customerID) {
		CustomerID = customerID;
	}
	public String getPackageID() {
		return PackageID;
	}
	public void setPackageID(String packageID) {
		PackageID = packageID;
	}
	public Date getStartDate() {
		return StartDate;
	}
	public void setStartDate(Date startDate) {
		StartDate = startDate;
	}
	public Date getEndDate() {
		return EndDate;
	}
	public void setEndDate(Date endDate) {
		EndDate = endDate;
	}
}
