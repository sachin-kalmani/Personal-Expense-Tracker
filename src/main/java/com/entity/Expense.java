package com.entity;

import java.time.LocalDate;
import java.time.Month;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="expenses")
public class Expense {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	private String title;
	
	private  String description;
	
	private String category;
	
	private int amount;

	private int currentYear;
	
	private String currentMonth;

	@ManyToOne
	private User user;
	public Expense() {
		super();
		// TODO Auto-generated constructor stub
	}
	


	public Expense(String title, String description, String category, int amount, int currentYear, String currentMonth,
			User user) {
		super();
		this.title = title;
		this.description = description;
		this.category = category;
		this.amount = amount;
		this.currentYear = currentYear;
		this.currentMonth = currentMonth;
		this.user = user;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public int getCurrentYear() {
		return currentYear;
	}
	public void setCurrentYear(int currentYear) {
		this.currentYear = currentYear;
	}
	public String getCurrentMonth() {
		return currentMonth;
	}
	public void setCurrentMonth(String currentMonth) {
		this.currentMonth = currentMonth;
	}
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
