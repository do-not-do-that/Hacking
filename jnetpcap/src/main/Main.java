package main;

import java.util.ArrayList;
import java.util.Date;

import org.jnetpcap.Pcap;
import org.jnetpcap.PcapIf;
import org.jnetpcap.packet.PcapPacket;
import org.jnetpcap.packet.PcapPacketHandler;

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
		
		
		PcapPacketHandler<String> jPacketHandler = new PcapPacketHandler<String>() {
			//�⺻������ ��Ŷ�� ó���� �� �ֵ��� �����ִ� ���̳���ĸ�� Ŭ����.
			//������ ��Ŀ� �°� ����ؾ��ϱ� ������ override ���־����.
			@Override
			public void nextPacket(PcapPacket packet, String user) {
				System.out.printf("ĸ�� �ð�: %s \n��Ŷ�� ����: %-4d\n",
						new Date(packet.getCaptureHeader().timestampInMillis()),
								packet.getCaptureHeader().caplen());
			}
			
		};
		
		pcap.loop(10, jPacketHandler, "jNetPcap");
		pcap.close();
		
	}

}
