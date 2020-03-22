package controller;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import org.jnetpcap.Pcap;
import org.jnetpcap.PcapIf;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TextArea;

public class Controller implements Initializable{
	
	@FXML
	private ListView<String> networkListView;
	
	@FXML
	private TextArea textArea;
	
	@FXML
	private Button pickButton;
	
	
	//ListView에 담길 수 있는 배열을 만들어 줄 것임!
	ObservableList<String> networkList = FXCollections.observableArrayList();
	
	private ArrayList<PcapIf> allDevs = null;
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		allDevs = new ArrayList<PcapIf>();
		StringBuilder errbuf = new StringBuilder();
		int r = Pcap.findAllDevs(allDevs, errbuf);
		if(r== Pcap.NOT_OK || allDevs.isEmpty()) {
			textArea.appendText("네트워크장치를 찾을 수 없습니다.\n" + errbuf.toString()+"\n");
			return;
		}
		textArea.appendText("네트워크 장치를 찾았습니다.\n원하시는 장치를 선택해주세요.\n");
		for(PcapIf device : allDevs) {
			networkList.add(device.getName()+" "+
					((device.getDescription() !=null) ? device.getDescription() : "설명이 없습니다."));
					
		}
		networkListView.setItems(networkList);
	}
	
	public void networkPickAction() {
		if(networkListView.getSelectionModel().getSelectedIndex() < 0) {
			//프로그램을 실행했을 때 아무것도 선택하지 않고 pick버튼을 누르면 -1이 반환되어 에러가 날 수 있다.
			//때문에 getSeclectedIndex()가 0보다 작으면 return 시켜주는 것이다.
			return;
		}
		Main.device= allDevs.get(networkListView.getSelectionModel().getSelectedIndex());
		networkListView.setDisable(true);// 선택을 하면 더이상 networkListView를 건드릴 수 없도록 setDisable을 true로 바꿔줌.
		pickButton.setDisable(true);
		
		int snaplen = 64*1024;
		int flags = Pcap.MODE_PROMISCUOUS;
		int timeout =1; //o.oo1초마다 패킷캡쳐
		
		StringBuilder errbuf = new StringBuilder();
		Main.pcap = Pcap.openLive(Main.device.getName(), snaplen, flags, timeout, errbuf);
		
		if(Main.pcap ==null) {
			textArea.appendText("네트워크 장치를 열 수 없습니다.\n"+errbuf.toString()+"\n");
			return;
		}
		textArea.appendText("장치 선택: "+ Main.device.getName()+"\n"); //장치 이름 출력해주기
		textArea.appendText("네트워크 장치를 활성화하는데 성공했습니다.");
		
	}
	
}
