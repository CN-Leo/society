package com.bookstore.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class Book extends Model<Book>{
	public static final Book dao = new Book();
	public Book getBook(String name){
		String sql = "select * from book where bookname like '%"+name+"%'";
		Book book = dao.findFirst(sql);
		return book;
	}
	public List<Book> getBooks(){
		String sql = "select * from book limit 12";
		 List<Book> books = dao.find(sql);
		return books;
	}}
