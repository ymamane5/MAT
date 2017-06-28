package logic;

import java.io.IOException;

import DAL.CDALError;
import DAL.CDal;
import communication.AddStudentToClassRequest;
import communication.AddStudentToClassResponse;
import communication.DefineClassRequest;
import communication.DefineClassResponse;
import communication.Message;
import ocsf.server.ConnectionToClient;
import utils.Handler;

public class DefineClassRequestHandler implements Handler {

	public void handle(Message msg, Object obj) {
		// TODO Auto-generated method stub
		ConnectionToClient client = (ConnectionToClient) obj;
		DefineClassRequest addClassMsg = (DefineClassRequest)msg;
		
		
		// TODO Check in database
		CDALError error = new CDALError();
		boolean isSucceeded = CDal.addNewClass(addClassMsg.getClassName());		
		
		DefineClassResponse res = new DefineClassResponse(isSucceeded, error.getString());
		try {
			client.sendToClient(res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
}