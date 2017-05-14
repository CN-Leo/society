package com.bookstore.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;

public class ShoppingCart extends Model<ShoppingCart> {
	public static ShoppingCart dao = new ShoppingCart();
	public void addShoppingcart(String user,String count,String productid,String proname,String price){
		ShoppingCart cart =dao.findFirst("select * from shoppingcart where productid = '"+productid+"' and cartuser = '"+user+"'");
		if(cart==null){
		Boolean isSc = dao.clear()
		.set("cartuser", user)
		.set("productid", productid)
		.set("quantity",count)
		.set("proname", proname)
		.set("price", price)
		.save();
		}else{
			
			int quantity = cart.getInt("quantity")+Integer.parseInt(count);
			Db.update("update shoppingcart set quantity="+quantity+" where productid = '"+productid+"' and cartuser = '"+user+"'");
		}
		
	}
	public int getCount(String user){
		int result = 0;
	String sql = "select * from shoppingcart where cartuser = '"+user+"'";
	List<ShoppingCart> carts = dao.find(sql);
	if(carts.size()>0){
	for(ShoppingCart cart:carts){
		result+=cart.getInt("quantity");
	}
	return result;
	}else{
		return 0;
	}
	}
	public List<ShoppingCart> getMyCart(String user){
		String sql = "select * from shoppingcart where cartuser = '"+user+"'";
		List<ShoppingCart> carts = dao.find(sql);
		return carts;
	}
	

}
