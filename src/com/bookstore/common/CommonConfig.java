package com.bookstore.common;
import com.bookstore.controller.BookController;
import com.bookstore.controller.BookTypeController;
import com.bookstore.controller.CustomerController;
import com.bookstore.controller.ShoppingCartController;
import com.bookstore.model.Admin;
import com.bookstore.model.Book;
import com.bookstore.model.BookType;
import com.bookstore.model.Customer;
import com.bookstore.model.ShoppingCart;
import com.jfinal.config.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;


 
public class CommonConfig extends JFinalConfig{
    public void configConstant(Constants me){
        me.setDevMode(true);
    }
    public void configRoute(Routes me){
      me.add("/login",CustomerController.class);
      me.add("/book",BookController.class);
      me.add("/booktype",BookTypeController.class);
      me.add("/shoppingcart",ShoppingCartController.class);
    }
    public void configPlugin(Plugins me){
    	C3p0Plugin cp = new C3p0Plugin("jdbc:mysql://localhost/bookstore",
    			"root", "root");
    	me.add(cp);
    	ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);
		me.add(arp);
		arp.addMapping("customer", "id", Customer.class);
		arp.addMapping("rooter", "id", Admin.class);
		arp.addMapping("book", "id", Book.class);
		arp.addMapping("booktype", "id", BookType.class);
		arp.addMapping("shoppingcart", "id", ShoppingCart.class);
    }
    public void configInterceptor(Interceptors me){}
    public void configHandler(Handlers me){}
}