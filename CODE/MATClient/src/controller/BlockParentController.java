package controller;


import java.net.URL;
import java.util.ResourceBundle;

import communication.BlockParentRequest;
import communication.BlockParentResponse;
import communication.Dispatcher;
import communication.MATClientController;
import communication.Message;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import utils.Handler;



public class BlockParentController implements Initializable, Handler {
	
	public BlockParentController(){
		Dispatcher.addHandler(BlockParentResponse.class.getCanonicalName(), this);
	}
	
	private int pid;

    @FXML
    private TextField ParentID;

    @FXML
    private Button btnClose;

	    @FXML
	    void BlockParent(ActionEvent event) {
	    	
	    	if(ParentID.getText().isEmpty()) 
			 	Prompt.alert(3,"please enter Parent Id");		    	
	    	else {  		    		
	    		try {
				    pid = Integer.parseInt(ParentID.getText());
			    	
					BlockParentRequest ParentData = new BlockParentRequest(pid, true);
	    			MATClientController.getInstance().sendRequestToServer(ParentData);
			    	} catch(NumberFormatException e){
			    	Prompt.alert(3,"please enter numerical value");
			    	return;
			    	}
	    		
	    		}	    			
	    }
	    
	    @FXML
	    void closeBlockParent(ActionEvent event) {	
		    Stage stage = (Stage) btnClose.getScene().getWindow();
		    stage.close();
	    }

		public void handle(Message msg, Object obj) {
			// TODO Auto-generated method stub
			
			if (msg instanceof BlockParentResponse) {
				BlockParentResponse res = (BlockParentResponse)msg;
				
				try {
					localPrompt(pid, res.getErrText(), res.isRequestSecceded());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				/*
				if (res.isRequestSecceded())  {
					 Prompt.alert(1, "Parent " + pid + " has been blocked ");
					 System.out.println("Parent " + pid + " has been blocked ");
				} else {
					Prompt.alert(3, res.getErrText());	
				}
				*/
			}
			
			
		}
		
		public void localPrompt(final int pid, final String eror, final boolean succ)  throws Exception {
			
			Platform.runLater(new Runnable() {
				int parentId = pid;		
				String erorText = eror;
				boolean success = succ;
				
				public void run() {
					if(success)
						Prompt.alert(1, "Parent " + parentId + " has been blocked ");
					else
						Prompt.alert(3, erorText);
				}
			} );
		}

		public void initialize(URL arg0, ResourceBundle arg1) {
			// TODO Auto-generated method stub
			
			
		}
	}

