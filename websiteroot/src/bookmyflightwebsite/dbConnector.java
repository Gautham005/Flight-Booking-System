package bookmyflightwebsite;

import java.sql.*;
import java.util.ArrayList;



public class dbConnector {
	
	Connection connection;

	public Boolean connect() {
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bookmyflight",
					"rahulk", "rahulk");
			return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public int getPrice(String f) {
		try {
			Statement statement = connection.createStatement();
			ResultSet result1 = statement.executeQuery("SELECT * from flights where flight_no = '"+f +"'");
			result1.next();
			return Integer.parseInt(result1.getString("price"));

		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<String> getFlight(String source, String destination, String date , int c) {
		
		try {
			Statement statement = connection.createStatement();
			ArrayList<String> data = new ArrayList<>();
			ResultSet result = statement.executeQuery("SELECT flight_no, airline_name, arrival_time, departure_time, price, arrival_date from flights where source = "+ "'" +source +"'"+" and destination = " +"'"+ destination +"' and departure_date = '" + date + "' and no_of_seats_available > "+ c +"  order by price");
			String temp;
			while(result.next()) {
				temp = result.getString("flight_no") + "," + result.getString("airline_name") +"," +  result.getString("arrival_time")+"," + result.getString("departure_time")+","+result.getString("price")+","+result.getString("arrival_date");
				data.add(temp);
			}
			return data;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public int createUser(String username, String password, String name, String email, String phone) {
		try {
			Statement statement = connection.createStatement();
			ResultSet result1 = statement.executeQuery("SELECT * from registered_users where username = '"+username+"' or "+"email = '"+email+"'" + "or phone = '"+phone+"'");
			
			if(result1.next()) {
				if(result1.getString("username").equals(username)){
					return -1;
				}
				else if(result1.getString("email").equals(email)) {
					return -2;
				}
				else {
					return -3;
				}
			}
			
			else {
				int result2 = statement
						.executeUpdate("INSERT INTO registered_users (username, password, name, email, phone) VALUES ('"
								+ username + "','" + password + "','" + name + "','" + email + "','" + phone + "')");
				int v = statement.executeUpdate("INSERT INTO wallet (username) VALUES ('" + username + "')");
				return result2;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public Boolean authenticateUser(String username, String password) {
		try {
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery("SELECT password from registered_users where username = '"+ username+"'");
			if(!result.next()) {
				return false;
			}
			else {
				if(result.getString("password").equals(password)) {
					return true;
				}
				else {
					return false;
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public int getBalance(String username) {
		try {
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery("SELECT balance from wallet where username = '" + username + "'");
			while(result.next()) {
				return Integer.parseInt(result.getString("balance"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<String> getBookingDetail(String username) {
		try {
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery("select * from bookings where username = '" + username + "'");
			String temp;
			ArrayList<String> data = new ArrayList<>();
			while (result.next()) {
				temp = result.getString("booking_id") + "," + result.getString("flight_no") + ","
						+ result.getString("amount") + "," + result.getString("date_of_travel") + ","
						+ result.getString("no_of_travellers");
				data.add(temp);
			}
			return data;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int addBalance(int val, String username) {
		try{
			Statement statement = connection.createStatement();
			int v = val + getBalance(username);
			return statement.executeUpdate("update wallet set balance = " + v + " where username = '" + username + "'");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int getWalletID(String username) {
		try {
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery("select wallet_id from wallet where username = '" + username + "'");
			result.next();
			return Integer.parseInt(result.getString("wallet_id"));
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int createTransaction(String username, int amount) {
		try {
			Statement statement = connection.createStatement();
			int wallet_id = getWalletID(username);
			int v = statement.executeUpdate("insert into transactions (wallet_id, username, amount) VALUES ("+wallet_id+",'"+username+"', "+amount+")");
			addBalance(-1*amount, username);
			ResultSet result = statement.executeQuery("select transaction_id from transactions where username ='" + username + "' and amount = "+amount);
			result.next();
			return Integer.parseInt(result.getString("transaction_id"));
					
		} catch(SQLException e) {
			e.printStackTrace();
		
		}
		return -1;
	}
	public int updateSeats(String flight_no, int c) {
		try {
			Statement s = connection.createStatement();
			ResultSet r = s.executeQuery("select no_of_seats_available from flights where flight_no = '" + flight_no +"'");
			r.next();
			int v = Integer.parseInt(r.getString("no_of_seats_available"));
			v = v -c;
			int v1= s.executeUpdate("update flights set no_of_seats_available = "+ v+ " where flight_no = '" + flight_no +"'");
			return v1;
			
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return -1;
	}
	public int createTicket(int b_id, String name, String dob, String gender) {
		try {
			Statement statement = connection.createStatement();
			int r = statement.executeUpdate("insert into tickets (booking_id, person_name, dob, gender) values ("+b_id+", '" + name +"','" + dob + "','" + gender + "')");
			return r;
			
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return -1;
	}
	public int createBooking(ArrayList<String> name, ArrayList<String> dob, ArrayList<String> gender, int amount, String username, String date, String flight_no) {
		try {
			Statement statement = connection.createStatement();
			int t_id  = createTransaction(username, amount);
			int v = statement.executeUpdate("insert into bookings (transaction_id, flight_no, amount, date_of_travel, no_of_travellers, username) values ("+t_id+", '"+flight_no+"', "+amount+", '"+date+"',"+name.size()+", '"+username+"')");
			ResultSet res = statement.executeQuery("select booking_id from bookings where transaction_id = "+t_id);
			res.next();
			int b_id = Integer.parseInt(res.getString("booking_id"));
			int i = 0;
			while(i<name.size()) {
				createTicket(b_id, name.get(i), dob.get(i), gender.get(i));
				i++;
				
			}
			return b_id;
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return -1;
	}
	public String getFlightName(String fno) {
		try {
			Statement statement = connection.createStatement();
			ResultSet res = statement.executeQuery("select airline_name from flights where flight_no = '" + fno +"'");
			res.next();
			return res.getString("airline_name");
			
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return null;
	}
	public ResultSet getBookingDetails(String bid) {
		try {
			Statement statement = connection.createStatement();
			ResultSet res = statement.executeQuery("Select * from bookings where booking_id = " + bid);
			return res;
		} catch(SQLException e) {
			e.printStackTrace();
		
		}
		return null;
	}
	public static void main(String[] args) {
		dbConnector db = new dbConnector();
		db.connect();
		ArrayList<String> n = new ArrayList<>();
		ArrayList<String> n2 = new ArrayList<>();
		ArrayList<String> n3 = new ArrayList<>();
		n.add("rahul;");
		
//		System.out.println(db.createBooking(n,n2,n3, 1000, "rahulk", "2019-12-01", "air249"));
		System.out.println(db.updateSeats("air249", 1));

	}

	public String getSource(String fno) {
		try {
			Statement s = connection.createStatement();
			ResultSet r=  s.executeQuery("select source from flights where flight_no = '"+fno+"'");
			r.next();
			return r.getString("source");
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return null;
	}
	
	public ArrayList<String> getBookingHistory(String username){
		try {
			Statement s = connection.createStatement();
			ResultSet r = s.executeQuery("select * from bookings where username = '" + username +"' order by booking_date DESC");
			ArrayList<String> data = new ArrayList<>();
			String temp;
			while(r.next()) {
				temp = r.getString("booking_id") + "," + r.getString("flight_no")+ "," + r.getString("amount")+","+ r.getString("date_of_travel") + "," +r.getString("no_of_travellers")+","+ r.getString("booking_date");
				data.add(temp);
			}
			return data;
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return null;
	}
	
	public ArrayList<String> getCompleteBookingHistory(String username){
		try {
			Statement s = connection.createStatement();
			ResultSet r = s.executeQuery("select * from bookings where username = '" + username +"' order by booking_date DESC");
			ArrayList<String> data = new ArrayList<>();
			String temp;
			while(r.next()) {
				temp = r.getString("booking_id") + "," + getSource(r.getString("flight_no"))+"," + getDestination(r.getString("flight_no")) + "," + r.getString("flight_no")+ "," + r.getString("amount")+","+ r.getString("date_of_travel") + "," +r.getString("no_of_travellers")+","+ r.getString("booking_date");
			
				data.add(temp);
			}
			return data;
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return null;
	}
	
	public String getUserDetails(String username) {
		try {
			Statement s=  connection.createStatement();
			ResultSet r =s.executeQuery("select * from registered_users where username = '" +username + "'");
			r.next();
			return r.getString("name") +"," + r.getString("email") + ","+r.getString("phone");
					
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return null;
	}
	public ArrayList<String> getTickets(String b_id) {
		try {
			Statement s = connection.createStatement();
			ResultSet r = s.executeQuery("select * from tickets where booking_id = '" + b_id +"' order by ticket_id DESC");
			ArrayList<String> data = new ArrayList<>();
			String temp;
			while(r.next()) {
				temp = r.getString("ticket_id") + "," + r.getString("person_name")+ "," + r.getString("dob")+ "," + r.getString("gender");
				data.add(temp);
			}
			return data;
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return null;
	}
	public ArrayList<String> getTransactionHistory(String username) {
		try {
			Statement s = connection.createStatement();
			ResultSet r = s.executeQuery("select * from transactions where username = '" + username +"' order by t_date DESC");
			ArrayList<String> data = new ArrayList<>();
			String temp;
			while(r.next()) {
				temp = r.getString("transaction_id") + "," + r.getString("amount")+ "," + r.getString("t_date");
				data.add(temp);
			}
			return data;
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return null;
	}
	public String getDestination(String fno) {
		try {
			Statement s = connection.createStatement();
			ResultSet r=  s.executeQuery("select destination from flights where flight_no = '"+fno+"'");
			r.next();
			return r.getString("destination");
		}catch(SQLException e) {
			e.printStackTrace();
		
		}
		return null;
	}
}

