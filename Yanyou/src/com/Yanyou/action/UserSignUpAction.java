package com.Yanyou.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.CookiesAware;
import org.apache.struts2.interceptor.SessionAware;

import com.Yanyou.entity.User;
import com.Yanyou.util.DB;
import com.opensymphony.xwork2.ActionSupport;

public class UserSignUpAction extends ActionSupport implements SessionAware, CookiesAware {

	private static final long serialVersionUID = 1L;

	private Map session;
	private Map cookie;

	private String checkbox1;
	private String visa;

	private User user = new User();

	public String execute() {
		if (judge()) {
			session.put("user", user);
			session.put("visa", visa);
			return SUCCESS;
		} else {
			return ERROR;
		}

	}

	public String getCheckbox1() {
		return checkbox1;
	}

	public void setCheckbox1(String checkbox1) {
		this.checkbox1 = checkbox1;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO 自动生成的方法存根
		this.session = arg0;
	}

	@Override
	public void setCookiesMap(Map<String, String> arg0) {
		this.cookie = arg0;

	}

	public Boolean judge() {
		DB db = new DB();

		if (db.confirm(user.getName(), user.getPassword())) {// 验证账号密码
			visa = "yes";// 若为真拿到visa

			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd-hh:mm:ss");
			String currentTime = format.format(date);
			this.cookie.put(user.getName(), currentTime);// 拿到当前登录时间并且保存

			if (this.checkbox1 != null) {
				this.cookie.put("name", user.getName());
				this.cookie.put("password", user.getPassword());

			} // 若勾选记住我则保存name&password
			user.setAvatar(db.getAvatar(user.getName()));
			return true;
		} else {
			return false;
		}
	}
}
