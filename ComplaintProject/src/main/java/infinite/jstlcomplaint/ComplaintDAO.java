package infinite.jstlcomplaint;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import infinite.complaintproject.Complain;
import infinite.complaintproject.ConnectionHelper;




public class ComplaintDAO {
	  Connection con;
      PreparedStatement ps;
      
      public int day(Date cmpdate) {
     	 java.util.Date today=new java.util.Date();
     	 int days=(int)((today.getTime()-cmpdate.getTime())/(1000*60*60*24));
     	 days++;
     	 return days;
       }
      
      public String cmpid() throws ClassNotFoundException, SQLException  {
  		con = ConnectionHelper.getConnection();
  		String cmd = "select case when count(ComplaintID) is NULL then 1 else count(ComplaintID)+1 end ComplaintID from Complaint";
  		ps = con.prepareStatement(cmd);
  		ResultSet rs = ps.executeQuery();
  		rs.next();
  		int id=rs.getInt("ComplaintID");
  		String cmpid="";
  		if(id>=1 && id<10) {
  			 cmpid="C00"+id;
  			
  		}else if(id>=10 && id<100) {
  		   cmpid="C0"+id;
  		
  		}else if(id>=100) {
  		 cmpid="C"+id;
  			
  		}
  		return cmpid;
  	}
  	
  	public String addComplaint(Complaint comp) throws ClassNotFoundException, SQLException {
  		String cmpid=cmpid();
  		
  		con=ConnectionHelper.getConnection();
  		String sql="insert into complaint(ComplaintID,ComplaintType,CDescription,Severity) values(?,?,?,?)";
  		ps=con.prepareStatement(sql);
  		ps.setString(1, cmpid);
  		ps.setString(2, comp.getComplainttype());
  		ps.setString(3, comp.getCdescription());
  		ps.setString(4, comp.getSeverity());
  		ps.executeUpdate();
  		return "Complaint register successfully";
  	}
	public List<Complaint> showComplain() throws ClassNotFoundException, SQLException{
		con=ConnectionHelper.getConnection();
		String sql="select * from complaint";
		ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		List<Complaint> cmpList=new ArrayList<Complaint>();
		Complaint cmp=null;
		while(rs.next()) {
			cmp=new Complaint();
			cmp.setComplaintid(rs.getString("ComplaintID"));
			cmp.setComplainttype(rs.getString("ComplaintType"));;
			cmp.setCdescription(rs.getString("CDescription"));;
			cmp.setComplaintdate(rs.getDate("ComplaintDate"));;
			cmp.setSeverity(rs.getString("Severity"));;
			cmp.setStatus(rs.getString("Status"));;
			cmpList.add(cmp);
		}return cmpList;
	}
	
	public Complain searchById(String cmp) throws ClassNotFoundException, SQLException {
		con=ConnectionHelper.getConnection();
		String sql="select * from Complaint where ComplaintID=?";
		ps=con.prepareStatement(sql);
		ps.setString(1, cmp);
		ResultSet rs=ps.executeQuery();
		Complain comp=null;
		if(rs.next()) {
			comp=new Complain();
		
			comp.setComplaintId(rs.getString("ComplaintID"));
			comp.setComplaintType(rs.getString("ComplaintType"));
			comp.setcDescription(rs.getString("CDescription"));
			comp.setComplaintDate(rs.getDate("ComplaintDate"));
			comp.setSeverity(rs.getString("Severity"));
			comp.setStatus(rs.getString("Status"));
		}return comp;
	}
}
