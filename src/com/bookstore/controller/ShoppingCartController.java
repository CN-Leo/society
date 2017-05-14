package com.bookstore.controller;

import java.util.List;

import com.bookstore.model.ShoppingCart;
import com.jfinal.core.Controller;

public class ShoppingCartController extends Controller {
	public void addShoppingcart(){
		String user =getPara("user");
		String count = getPara("count");
		String productid = getPara("productid");
		String proname = getPara("proname");
		String price = getPara("price");
	ShoppingCart.dao.addShoppingcart(user, count, productid,proname,price);
	this.setAttr("state", "0");
	this.renderJson();
	}
	public void getCount(){
		String user = getPara("user");
		int count = ShoppingCart.dao.getCount(user);
		this.setAttr("state", "0");
		this.setAttr("count", count);
		this.renderJson();
	}
	public void getMyCart(){
		String user =getPara("user");
		List<ShoppingCart> carts = ShoppingCart.dao.getMyCart(user);
		this.setAttr("state", "0");
		this.setAttr("carts", carts);
		this.renderJson();
	}
}
