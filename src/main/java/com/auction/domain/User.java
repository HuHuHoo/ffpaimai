package com.auction.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.auction.constants.Constants;

@Entity
@Table(name = "users")
@SequenceGenerator(name = "seq_gen", sequenceName = "seq_lm", allocationSize = 1)
public class User extends IdNameEntity implements Serializable {
	private static final long serialVersionUID = 4825357646336102778L;
	private String email;
	private String realName;
	private String password;
	private int status;
	private transient Set<Role> roles;

	public User() {
		this.status = Constants.ACTIVE_STATUS;
		addRole(Role.ROLE_USER);
	}

	@Column(name = "email", unique = true, nullable = false)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "users_role", joinColumns = @JoinColumn(name = "username", referencedColumnName = "name"), inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"))
	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Column(name = "real_name", nullable = false)
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Set<Role> addRole(Role role) {
		if (this.roles == null) {
			roles = new HashSet<Role>();
		}
		roles.add(role);
		return roles;
	}

	public void swithStatus() {
		this.status = ((status + 1) % 2);
	}

	@Transient
	public boolean isAdmin() {
		for (Role role : roles) {
			if (Role.ADMIN.equals(role.getName())) {
				return true;
			}
		}
		return false;

	}

	@Transient
	public boolean isStore() {
		for (Role role : roles) {
			if (Role.STORE.equals(role.getName())) {
				return true;
			}
		}
		return false;
	}

}