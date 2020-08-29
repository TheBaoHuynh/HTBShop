package com.htbshop.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Customers")
public class Customer {
	@Id
	@NotEmpty(message = "Không để trống tên đăng nhập")
	String id;
	@Length(min = 6, max = 60, message = "Mật khải phải từ 6 đến 20 kí tự")
	String password;
	@NotEmpty(message = "Không để trống họ tên")
	String fullname;
	@NotEmpty(message = "Không để trống email")
	@Email(message = "Email không hợp lệ")
	String email;
	String photo;
	Boolean activated;
	Boolean admin;
	// bo link qua don hang khi truy xuat ajax
	@JsonIgnore
	@OneToMany(mappedBy = "customer")
	List<Order> orders;

	// phan quyen
//	@ManyToMany
//	@JoinTable(name = "UserRole", joinColumns = @JoinColumn(name="UserId"), inverseJoinColumns = @JoinColumn(name= "RoleId"))


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

	public Boolean getActivated() {
		return activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

}
