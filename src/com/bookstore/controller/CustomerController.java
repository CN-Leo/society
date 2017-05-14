package com.bookstore.controller;

import java.util.List;

import com.bookstore.model.Admin;
import com.bookstore.model.Customer;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class CustomerController extends Controller {
		public void index() {
			
		}
		public void login(){
			Customer user = Customer.dao.login(getPara("username"));	
			if(user!=null&&user.getStr("password").equals(getPara("password")))
			{
			this.setAttr("user",user );
			this.renderJsp("/index/hello.jsp");
			}
			else
			{
			this.setAttr("unlogin", "用户名或密码错误！");
			this.setAttr("user", null);
			this.renderJsp("/index/login.jsp");
			}
			
		}
		public void adminLogin(){
			Admin user = Admin.dao.login(getPara("username"));	
			if(user!=null&&user.getStr("password").equals(getPara("password")))
			{
			this.setAttr("user",user );
			this.renderJsp("/index.jsp");
			}
			else
			{
			this.setAttr("unlogin", "用户名或密码错误！");
			this.setAttr("user", null);
			this.renderJsp("/login.jsp");
			}
			
		}
		public void adminList(){
			Admin counts = Admin.dao.findFirst("select count(id) as count from rooter");
			long count = counts.get("count");
			int con =(int) count;
		
		
			String pagenum = this.getPara("pagenum");
	        String pagesize = this.getPara("pagesize");
	  
	        if(pagenum == null || pagenum.equals(""))
	        {
	        	pagenum = "1";
	        }
	        if(pagesize == null || pagesize.equals(""))
	        {
	        	pagesize = "10";
	        }
	      	int pnum = Integer.valueOf(pagenum);
	    	int psize = Integer.valueOf(pagesize);
	    	int lastPage=con%psize==0?con/psize:con/psize+1;
	    	
	    	int nextPage=(pnum!=lastPage)?pnum+1:lastPage;
	    	int previousPage=(pnum!=1)?pnum-1:1;
	        List<Admin> ads = Admin.dao.adminList(pagenum,pagesize);
	        	this.setAttr("count", con);
	        	this.setAttr("nextPage", nextPage);
	        	this.setAttr("previousPage", previousPage);
	        	this.setAttr("lastPage", lastPage);
	    		this.setAttr("ads", ads);
				this.renderJsp("/admin-list.jsp");
		}
/*		public void cutomerList(){
			List<Customer> cuss = Customer.dao.cutomerList();
	
			this.setAttr("cuss", cuss);
			this.renderJsp("/member-list.jsp");
		}*/
		public void cutomerList()
		{
			Customer counts = Customer.dao.findFirst("select count(id) as count from customer");
			long count = counts.get("count");
			int con =(int) count;
		
		
			String pagenum = this.getPara("pagenum");
	        String pagesize = this.getPara("pagesize");
	  
	        if(pagenum == null || pagenum.equals(""))
	        {
	        	pagenum = "1";
	        }
	        if(pagesize == null || pagesize.equals(""))
	        {
	        	pagesize = "10";
	        }
	      	int pnum = Integer.valueOf(pagenum);
	    	int psize = Integer.valueOf(pagesize);
	    	int lastPage=con%psize==0?con/psize:con/psize+1;
	    	
	    	int nextPage=(pnum!=lastPage)?pnum+1:lastPage;
	    	int previousPage=(pnum!=1)?pnum-1:1;
	        List<Customer> cuss = Customer.dao.cutomerList(pagenum,pagesize);
	        	this.setAttr("count", con);
	        	this.setAttr("nextPage", nextPage);
	        	this.setAttr("previousPage", previousPage);
	        	this.setAttr("lastPage", lastPage);
	    		this.setAttr("cuss", cuss);
				this.renderJsp("/member-list.jsp");
	    	
		}
		public void addCustomer(){
			System.out.println("我执行了");
		 Customer.dao.newCus(getPara("username"), getPara("password"), getPara("sex"),getPara("phone"), getPara("address"), getPara("email"));
		
		 this.renderHtml("<h1>添加成功！</h1>");
		}
		public void exit(){
			this.redirect("/login.jsp");
		}
		public void exit4Hello(){
			this.redirect("/index/login.jsp");
		}
}
