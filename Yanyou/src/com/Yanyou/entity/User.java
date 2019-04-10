package com.Yanyou.entity;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import com.Yanyou.util.DB;

public class User implements HttpSessionBindingListener {

	private String name;
	private String password;
	private String email;
	private String phone;
	private String avatar;
	public static int onlineNum = 0;
	public static int views;

	public User() {

	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public User(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static int getOnlineNum() {
		return onlineNum;
	}

	public void addOnlineNum() {
		onlineNum++;
	}

	public void reduceOnlineNum() {
		onlineNum--;
	}

	public static void addViews() {
		views++;
	}

	public static int getViews() {
		return views;
	}

	public static void setViews(int v) {
		views = v;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", password=" + password + ", email=" + email + ", phone=" + phone + "]";
	}

	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		addOnlineNum();

	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		reduceOnlineNum();
	}

}
