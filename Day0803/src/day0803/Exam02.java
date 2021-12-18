package day0803;
// 참고 . 정석 233p 2.3 객체의 구성요소 - 속성과 기능

// 사각형의 넓이와 둘레를 구하는 프로그램을 구현하시오

// Rect 클래스 정의 (설계)
// 클래스의 속성 (필드, 변수) : 가로, 세로 (둘레, 넓이)
// 클래스의 기능 (메소드, 함수) : 넓이 계산, 둘레 계산, 가로세로값을 입력받는 기능, 결과출력기능

// 실행 클래스명 : Exam02.java

import java.util.*;
class Rect // 사각형 클래스
{
	//필드 선언 (속성)
	// 가로, 세로
	int w, h; 
	// 전역변수 : 클래스 안에서 활동하는 변수
	// 멤버변수 : 클래스에 소속되어있는 변수
	
	// 인스턴스 변수 : 인스턴스가 생성될 때 비로소 메모리 할당이 이루어지는 변수
	
	// 메소드의 정의 ( 가로/ 세로 입력기능)
	// void : 메소드 실행 후 메소드를 호출한 곳에 결과를 돌려줄 필요가 없을 경우 지정하는 "반환형"
	// 입력 자체로 끝나기 때문에 돌려줄 필요는 없다.
	void input()
	{
		// 스캐너 인스턴스 생성
		Scanner sc = new Scanner(System.in);
		
		// 입력을 받아 저장할 메모리 공간 할당
		System.out.print("가로 입력: ");
		w = sc.nextInt(); // 전역변수이므로 어디서든 호출가능.
		System.out.print("세로 입력: ");
		h = sc.nextInt();
	}
	
	// 넓이 계산 기능 구현
	// 메소드 실행후 결과가 정수인 경우이기 때문에 리턴 자료형을 int형으로 사용한다.
	int area()
	{
		int result;
		result = w*h;
		return result;
		
		//메소드는 리턴문을 통해서만 결과를 돌려(반환) 주게 된다.
	}
	
	//둘레를 구하는 기능을 가진 메소드 구현
	int length()
	{
		int result;
		result = (w+h)*2;
		return result;
	}
	
	// 결과 출력 메소드 구현 (정의)
	/*
	 * 매개변수를 통해서 데이터를 넘겨받음 (갖고 있지 않은 데이터)
	 * 메소드의 매개변수는 메소드 안에서만 사용됨
	 * 매개변수 선언시 각각의 변수마다
	 * 자료형을 따로 지정해야함
	 */
	// 반환형 메소드명(매개변수자료형 변수명, 자료형 변수명 ...)
	void print(int a, int i)
	{
		// 매개변수 a : 넓이, i : 둘레
		System.out.println("가로: " + w);
		System.out.println("세로: " + h);
		System.out.println("넓이: " + a);
		System.out.println("둘레: " + i);
	}
}

public class Exam02 // 실행 클래스 ( 메인을 보유한 클래스)
{
	public static void main(String[] args)
	{
		// 인스턴스 생성 시 
		// 클래스명 객체명 = new 생성자(=클래스이름)함수();
		Rect re = new Rect();
		// 인스턴스(객체)를 통하여 입력 함수 호출
		
		// 입력 메소드 호출
		re.input();
		
		// 계산 메소드 호출(넓이, 둘레)
		int a = re.area();
		int b = re.length();
		
		// 결과 출력 메소드 호출
		re.print(a, b);
		
		System.out.println("프로그램 종료..");
		
	}
}
