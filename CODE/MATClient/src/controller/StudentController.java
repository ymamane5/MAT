package controller;

import java.util.ArrayList;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ComboBox;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

public class StudentController 
{
	ObservableList<String> list ;

    @FXML
    private ComboBox<String> optionCombo;
    
    
    public void studentData1() throws Exception 
    {
    	Pane root = FXMLLoader.load(getClass().getResource("/gui/StudentData.fxml"));
		Scene scene = new Scene(root);
		Stage primaryStage = new Stage();
		primaryStage.setScene(scene);
		primaryStage.show();
    }
    

    /*
    ((Node)event.getSource()).getScene().getWindow().hide(); //hiding primary window
	Stage primaryStage = new Stage();
	FXMLLoader loader = new FXMLLoader();
	Pane root = loader.load(getClass().getResource("/gui/StudentForm.fxml").openStream());
	
	StudentFormController studentFormController = loader.getController();		
	studentFormController.loadStudent(Test.students.get(itemIndex));
	
	Scene scene = new Scene(root);			
	scene.getStylesheets().add(getClass().getResource("/gui/StudentForm.css").toExternalForm());
	
	primaryStage.setScene(scene);		
	primaryStage.show();
    */
    
    
    
    
    public void assignment() throws Exception 
    {
    	
    	Pane root = FXMLLoader.load(getClass().getResource("/gui/AssignmentsStudent.fxml"));
		Scene scene = new Scene(root);
		Stage primaryStage = new Stage();
		primaryStage.setScene(scene);
		primaryStage.show();
    }
    
    
    public void start(Stage primaryStage) throws Exception 
    {
		
		Parent root = FXMLLoader.load(getClass().getResource("/gui/StudentMenu.fxml"));
		Scene scene = new Scene(root);
		primaryStage.setScene(scene);
		primaryStage.show();
	}   
    
    @FXML
    public void StudentInfo(ActionEvent event) throws Exception 
    {
    	
	String option = optionCombo.getValue().toString();
    	if(option.equalsIgnoreCase("Student Data"))
    		studentData1();	
    	if(option.equalsIgnoreCase("Assignment"))
    		assignment();
    }

    @FXML
    void initialize() 
    {
    	ArrayList<String> options = new ArrayList<String>();
    	
    	options.add("Student Data");
      	options.add("Assignment"); 
			
		list = FXCollections.observableArrayList(options);
		optionCombo.setItems(list);

    }
}
