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
		
		//2계층 정보 담는 곳
		Ethernet eth = new Ethernet();
		//3계층
		Ip4 ip = new Ip4();
		//4계층
		Tcp tcp = new Tcp();
		
		//데이터 들어가는 공간
		Payload payload = new Payload();
		
		PcapHeader header = new PcapHeader(JMemory.POINTER);
		JBuffer buf = new JBuffer(JMemory.POINTER);
		// pcap의 데이터링크타입을 jnetpcap 프로토콜 id값으로 맵핑시켜주는 역할.
		int id = JRegistry.mapDLTToId(pcap.datalink());
		
		while(pcap.nextEx(header, buf) == Pcap.NEXT_EX_OK) {
			PcapPacket packet = new PcapPacket(header, buf);
			packet.scan(id);
			System.out.printf("[ #%d ]\n ", packet.getFrameNumber());
			if (packet.hasHeader(eth)) {
				//출발지 맥주소와 도착지 맥 알 수 있음.
				System.out.printf("출발지 MAC 주소 = %s\n도착지 MAC 주소 = %s\n",FormatUtils.mac(eth.source()),FormatUtils.mac(eth.destination()));
			}
			if (packet.hasHeader(ip)) {
				//출발지 ip주소와 도착지 ip주소 알 수 있음.
				System.out.printf("출발지 IP 주소 = %s\n도착지 IP 주소 = %s\n",FormatUtils.ip(ip.source()),FormatUtils.ip(ip.destination()));
			}
			if (packet.hasHeader(tcp)) {
				//출발지 포트번호와 도착지 포트번호 알 수 있음.
				System.out.printf("출발지 TCP 주소 = %d\n도착지 TCP 주소 = %d\n",tcp.source(),tcp.destination());
			}
			if(packet.hasHeader(payload)) {
				System.out.printf("페이로드의 길이 = %d \n", payload.getLength());
				System.out.printf(payload.toHexdump());
			}
			
		}
		
		pcap.close();
	}

}
