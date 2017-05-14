package com.bookstore.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class Admin extends Model<Admin> {
	public static final Admin dao = new Admin();
	public Admin login(String username){
		System.out.println(username);
		String sql="select * from rooter where username= '"+username+"'";
		System.out.println(sql);
		Admin ad = dao.findFirst(sql);
		return ad;
	}
	public List<Admin>  adminList(String pagenum,String pagesize){
		
		int pnum = Integer.valueOf(pagenum);
		int psize = Integer.valueOf(pagesize);
	
		 Page<Admin> pCuss = dao.paginate(pnum, psize, "select *","from rooter where 1=?",1);
		 List<Admin> cuss=pCuss.getList();
		 return cuss;
	}
}
