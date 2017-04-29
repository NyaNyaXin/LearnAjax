package com.cx.ajax.app.test;

import java.util.Arrays;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Customer {
	private String name;
	private String id;

	public Customer() {
		super();
	}

	public Customer(String name, String id) {
		super();
		this.name = name;
		this.id = id;
	}

	public String getCustomerName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCity() {
		return "Beijing";
	}
	//@JsonIgnore
	public String getBirth() {
		return "1995-01-30";
	}

	public static void main(String[] args) throws JsonProcessingException {
		// 1.导入jar包
		// 2.创建ObjectMapper对象
		ObjectMapper mapper = new ObjectMapper();
		// 3.调用mapper的writeValueAsString()方法把一个对象转为一个json字符串
		Customer customer = new Customer("chenxin","1001");
		String jsonStr = mapper.writeValueAsString(customer);
		System.out.println(jsonStr);
		//4.注意：JackSon使用getter方法来定位JSON对象的属性！
		//5.可以通过添加注解com.fasterxml.jackson.annotation.JsonIgnore忽略某一个getter定义的属性
		
		
		List<Customer> customers = Arrays.asList(customer,new Customer("wangwang","1002"));
		jsonStr = mapper.writeValueAsString(customers);
		System.out.println(jsonStr);
		
	}
}
