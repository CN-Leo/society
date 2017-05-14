package com.bookstore.model;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class Customer extends Model<Customer> {
public static final Customer dao = new Customer();
				public boolean newCus(String username, String password, String sex ,String phone,String address,String email){
					if(login(username)==null){
					 dao.clear().set("username",username)
					.set("password", password)
					.set("sex",sex)
					.set("phone",phone)
					.set("address", address)
					.set("email", email)
					.save();
					 return true;
					}
					return false;
					
				}
				public Customer login(String username){
					Customer cus = dao.findFirst("select * from customer where username = '"+username+"'");
					return cus;
				}
			
				public List<Customer>  cutomerList(String pagenum,String pagesize){
				
					int pnum = Integer.valueOf(pagenum);
					int psize = Integer.valueOf(pagesize);
				
					 Page<Customer> pCuss = dao.paginate(pnum, psize, "select *","from customer where 1=?",1);
					 List<Customer> cuss=pCuss.getList();
					 return cuss;
				}
}
