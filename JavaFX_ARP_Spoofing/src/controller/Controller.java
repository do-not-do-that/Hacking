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
	
	//ListView�� ��� �� �ִ� �迭�� ����� �� ����!
	ObservableList<String> networkList = FXCollections.observableArrayList();
	
	private ArrayList<PcapIf> allDevs = null;
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		allDevs = new ArrayList<PcapIf>();
		StringBuilder errbuf = new StringBuilder();
		int r = Pcap.findAllDevs(allDevs, errbuf);
		if(r== Pcap.NOT_OK || allDevs.isEmpty()) {
			textArea.appendText("��Ʈ��ũ��ġ�� ã�� �� �����ϴ�.\n" + errbuf.toString()+"\n");
			return;
		}
		textArea.appendText("��Ʈ��ũ ��ġ�� ã�ҽ��ϴ�.\n���Ͻô� ��ġ�� �������ּ���.\n");
		for(PcapIf device : allDevs) {
			networkList.add(device.getName()+" "+
					((device.getDescription() !=null) ? device.getDescription() : "������ �����ϴ�."));
					
		}
		networkListView.setItems(networkList);
	}
	
	public void networkPickAction() {
		if(networkListView.getSelectionModel().getSelectedIndex() < 0) {
			//���α׷��� �������� �� �ƹ��͵� �������� �ʰ� pick��ư�� ������ -1�� ��ȯ�Ǿ� ������ �� �� �ִ�.
			//������ getSeclectedIndex()�� 0���� ������ return �����ִ� ���̴�.
			return;
		}
		Main.device= allDevs.get(networkListView.getSelectionModel().getSelectedIndex());
		networkListView.setDisable(true);// ������ �ϸ� ���̻� networkListView�� �ǵ帱 �� ������ setDisable�� true�� �ٲ���.
		pickButton.setDisable(true);
		
		int snaplen = 64*1024;
		int flags = Pcap.MODE_PROMISCUOUS;
		int timeout =1; //o.oo1�ʸ��� ��Ŷĸ��
		
		StringBuilder errbuf = new StringBuilder();
		Main.pcap = Pcap.openLive(Main.device.getName(), snaplen, flags, timeout, errbuf);
		
		if(Main.pcap ==null) {
			textArea.appendText("��Ʈ��ũ ��ġ�� �� �� �����ϴ�.\n"+errbuf.toString()+"\n");
			return;
		}
		textArea.appendText("��ġ ����: "+ Main.device.getName()+"\n"); //��ġ �̸� ������ֱ�
		textArea.appendText("��Ʈ��ũ ��ġ�� Ȱ��ȭ�ϴµ� �����߽��ϴ�.");
		
	}
	
	
	
	public void getMACAction() {
		if(!pickButton.isDisable()) { //���� ��ġ�� �������� �ʾҴٸ�
			textArea.appendText("��Ʈ��ũ ��ġ�� ���� �������ּ���,\n");
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
			textArea.appendText("IP �ּҰ� �߸��Ǿ����ϴ�.\n");
			return;
		}
		
		
	}
	
}
