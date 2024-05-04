package demospringmvc.Entity;
import java.sql.Time;
import java.util.Date;
public class lichtap {

	private int ScheduleID;
	private String ClassName;
	private String Description;
	private Date Date;
	private Time StartTime;
	private Time EndTime;
	private String EmployeeID;
	
	public int getScheduleID() {
		return ScheduleID;
	}
	public void setScheduleID(int scheduleID) {
		ScheduleID = scheduleID;
	}
	
	public lichtap() {
		super();
	}
	public String getClassName() {
		return ClassName;
	}
	public void setClassName(String className) {
		ClassName = className;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public Date getDate() {
		return Date;
	}
	public void setDate(Date date) {
		Date = date;
	}
	public Date getStartTime() {
		return StartTime;
	}
	public void setStartTime(Time startTime) {
		StartTime = startTime;
	}
	public Date getEndTime() {
		return EndTime;
	}
	public void setEndTime(Time endTime) {
		EndTime = endTime;
	}
	public String getEmployeeID() {
		return EmployeeID;
	}
	public void setEmployeeID(String employeeID) {
		EmployeeID = employeeID;
	}
	public String getImg() {
		return Img;
	}
	public void setImg(String img) {
		Img = img;
	}
	private String Img;
}
