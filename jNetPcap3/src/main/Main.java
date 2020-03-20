package main;

import java.util.ArrayList;

import org.jnetpcap.Pcap;
import org.jnetpcap.PcapHeader;
import org.jnetpcap.PcapIf;
import org.jnetpcap.nio.JBuffer;
import org.jnetpcap.nio.JMemory;
import org.jnetpcap.packet.JRegistry;
import org.jnetpcap.packet.Payload;
import org.jnetpcap.packet.PcapPacket;
import org.jnetpcap.packet.format.FormatUtils;
import org.jnetpcap.protocol.lan.Ethernet;
import org.jnetpcap.protocol.network.Ip4;
import org.jnetpcap.protocol.tcpip.Tcp;

// �� ��ǻ�Ϳ� �����ϴ� ��Ʈ��ũ ����� ����ϴ� ���α׷�

public class Main {

	public static void main(String[] args) {
		
		ArrayList<PcapIf> allDevs = new ArrayList<PcapIf>();
		// �����޼����� �������� ��� ����
		StringBuilder errbuf = new StringBuilder();
		
		int r = Pcap.findAllDevs(allDevs, errbuf);
		if(r == Pcap.NOT_OK || allDevs.isEmpty()) {
			System.out.println("��Ʈ��ũ ��ġ�� ��ã�ڴ� �Ҳ���" + errbuf.toString());
			return;
		}
		
		System.out.println("[ ��Ʈ��ũ ��� Ž�� ����!] ");
		int i = 0;
		for (PcapIf device : allDevs) {
			String description = (device.getDescription() != null)?
					device.getDescription() : "¡�� ���� ������ �����ϴ�.";
			System.out.printf("[%d��] : %s [%s]\n",i++,device.getName(),description);
		}
		
		PcapIf device = allDevs.get(0);
		System.out.printf("������ ��ġ: %s\n",(device.getDescription() != null)?
				device.getDescription() : device.getName());
		
		int snaplen = 64 * 1024;
		int flags = Pcap.MODE_PROMISCUOUS;  //�� ��ǻ�Ϳ� ������ ��Ŷ���� �˿����� �޾Ƶ��̰ڴ�
		int timeout = 10*1000;
		
		Pcap pcap = Pcap.openLive(device.getName(), snaplen, flags , timeout, errbuf);
		
		if (pcap == null) {
			System.out.printf("��Ŷ ĸó�� ���� ��Ʈ��ũ ��ġ�� ���µ��� �����߽��ϴ�. ����: " + errbuf.toString());
			return;
		}
		
		//2���� ���� ��� ��
		Ethernet eth = new Ethernet();
		//3����
		Ip4 ip = new Ip4();
		//4����
		Tcp tcp = new Tcp();
		
		//������ ���� ����
		Payload payload = new Payload();
		
		PcapHeader header = new PcapHeader(JMemory.POINTER);
		JBuffer buf = new JBuffer(JMemory.POINTER);
		// pcap�� �����͸�ũŸ���� jnetpcap �������� id������ ���ν����ִ� ����.
		int id = JRegistry.mapDLTToId(pcap.datalink());
		
		while(pcap.nextEx(header, buf) == Pcap.NEXT_EX_OK) {
			PcapPacket packet = new PcapPacket(header, buf);
			packet.scan(id);
			System.out.printf("[ #%d ]\n ", packet.getFrameNumber());
			if (packet.hasHeader(eth)) {
				//����� ���ּҿ� ������ �� �� �� ����.
				System.out.printf("����� MAC �ּ� = %s\n������ MAC �ּ� = %s\n",FormatUtils.mac(eth.source()),FormatUtils.mac(eth.destination()));
			}
			if (packet.hasHeader(ip)) {
				//����� ip�ּҿ� ������ ip�ּ� �� �� ����.
				System.out.printf("����� IP �ּ� = %s\n������ IP �ּ� = %s\n",FormatUtils.ip(ip.source()),FormatUtils.ip(ip.destination()));
			}
			if (packet.hasHeader(tcp)) {
				//����� ��Ʈ��ȣ�� ������ ��Ʈ��ȣ �� �� ����.
				System.out.printf("����� TCP �ּ� = %d\n������ TCP �ּ� = %d\n",tcp.source(),tcp.destination());
			}
			if(packet.hasHeader(payload)) {
				System.out.printf("���̷ε��� ���� = %d \n", payload.getLength());
				System.out.printf(payload.toHexdump());
			}
			
		}
		
		pcap.close();
	}

}
