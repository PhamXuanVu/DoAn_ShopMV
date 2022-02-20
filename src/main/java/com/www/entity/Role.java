package com.www.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "role")
public class Role implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5897519446505320077L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "name", nullable = false)
	private String name;
	
	@ManyToMany(mappedBy = "roles")
	private Set<User> users;

	@Override
	public String toString() {
		return "Role{" +
				"id=" + id +
				", name='" + name + '\'' +
				'}';
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Role(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public Role(String roleName) {
		this.name = roleName;
	}

	public Role() {
	}
}
