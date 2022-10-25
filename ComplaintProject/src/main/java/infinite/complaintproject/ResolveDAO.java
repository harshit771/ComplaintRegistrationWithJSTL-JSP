package infinite.complaintproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ResolveDAO {
    
	public String resComp(Resolve res) throws ClassNotFoundException, SQLException {
	Connection con=ConnectionHelper.getConnection();
	 String sql="insert into Resolve(ComplaintID,ComplaintDate,ResolvedBy,Comments) values(?,?,?,?)";
	 PreparedStatement ps=con.prepareStatement(sql);
	 ps.setString(1, res.getComplaintId());
	 ps.setDate(2, res.getComplaintDate());
	
	 ps.setString(3, res.getResolvedBy());
	 ps.setString(4, res.getComments());
	 ps.executeUpdate();
	 
	 sql="update complaint set Status='Solve' where ComplaintID=?";
	 ps=con.prepareStatement(sql);
	 ps.setString(1, res.getComplaintId());
	 ps.executeUpdate();
	 
	 return "Complaint solve successfully";
	}
}
