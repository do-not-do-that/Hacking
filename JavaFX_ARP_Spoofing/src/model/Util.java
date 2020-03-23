//프로젝트에서 사용할 모듈을 정의해줌
package model;

public class Util {

	public static String bytesToString(byte[] bytes) {
		StringBuilder sb = new StringBuilder();
		
		int i =0;
		for (byte b : bytes) {
			sb.append(String.format("%02x", b & 0xff)); //bytes를 0xff와 and연산 한 값을 두자리로 넣음.
			if(++i % 16 == 0 ) sb.append("\n"); //16개만큼 출력하고 줄바꿈. (와이어샤크와 동일)
		
		}
		
		return sb.toString();
	}
	
}
