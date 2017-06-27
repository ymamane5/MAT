package controller;

import java.net.URL;
import java.util.ResourceBundle;

import communication.AddStudentToClassRequest;
import communication.AddStudentToClassResponse;
import communication.Dispatcher;
import communication.MATClientController;
import communication.Message;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;
import utils.Handler;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

public class AddStudentToClassController implements Handler {
	
	public AddStudentToClassController(){
		Dispatcher.addHandler(AddStudentToClassResponse.class.getCanonicalName(), this);
	}
	
	int sid, cid;   // student id, class id

    @FXML
    private ResourceBundle resources;

    @FXML
    private URL location;
    
    @FXML
    private Button btnClose;

    @FXML
    private TextField ClassID;

    @FXML
    private TextField StudentID;

    @FXML
    void sendAddStudent(ActionEvent event) {      	
    	
    	if(ClassID.getText().isEmpty() || StudentID.getText().isEmpty()) {
    		Alert alert = new Alert(AlertType.ERROR);
    		alert.setHeaderText("one or more of the fields is empty");
    		alert.show();
    		Prompt.alert(3,"one or more of the fields is empty");
    	}
    	else { 
    		try {
    	    	sid = Integer.parseInt(StudentID.getText());
    	    	cid = Integer.parseInt(ClassID.getText());
    	    	} catch(NumberFormatException e){
    	    	Prompt.alert(3,"please enter numerical value");
    	    	return;
    	    	}  
    		AddStudentToClassRequest addStudentReq = new AddStudentToClassRequest(sid, cid);
	        MATClientController.getInstance().sendRequestToServer(addStudentReq);
    	}
    }
      
    @FXML
    void closeAddStodent(ActionEvent event) {	
	    Stage stage = (Stage) btnClose.getScene().getWindow();
	    stage.close();
    }

	public void handle(Message msg, Object obj) {
		// TODO Auto-generated method stub
		if (msg instanceof AddStudentToClassRequest) {
			AddStudentToClassResponse res = (AddStudentToClassResponse)msg;
			if (res.actionSucceed()) {
				 Prompt.alert(1, "student " + sid + " added successfully to class " + cid);
			} else {
				Prompt.alert(3, res.getErrText());	
			}
			
		}
		
	}
}
