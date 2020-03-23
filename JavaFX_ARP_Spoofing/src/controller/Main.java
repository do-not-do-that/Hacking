package controller;

import org.jnetpcap.Pcap;
import org.jnetpcap.PcapIf;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class Main extends Application{
	
	
	public static Pcap pcap = null;
	public static PcapIf device = null;
	
	public static byte[] myIP = null; //공격자의 IP
	public static byte[] senderIP = null;  //우리가 목표로 삼고 있는 피해자
	public static byte[] targetIP = null;	//라우터
	
	//sender가 나에게 패킷을 보내도록 하는 것.
	
	public static byte[] myMAC = null;
	public static byte[] senderMAC = null;
	public static byte[] targetMAC = null;
	
	
	private Stage primaryStage;
	private AnchorPane layout;
	
	@Override
	public void start(Stage primaryStage) {
		this.primaryStage = primaryStage;
		this.primaryStage.setTitle("JavaFX ARP Spoofing");
		setLayout();
	}
	
	
	public void setLayout() {
		try {
			FXMLLoader loader = new FXMLLoader();
			loader.setLocation(Main.class.getResource("../view/View.fxml"));
			layout = (AnchorPane) loader.load();
			Scene scene = new Scene(layout);
			primaryStage.setScene(scene);
			primaryStage.show();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public Stage getPrimaryStage() {
		return primaryStage;
	}
	public static void main(String[] args) {
		launch(args); //javaFx에서 기본적으로 제공하는 함수. 런치를 통해 프로그램 실행.
	}

}
