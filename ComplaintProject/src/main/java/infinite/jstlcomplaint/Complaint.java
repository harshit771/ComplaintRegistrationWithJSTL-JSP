package infinite.jstlcomplaint;

import java.sql.Date;

public class Complaint {
   
	private String complaintid;
	private String complainttype;
	private String cdescription;
	private Date complaintdate;
	private String severity;
	private String status;
	
	public String getComplaintid() {
		return complaintid;
	}
	public void setComplaintid(String complaintid) {
		this.complaintid = complaintid;
	}
	public String getComplainttype() {
		return complainttype;
	}
	public void setComplainttype(String complainttype) {
		this.complainttype = complainttype;
	}
	public String getCdescription() {
		return cdescription;
	}
	public void setCdescription(String cdescription) {
		this.cdescription = cdescription;
	}
	public Date getComplaintdate() {
		return complaintdate;
	}
	public void setComplaintdate(Date complaintdate) {
		this.complaintdate = complaintdate;
	}
	public String getSeverity() {
		return severity;
	}
	public void setSeverity(String severity) {
		this.severity = severity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
