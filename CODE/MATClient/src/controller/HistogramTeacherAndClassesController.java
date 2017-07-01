package controller;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import communication.Dispatcher;
import communication.GetClassTeachersStatsResponse;
import communication.Message;
import entities.ClassWithGrade;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.stage.Stage;
import utils.Handler;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;

public class HistogramTeacherAndClassesController implements  Initializable, Handler{
	
	public HistogramTeacherAndClassesController(){
	//	Dispatcher.addHandler(GetClassTeachersStatsResponse.class.getCanonicalName(), this);
	}
	
	
	
	 @FXML
	 private BarChart<?, ?> ClassChart;
	
	@FXML
    private CategoryAxis x;

    @FXML
    private NumberAxis y;
    
	private ArrayList<ClassWithGrade> arrToDisplay;

	
    public ArrayList<ClassWithGrade> getArrToDisplay() {
		return arrToDisplay;
	}

	public void setArrToDisplay(ArrayList<ClassWithGrade> arrToDisplay) {
		this.arrToDisplay = arrToDisplay;
	}
	
	static int count = arrToDisplay.size();
	private int i = 0;
	
	
	
	
	@Override
	public void handle(Message msg, Object obj) {
		// TODO Auto-generated method stub
		
		
		
		XYChart<x,y>.Series set1 = new XYChart.Series<>();
		for(int i=0; i<count;i++){
		set1.getData().add(new XYChart.Data)();
		}
		CourseChart.getData().addAll(set1);
		
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
		
		XYChart<x,y>.Series set1 = new XYChart.Series<>();
		set1.getData().add(new XYChart.Data(arrToDisplay);
		
		
		
		
	}
	
	
	
	
	
	
	
}
