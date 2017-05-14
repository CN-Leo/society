package com.bookstore.controller;

import java.util.List;

import com.bookstore.model.Book;
import com.jfinal.core.Controller;

public class BookController extends Controller {
public void getBook(){
	String name =getPara("name").trim();
	System.out.println(name);
	if("".equals(name)){
		
	}else{
		String img =  Book.dao.getBook(name).getStr("img");
		this.setAttr("state", "0");
		this.setAttr("img", img);
		this.renderJson();
		return;
	}
	
}

public void getBooks(){
	
	 List<Book> books =  Book.dao.getBooks();
		this.setAttr("state", "0");
		this.setAttr("books", books);
		this.renderJson();
		return;
	
	
}
}
