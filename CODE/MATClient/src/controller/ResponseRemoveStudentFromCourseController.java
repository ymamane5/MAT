package controller;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import communication.GetPendingRequestsResponse;
import communication.MATClientController;
import communication.Message;
import communication.PrincipalDecisionRequest;
import entities.ERequestType;
import entities.Request;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import utils.Handler;

/**
 * The Class ResponseRemoveStudentFromCourseController.
 */
public class ResponseRemoveStudentFromCourseController implements Initializable, Handler{

	/** The all requests. */
	private ArrayList<Request> allRequests;
	
	
    /**
     * Inits the data.
     *
     * @param allRequests the all requests
     */
    public void initData(ArrayList<Request> allRequests) {
    	data.clear();
		
		for (Request request : allRequests) {
			if(request.getRequestType() == ERequestType.removeStudent)
				data.add(request);
		}
	}


        /** The resources. */
        @FXML
        private ResourceBundle resources;

        /** The location. */
        @FXML
        private URL location;

        /** The user id. */
        @FXML
        private TableColumn<Request, Integer> userId;


        /** The request number. */
        @FXML
        private TableColumn<Request, Integer> requestNumber;

        /** The class number. */
        @FXML
        private TableColumn<Request, Integer> classNumber;

        /** The course id. */
        @FXML
        private TableColumn<Request, Integer> courseId;

        /** The table. */
        @FXML
        private TableView<Request> table;

        /** The btn decline. */
        @FXML
        private Button btnDecline;


        /** The btn confirm. */
        @FXML
        private Button btnConfirm;
        
        
        /** The data. */
        @FXML 
        ObservableList<Request> data= FXCollections.observableArrayList();
        		

        /**
         * Confirm.
         *
         * @param event the event
         */
        @FXML
        void confirm(ActionEvent event) {
        	
        	Request req = table.getSelectionModel().getSelectedItem();
        	PrincipalDecisionRequest msg = new PrincipalDecisionRequest(req, true);
        	
        	MATClientController.getInstance().sendRequestToServer(msg);
        	Prompt.alert(1,"The request was confirmed");
        	data.remove(req);
        
        }

        /**
         * Decline.
         *
         * @param event the event
         */
        @FXML
        void decline(ActionEvent event) {
        	
        	Request req = table.getSelectionModel().getSelectedItem();
        	PrincipalDecisionRequest msg = new PrincipalDecisionRequest(req, false);
        	
        	MATClientController.getInstance().sendRequestToServer(msg);
        	Prompt.alert(1,"The request was declined");	   	
        	data.remove(req);
        }


    	/* (non-Javadoc)
	     * @see utils.Handler#handle(communication.Message, java.lang.Object)
	     */
	    @Override
    	public void handle(Message msg, Object obj) {
    		// TODO Auto-generated method stub
    		
    		if (msg instanceof GetPendingRequestsResponse) {
    		
    		}
    	}	
    	

		/* (non-Javadoc)
		 * @see javafx.fxml.Initializable#initialize(java.net.URL, java.util.ResourceBundle)
		 */
		@Override
		public void initialize(URL location, ResourceBundle resources) {
			// TODO Auto-generated method stub
		
	    	requestNumber.setCellValueFactory(new PropertyValueFactory<Request, Integer>("requestNumber"));
	    	userId.setCellValueFactory(new PropertyValueFactory<Request, Integer>("userId"));
	    	classNumber.setCellValueFactory(new PropertyValueFactory<Request, Integer>("classNumber"));
	    	courseId.setCellValueFactory(new PropertyValueFactory<Request, Integer>("courseId"));

	    	table.setItems(data);
			
		}
    }
