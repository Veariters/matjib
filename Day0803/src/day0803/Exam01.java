package day0803;

class Ex  
{
	int a;
	public void aa()
	{
		System.out.println("Ex Ŭ������ a : " + a);
	}
	
}



public class Exam01 // ���� Ŭ���� (main�� �������ִ�)
{
	int a; // �������� , �ν��Ͻ� ����
	// ���������� �ʱ�ȭ ���� ���� ��� �⺻ �ڷ��� �������� �ڵ����� �ʱ�ȭ�� �̷����
	boolean bb;
	String s;
	char c=0;
	// Ŭ������ ����ʵ� (�Ӽ�) : �ν��Ͻ��� �����ؾ߸� ������ �����ϴ�.
	// �ν��Ͻ��� ��ü�� �ǹ���
	// ��ü�� �����ϴ� ��� : Ŭ������ ��ü�� = new Ŭ������� ������ �Լ���(������);
	
	public void aa()
	{
		System.out.println("���� �ν��Ͻ� �Լ��Դϴ�~~.");	
	}
	
	public static void bbb()
	{
		System.out.println("���� Ŭ���� �Լ� �Դϴ�.");
	}
	
	
	// ��ü�� �������� �ʰ� ���� ������ �Ӽ��� �޼ҵ�
	static int d; // Ŭ���������� static���� �����ϰ� ��ü�� �������� �ʾƵ� ������ ���� , static : ������ �ǹ�
	
	public static void main(String[] args)
	{
		Exam01 b = new Exam01();  // new���� ġ�� ��Ʈ�� �����̽�
	//Ŭ������ ��ü�� = new Ŭ������� ������ �Լ���(������);
		Ex e = new Ex();
		
		Add ad = new Add(); // �ٸ� Ŭ������ ���� ���ϱ� ��
		Sub sb = new Sub(); // �ٸ� Ŭ������ ���� ���� ��
		
		
		System.out.println(b.a);
		System.out.println(b.s);
		System.out.println(b.bb);
		System.out.println(b.c); //char�� �⺻���� �ƽ�Ű�ڵ��� ����
		
		// Ŭ���� ���� : ��ü�� �������� �ʾƵ� ������ ����
		System.out.println(Exam01.d);
		
		int a = 10; // ��������
		System.out.println("a: " +a);
		// ���������� �ʱ�ȭ�� ���� ���� ��� ������ �߻�.
		
		// �ν��Ͻ� �޼ҵ� ȣ�� ->> ��ü�� ���ؼ� ȣ��
		b.aa();
//		aa(); -> �̰� ������. 
		
		// Ŭ���� �޼ҵ� ȣ�� ->> ��ü���� ȣ��
		bbb();
		
		e.aa(); // �ٸ� Ŭ������ �ν��Ͻ��Լ�
		
		//��ȯ���� ���� ��� (����) ��ȯ�Ͽ� ������ �� �ִ� �޸� ������ �־���Ѵ�.
		int i = ad.add(10,20);
//		ad.add(10, 20); 
		int n = sb.sub(20,10);
		
		System.out.println("���� ��� : " + i);
		System.out.println("���� ��� : " + n);
		
	}
}
