package logic;

import java.io.IOException;

import DAL.CDALError;
import DAL.CDal;
import communication.ChangeTeacherRequest;
import communication.ChangeTeacherResponse;
import communication.Message;
import entities.ERequestType;
import ocsf.server.ConnectionToClient;
import utils.Handler;

public class ChangeTeacherRequestHandler implements Handler {

	public void handle(Message msg, Object obj) {
		ConnectionToClient client = (ConnectionToClient) obj;
		ChangeTeacherRequest changeTeacherMsg = (ChangeTeacherRequest)msg;
					
		CDALError error = new CDALError();
		boolean connectionSecceded = CDal.createRequest(ERequestType.changeTeacher, changeTeacherMsg.getTeacherId(), changeTeacherMsg.getClassId(), changeTeacherMsg.getCourseId());		
			
		ChangeTeacherResponse res = new ChangeTeacherResponse(connectionSecceded, error.getString());
		try {
			client.sendToClient(res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
