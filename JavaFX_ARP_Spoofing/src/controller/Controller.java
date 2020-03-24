package controller;

import java.net.InetAddress;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.ResourceBundle;

import org.jnetpcap.Pcap;
import org.jnetpcap.PcapHeader;
import org.jnetpcap.PcapIf;
import org.jnetpcap.nio.JBuffer;
import org.jnetpcap.nio.JMemory;
import org.jnetpcap.packet.JRegistry;
import org.jnetpcap.packet.PcapPacket;
import org.jnetpcap.protocol.lan.Ethernet;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import model.ARP;
import model.Util;

public class Controller implements Initializable{
	
	@FXML
	private ListView<String> networkListView;
	
	@FXML
	private TextArea textArea;
	
	@FXML
	private Button pickButton;
	
	@FXML
	private TextField myIP;
	
	@FXML
	private TextField senderIP;
	
	@FXML
	private TextField targetIP;
	
	@FXML
	private Button getMACButton;
	
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
		textArea.appendText("네트워크 장치를 활성화하는데 성공했습니다.\n");
		
	}
	
	
	
	public void getMACAction() {
		if(!pickButton.isDisable()) { //아직 장치를 선택하지 않았다면
			textArea.appendText("네트워크 장치를 먼저 선택해주세요,\n");
			return;
		}
		
		ARP arp = new ARP();
		Ethernet eth = new Ethernet();
		PcapHeader header = new PcapHeader(JMemory.POINTER);
		JBuffer buf = new JBuffer(JMemory.POINTER);
		ByteBuffer buffer = null;
		
		int id = JRegistry.mapDLTToId(Main.pcap.datalink());
		
		try {
			Main.myMAC = Main.device.getHardwareAddress();
			Main.myIP = InetAddress.getByName(myIP.getText()).getAddress();
			Main.senderIP = InetAddress.getByName(senderIP.getText()).getAddress();
			Main.targetIP = InetAddress.getByName(targetIP.getText()).getAddress();
		}catch(Exception e) {
			textArea.appendText("IP 주소가 잘못되었습니다.\n");
			return;
		}
		
		myIP.setDisable(true); //더이상 수정 할 수 없도록 해줌.
		senderIP.setDisable(true);
		targetIP.setDisable(true);
		getMACButton.setDisable(true);
		
		arp = new ARP();
		arp.makeARPRequest(Main.myMAC, Main.myIP, Main.targetIP);
		buffer = ByteBuffer.wrap(arp.getPacket());
		if (Main.pcap.sendPacket(buffer) != Pcap.OK) {
			System.out.println(Main.pcap.getErr());
		}
		
		textArea.appendText("타겟에게 ARP Request를 보냈습니다.\n"+ 
				Util.bytesToString(arp.getPacket())+"\n");
		
		
		
		//    [여기부터 reply 구현]
		
		
		Main.targetMAC = new byte[6]; //targetMAC을 초기화해서 맥주소를 담을 수 있게 함.
		while(Main.pcap.nextEx(header,buf) != Pcap.NEXT_EX_NOT_OK) {
			//패킷을 캡쳐하는데 오류가 발생하지않으면
			PcapPacket packet = new PcapPacket(header,buf);
			packet.scan(id);
			
			byte[] sourceIP =  new byte[4]; //나한테 보낸 사람의 IP를 확인하기.
			System.arraycopy(packet.getByteArray(0, packet.size()), 28, sourceIP, 0, 4);
			if (packet.getByte(12)== 0x08 && packet.getByte(13)== 0x06 
					&& packet.getByte(20)== 0x00 
					&& packet.getByte(22)==0x02 
					&& Util.bytesToString(sourceIP).equals(Util.bytesToString(Main.targetIP))
							&& packet.hasHeader(eth)) { //arp 패킷인지 확인하는 작업
				//arp는 0806이었음
				Main.targetMAC = eth.source(); //캡쳐한 패킷에 타겟의 맥주소를 넣어줌.
				break;
				
			} else {
				continue;
			}
		}
		
		textArea.appendText("타겟의 맥 주소: " + 
		Util.bytesToString(Main.targetMAC) + "\n");
		//타겟 (공유기)한테 arp request 패킷을 보내고, 건너온 reply를 받아서 arp 패킷인지 확인한 후에
		//얻어온 맥주소를 타겟 맥주소로 넣어주고 얻어온 맥주소를 출력해옴.
		
		
		
		
		
	}
	
}
