package DAL;

import java.sql.*;

import entities.*;
public class CDal {
	private static String userName = "root";
	private static String password = "Braude";//"mysql_native_password";//"admin";
	private static String connectionString = "jdbc:mysql://localhost/mat_db";
	private static Connection connection;
	public static void connect(String db_password){
		try 
		{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception ex) {
			ex.printStackTrace();
		}
		// TODO Auto-generated method stub
		try{
			String pass = (db_password.isEmpty() ? password : db_password); 
			 
			connection = DriverManager.getConnection(connectionString,userName,pass);
			System.out.println("SQL connection succeed");
		}
		catch(SQLException ex){
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
		}
	}
	
	public static Teacher getTeacher( int id)
	{
		Teacher teacherData = new Teacher();
		try 
		{
			Statement stmt = connection.createStatement();
			ResultSet resultSet = stmt.executeQuery("SELECT * FROM user join teacher where user.id = teacher.id && user.id=" + id + ";");
			ResultSetMetaData rsmd = resultSet.getMetaData();
			int numColumn = rsmd.getColumnCount();
	        
			while(resultSet.next())
	 		{				
				teacherData.setId(resultSet.getInt(1));
				teacherData.setFirstName(resultSet.getString(2));
				teacherData.setLastName(resultSet.getString(3));
				teacherData.setMaxHours(resultSet.getInt(5));
				teacherData.setTeachingUnit(resultSet.getInt(6));
	 		} 
		}
		catch (SQLException e) {e.printStackTrace();}
		return teacherData;
	}
	
	public static boolean setTeacherUnit(int id, int teachingUnit)
	{		
		try 
		{
			Statement stmt = connection.createStatement();
			return (stmt.executeUpdate("UPDATE teacher SET teachingUnitId=" + teachingUnit + " WHERE id=" + id ) > 0);	 	
		}
		catch (SQLException e) 
		{
			e.printStackTrace();			
		}
		return false;
	}
	
	public static boolean getUserData(int userId, User user)
	{
		boolean retVal = true;
		try 
		{
			Statement stmt = connection.createStatement();
			ResultSet resultSet = stmt.executeQuery("SELECT * FROM user where  user.id=" + userId + ";");
			if (resultSet.next()) {
			    user.setId(resultSet.getInt(1));
				user.setFirstName(resultSet.getString(2));
				user.setLastName(resultSet.getString(3));
				user.setPassword(resultSet.getString(4));
				switch(resultSet.getInt(5))
				{
					case 0:
					{
						user.setUserType(EUserType.EUserTeacher);
					}
					break;
					case 1:
					{
						user.setUserType(EUserType.EUserStudent);
					}
					break;
					case 2:
					{
						user.setUserType(EUserType.EUserSecretary);
					}
					break;
					case 3:
					{
						user.setUserType(EUserType.EUserPrincipal);
					}
					break;
					case 4:
					{
						user.setUserType(EUserType.EUserParent);
					}
					break;
					case 5:
					{
						user.setUserType(EUserType.EUserSystemManager);
					}
					break;
				}
				user.setIsLocked(resultSet.getBoolean(6));
				user.setIsLogged(resultSet.getBoolean(7));
			}
			else
			{
				retVal = false;
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		return retVal;
	}
	
	public static boolean connectUser(int userId, String passWord)
	{
		boolean retVal = true;
		try 
		{
			Statement stmt = connection.createStatement();
			stmt.executeUpdate("UPDATE user SET isLogged = true WHERE user.passWord = '"+ passWord+ "';");
			/*if (resultSet.next()) {
				System.out.println("found");
			}
			else
			{
				retVal = false;
			}*/
		}
		catch (SQLException e) {e.printStackTrace();}
		return retVal;
	}
	
    private static void writeMetaData(){

    	try{
	    		
	    	Statement stmt = connection.createStatement();
			ResultSet resultSet  = stmt.executeQuery("SELECT * FROM user;");
	        System.out.println("The columns in the table are: ");
	
	        System.out.println("Table: " + resultSet.getMetaData().getTableName(1));
	        for  (int i = 1; i<= resultSet.getMetaData().getColumnCount(); i++){
	                System.out.println("Column " +i  + " "+ resultSet.getMetaData().getColumnName(i));
	        }
	    }
    	catch (SQLException e) {e.printStackTrace();}
    }
	
}
