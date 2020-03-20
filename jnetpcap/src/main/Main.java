package main;

import java.util.ArrayList;
import java.util.Date;

import org.jnetpcap.Pcap;
import org.jnetpcap.PcapIf;
import org.jnetpcap.packet.PcapPacket;
import org.jnetpcap.packet.PcapPacketHandler;

// 내 컴퓨터에 존재하는 네트워크 어댑터 출력하는 프로그램

public class Main {

	public static void main(String[] args) {
		
		ArrayList<PcapIf> allDevs = new ArrayList<PcapIf>();
		// 오류메세지가 나왔을때 담는 역할
		StringBuilder errbuf = new StringBuilder();
		
		int r = Pcap.findAllDevs(allDevs, errbuf);
		if(r == Pcap.NOT_OK || allDevs.isEmpty()) {
			System.out.println("네트워크 장치를 못찾겠다 꾀꼬리" + errbuf.toString());
			return;
		}
		
		System.out.println("[ 네트워크 장비 탐색 성공!] ");
		int i = 0;
		for (PcapIf device : allDevs) {
			String description = (device.getDescription() != null)?
					device.getDescription() : "징비에 대한 설명이 없습니다.";
			System.out.printf("[%d번] : %s [%s]\n",i++,device.getName(),description);
		}
		
		PcapIf device = allDevs.get(0);
		System.out.printf("선택한 장치: %s\n",(device.getDescription() != null)?
				device.getDescription() : device.getName());
		
		int snaplen = 64 * 1024;
		int flags = Pcap.MODE_PROMISCUOUS;  //내 컴퓨터에 들어오는 패킷들을 검열없이 받아들이겠다
		int timeout = 10*1000;
		
		Pcap pcap = Pcap.openLive(device.getName(), snaplen, flags , timeout, errbuf);
		
		if (pcap == null) {
			System.out.printf("패킷 캡처를 위해 네트워크 장치를 여는데에 실패했습니다. 오류: " + errbuf.toString());
			return;
		}
		
		
		PcapPacketHandler<String> jPacketHandler = new PcapPacketHandler<String>() {
			//기본적으로 패킷을 처리할 수 있도록 도와주는 제이넷피캡의 클래스.
			//정해진 양식에 맞게 사용해야하기 때문에 override 해주어야함.
			@Override
			public void nextPacket(PcapPacket packet, String user) {
				System.out.printf("캡쳐 시각: %s \n패킷의 길이: %-4d\n",
						new Date(packet.getCaptureHeader().timestampInMillis()),
								packet.getCaptureHeader().caplen());
			}
			
		};
		
		pcap.loop(10, jPacketHandler, "jNetPcap");
		pcap.close();
		
	}

}
