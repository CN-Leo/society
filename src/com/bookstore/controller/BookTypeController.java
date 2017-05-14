package com.bookstore.controller;

import java.util.List;

import com.bookstore.model.BookType;
import com.jfinal.core.Controller;

public class BookTypeController extends Controller {
public void getBookTypes(){
	String type = getPara("type").trim();
	List<BookType> bookTypes = BookType.dao.getBookTypes(type);
	this.setAttr("state", "0");
	this.setAttr("booktypes", bookTypes);
	this.renderJson();
}
}
