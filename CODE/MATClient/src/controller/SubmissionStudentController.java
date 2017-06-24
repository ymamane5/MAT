package controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;


public class SubmissionStudentController 
{
	 @FXML
	    private ResourceBundle resources;

	    @FXML
	    private URL location;

	    @FXML
	    private Label labelListOfStuSub;

	    @FXML
	    private Button buttonNext;

	    @FXML
	    private ComboBox<String> comboChooseSub;

	    
	    @FXML
	    void nextStudentSubmission(ActionEvent event) throws Exception 
	    {
	    	String option = comboChooseSub.getValue().toString();
	    	int assNum = Integer.parseInt(option);
	    	
	    	Pane root = FXMLLoader.load(getClass().getResource("/gui/CheckAssignment.fxml"));
			Scene scene = new Scene(root);
			Stage primaryStage = new Stage();
			primaryStage.setScene(scene);
			primaryStage.show();
	    }
	    
    @FXML
    void initialize() 
    {
        
    }
}








   











    

