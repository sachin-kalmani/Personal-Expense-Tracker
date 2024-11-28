package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name="income_category")
public class IncomeCategory {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int Id;
	
	private String category;

	@ManyToOne
	User user;
	public IncomeCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public IncomeCategory(String category, User user) {
		super();
		this.category = category;
		this.user = user;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}	
}
