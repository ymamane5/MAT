package controller;

import java.io.*;

import communication.*;

/**
 * The Class MATClientConsole.
 */
public class MATClientConsole 
{
	
	/** The Constant DEFAULT_PORT. */
	final public static int DEFAULT_PORT = 5555;

	//Instance variables **********************************************

	/**
	* The instance of the client that created this ConsoleChat.
	*/
	MATClientController client;

	//Constructors ****************************************************

	/**
	* Constructs an instance of the ClientConsole UI.
	*
	* @param host The host to connect to.
	* @param port The port to connect on.
	*/

	public MATClientConsole(String host, int port) 
	{
	   client= MATClientController.getInstance();
	}
	
	/**
	* This method waits for input from the console.  Once it is 
	* received, it sends it to the client's message handler.
	*/
	public void accept() 
	{
/*	 try
	 {
	   BufferedReader fromConsole = 
	     new BufferedReader(new InputStreamReader(System.in));
	   String line;

	   while (true) 
	   {
		   System.out.println("press 1 to get teacher, press 2 to set teacher unit");
		   line = fromConsole.readLine();
		   int command = Integer.parseInt(line);
		   Message sendMessage = new Message(command);
		   switch(command)
		   {
		   	case 1:
			   System.out.println("enter teacher id");
			   line = fromConsole.readLine();
			   int id = Integer.parseInt(line);
			   MessageGetTeacher getTeacher = new MessageGetTeacher(sendMessage);
			   getTeacher.setTeacherID(id);
			   client.handleMessageFromClientUI(getTeacher.getString());
			   break;
		   	case 2:
				   System.out.println("enter teacher id");
				   line = fromConsole.readLine();
				   int id1 = Integer.parseInt(line);
				   System.out.println("enter teachering unit");
				   line = fromConsole.readLine();
				   int teachingUnit = Integer.parseInt(line);
				   MessageSetTeacherUnit setTeacherUnit = new MessageSetTeacherUnit(sendMessage);
				   setTeacherUnit.setTeacherID(id1);
				   setTeacherUnit.setTeachingUnit(teachingUnit);
				   client.handleMessageFromClientUI(setTeacherUnit.getString());
			break;
		   }
	   }
	 } 
	 catch (Exception ex) 
	 {
	   System.out.println
	     ("Unexpected error while reading from console!");
	 }*/
	}
	
	/**
	 * Display.
	 *
	 * @param message the message
	 */
	public void display(String message) 
	{
	 System.out.println("> " + message);
	}
}
