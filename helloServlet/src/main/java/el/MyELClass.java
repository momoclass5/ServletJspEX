package el;

public class MyELClass {

	public MyELClass() {
		// TODO Auto-generated constructor stub
	}
	
	// 주민번호를 입력받아 성별을 반환 하는 메서드
	// 001225-3000000
	// 001225-2000000 
	public String getGender(String jumin) {
		String res = "";
		try {
			// 문자열의 위치 확인
			int startIndex = jumin.indexOf("-") + 1;
			int endIndex = startIndex + 1;
			// 시작인덱스(포함), 끝인덱스(불포함)
			String gender = jumin.substring(startIndex, endIndex);
			if(gender.equals("1") || gender.equals("3")) {
				res = "남자";
			} else if (gender.equals("2") || gender.equals("4")) {
				res = "여자";
			} else {
				// 예외를 발생
				//throw new Exception();
				res = "주민등록 번호를 확인해주세요";
			}
		} catch (Exception e) {
			res = "주민등록 번호를 확인해주세요";
		}
		return res;
	}
	
	// 입력받은 문자열이 숫자인지 판별하는 정적메서드
	public static boolean isNumber(String value) {
//		try {
//			Integer.parseInt(value);
//			return true;
//		}catch (Exception e) {
//			return false;
//		}
		
		// 입력된 문자열을 char배열로 반환
		char[] chArr = value.toCharArray();
		
		for(int i=0; i<chArr.length; i++) {
			// 문자가 포함되어 있으면 return false;
			// System.out.println(chArr[i]);
			// 48-57
			if(!(chArr[i] >= '0' && chArr[i] <= '9')) {
				return false;
			}
		}
		return true;
		
	}

	// 입력받은 정수까지 구구단을 HTML 테이블로 출력 하는 정적메서드
	// 1~9단까지 출력
	public static String showGugudan(int limitDan) {
		StringBuffer sb = new StringBuffer();
		sb.append("<table border='1'>");
		for(int dan=2; dan<=limitDan; dan++) {
			sb.append("<tr>");
			for(int i=1; i<=9; i++) {
				sb.append("<td>");
				sb.append(dan+"*"+i+"="+(dan*i));
				sb.append("</td>");
			}
			sb.append("</tr>");
		}
		sb.append("</table>");
				
		return sb.toString();
	}
	
	public static void main(String[] args) {
//		MyELClass el = new MyELClass();
//		System.out.println( el.getGender("001225-200000") );
		
//		System.out.println(MyELClass.isNumber("123"));
		
		System.out.println(MyELClass.showGugudan(-1));
				
		
	}
	
	
	
	
	
	
	
	
	
	
}












