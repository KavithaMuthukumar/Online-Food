package ecart.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import ecart.project.model.Payment;

public class PaymentDao {

	
    Connection con;

    public PaymentDao(Connection con) {
        this.con = con;
    }

    //for register payment 
    public boolean savePayment(Payment payment) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into payment(cardno,validity,cvv,name) values(?,?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, payment.getCardNo());
            pt.setString(2, payment.getValidity());
            pt.setInt(3, payment.getCvv());
            pt.setString(4, payment.getName());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
	
}
