package com.bookstore.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class BookType extends Model<BookType> {
	public static BookType dao = new BookType();
	public List<BookType> getBookTypes(String type){
		String sql = "select * from booktype where type = '"+type+"'";
		List<BookType> bookTypes = dao.find(sql);
		return bookTypes;
	}

}
