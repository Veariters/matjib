package day0803;

class Ex  
{
	int a;
	public void aa()
	{
		System.out.println("Ex 클래스의 a : " + a);
	}
	
}



public class Exam01 // 실행 클래스 (main을 가지고있는)
{
	int a; // 전역변수 , 인스턴스 변수
	// 전역변수는 초기화 하지 않을 경우 기본 자료형 기준으로 자동으로 초기화가 이루어짐
	boolean bb;
	String s;
	char c=0;
	// 클래스의 멤버필드 (속성) : 인스턴스를 생성해야만 접근이 가능하다.
	// 인스턴스는 객체를 의미함
	// 객체를 생성하는 방법 : 클래스명 객체명 = new 클래스명과 동일한 함수명(생성자);
	
	public void aa()
	{
		System.out.println("나는 인스턴스 함수입니다~~.");	
	}
	
	public static void bbb()
	{
		System.out.println("나는 클래스 함수 입니다.");
	}
	
	
	// 객체를 생성하지 않고 접근 가능한 속성과 메소드
	static int d; // 클래스변수는 static으로 선언하고 객체를 생성하지 않아도 접근이 가능 , static : 공유를 의미
	
	public static void main(String[] args)
	{
		Exam01 b = new Exam01();  // new까지 치고 컨트롤 스페이스
	//클래스명 객체명 = new 클래스명과 동일한 함수명(생성자);
		Ex e = new Ex();
		
		Add ad = new Add(); // 다른 클래스에 만든 더하기 식
		Sub sb = new Sub(); // 다른 클래스에 만든 빼기 식
		
		
		System.out.println(b.a);
		System.out.println(b.s);
		System.out.println(b.bb);
		System.out.println(b.c); //char의 기본형은 아스키코드의 공백
		
		// 클래스 변수 : 객체를 생성하지 않아도 접근이 가능
		System.out.println(Exam01.d);
		
		int a = 10; // 지역변수
		System.out.println("a: " +a);
		// 지역변수는 초기화를 하지 않을 경우 에러가 발생.
		
		// 인스턴스 메소드 호출 ->> 객체를 통해서 호출
		b.aa();
//		aa(); -> 이건 에러남. 
		
		// 클래스 메소드 호출 ->> 객체없이 호출
		bbb();
		
		e.aa(); // 다른 클래스의 인스턴스함수
		
		//반환형이 있을 경우 (리턴) 반환하여 저장할 수 있는 메모리 공간이 있어야한다.
		int i = ad.add(10,20);
//		ad.add(10, 20); 
		int n = sb.sub(20,10);
		
		System.out.println("덧셈 결과 : " + i);
		System.out.println("뺄셈 결과 : " + n);
		
	}
}
