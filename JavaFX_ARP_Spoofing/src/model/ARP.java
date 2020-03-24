//주소 결정하는 프로토콜
package model;

import java.util.Arrays;

public class ARP {	//ARP패킷을 정의한 클래스이다.
	
	private byte[] destinationMAC = new byte[6];
	private byte[] sourceMAC = new byte[6];
	private byte[] ethernetType = {0x08, 0x06}; //ARP는 ethernetType이 0806이다.
	private byte[] hardwareType = {0x00, 0x01}; //Ethernet
	private byte[] protocolType = {0x08, 0x00}; //IPv4
	private byte hardwareSize = 0x06; //MAC Size
	private byte protocolSize = 0x04; //IP Size
	private byte[] opcode = new byte[2]; //Request는 0001이었음
	private byte[] senderMAC = new byte[6];
	private byte[] senderIP = new byte[4];
	private byte[] targetMAC = new byte[6];
	private byte[] targetIP = new byte[4];
	
	
	public void makeARPRequest(byte[] sourceMAC, byte[] senderIP, byte[] targetIP) {
		//이걸 이용해서 실제로 ARP Request패킷을 만들어 전송할 수 있음.
		Arrays.fill(destinationMAC, (byte)0xff); //브로드캐스트라는 의미.
		System.arraycopy(sourceMAC, 0, this.sourceMAC, 0, 6);
		opcode[0] = 0x00; opcode[1] = 0x01; //Request
		System.arraycopy(sourceMAC, 0, this.senderMAC, 0, 6);
		System.arraycopy(senderIP, 0, this.senderIP, 0, 4);
		Arrays.fill(targetMAC, (byte)0x00); //현재 상대 MAC을 모르기때문에 0으로 채워줌
		System.arraycopy(targetIP, 0, this.targetIP, 0, 4);
	}
	public void makeARPRePly(byte[] destinationMAC, byte[] sourceMAC, byte[] senderMAC, byte[] senderIP,byte[] targetMAC, byte[] targetIP) {
		System.arraycopy(destinationMAC, 0, this.destinationMAC, 0, 6);
		System.arraycopy(sourceMAC, 0, this.sourceMAC, 0, 6);
		opcode[0]=0x00; opcode[1]= 0x02; //Reply
		System.arraycopy(senderMAC, 0, this.senderMAC, 0, 6);
		System.arraycopy(senderIP, 0, this.senderIP, 0, 4);
		System.arraycopy(targetMAC, 0, this.targetMAC, 0, 6);
		System.arraycopy(targetIP, 0, this.targetIP, 0, 4);
	}
	
	
	public byte[] getPacket() {
		
		byte[] bytes = new byte[42]; //ARP패킷은 총 42바이트로 구성되어 있음. 
		System.arraycopy(destinationMAC, 0, bytes, 0, destinationMAC.length); //0번째부터 6만큼 destinationMAC 들어감.
		System.arraycopy(sourceMAC, 0, bytes, 6, sourceMAC.length); //6번째부터 6만큼 들어감.
		System.arraycopy(ethernetType, 0, bytes, 12, ethernetType.length);
		System.arraycopy(hardwareType, 0, bytes, 14, hardwareType.length);
		System.arraycopy(protocolType, 0, bytes, 16, protocolType.length);
		bytes[18] = hardwareSize;
		bytes[19] = protocolSize;
		System.arraycopy(opcode, 0, bytes, 20, opcode.length);
		System.arraycopy(senderMAC, 0, bytes, 22, senderMAC.length);
		System.arraycopy(senderIP, 0, bytes, 28, senderIP.length);
		System.arraycopy(targetMAC, 0, bytes, 32, targetMAC.length);
		System.arraycopy(targetIP, 0, bytes, 38, targetIP.length);
		
		
		return bytes;
	}
	
}
