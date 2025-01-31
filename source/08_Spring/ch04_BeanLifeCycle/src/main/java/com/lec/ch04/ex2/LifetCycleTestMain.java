package com.lec.ch04.ex2;

import org.springframework.context.support.GenericXmlApplicationContext;

public class LifetCycleTestMain {
	public static void main(String[] args) {
		String location = "classpath:META-INF/ex2/applicationCTX.xml";
//		AbstractApplicationContext ctx = new GenericXmlApplicationContext(location); // 컨테이너 생성 -> 파싱 -> 객체생성

		// IOC 컨테이너 생성
		System.out.println("1. 컨테이너 생성");
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();

		// 파싱
		System.out.println("2. 파싱");
		ctx.load(location);

		// 객체생성
		System.out.println("3. 객체생성");
		ctx.refresh();

		// bean 사용
		System.out.println("4. 빈 주입 받아 사용");
		Person person = ctx.getBean("person", Person.class);
		System.out.println(person);
		OtherPerson otherPerson = ctx.getBean("otherPerson", OtherPerson.class);
		System.out.println(otherPerson);
		System.out.println("==================================");
		System.out.println("5. IOC 컨테이너 소멸하면 빈도 자동 소멸");
		ctx.close();
	}
}
