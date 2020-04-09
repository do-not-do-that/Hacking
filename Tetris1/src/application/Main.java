package application;
	
import java.util.Arrays;
import java.util.Timer;
import java.util.TimerTask;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.event.EventHandler;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.input.KeyEvent;
import javafx.stage.Stage;
		

public class Main extends Application {
	
	public static int[][] MESH = new int[Form.XMAX / Form.SIZE][Form.YMAX / Form.SIZE];
	static Group total = new Group();
	public static Scene scene= new Scene(total, Form.XMAX+Form.SMAX,Form.YMAX); 
	
	
	
	@Override
	public void start(Stage Stage) {
		try {
			
			for(int[] a : MESH) {
				Arrays.fill(a, 0);
			}
			total.getChildren().addAll(Form.makeBlock(),Form.makeMesh());
			moveOnKeyPress();
			Stage.setScene(scene);
			
			Stage.show();
			
			Timer fall = new Timer();
			TimerTask task = new TimerTask() {
				public void run() {
					Platform.runLater(new Runnable() {
						public void run() {
						
						}
					});
				}
			};
			fall.schedule(task, 0, 300); 
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void moveOnKeyPress() {
		scene.setOnKeyPressed(new EventHandler<KeyEvent>() {
			
			@Override
			public void handle(KeyEvent event) {
				
				switch (event.getCode()) {
				case RIGHT:
					Controller.MoveRight(); 
					break;
				case LEFT:
					Controller.MoveLeft();
					break;

				}
			}
		});
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
