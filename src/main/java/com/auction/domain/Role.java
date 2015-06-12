package com.auction.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.StringUtils;

@Entity
@Table(name = "role")
@SequenceGenerator(name = "seq_gen", sequenceName = "seq_lm",allocationSize=1)
public class Role extends IdNameEntity implements Serializable {
	private static final long serialVersionUID = 7125264193780764167L;
	private static final int HASH_SEEDS = 99;
	public static final String ADMIN = "ROLE_ADMIN";
	public static final String USER = "ROLE_USER";
	public static final String STORE = "ROLE_STORE";
	public static final Role ROLE_USER = new Role(0L, USER);
	public static final Role ROLE_ADMIN = new Role(1L, ADMIN);
	public static final Role ROLE_STORE = new Role(2L, STORE);

	public Role() {
	}

	public Role(Long id, String name) {
		setId(id);
		setName(name);
	}

	public Role(Long id) {
		setId(id);
	}

	@Override
	public int hashCode() {
		return getName().hashCode() * HASH_SEEDS;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}
		if ((!(obj instanceof Role))) {
			return false;
		}
		Role tempRole = (Role) obj;
		return StringUtils.equalsIgnoreCase(getName(), tempRole.getName());
	}
	public static Role findByRoleId(Long roleId){
		if (Long.valueOf(0).equals(roleId)) {
			return Role.ROLE_ADMIN;
		}
		if (Long.valueOf(1).equals(roleId)) {
			return Role.ROLE_ADMIN;
		}
		if (Long.valueOf(2).equals(roleId)) {
			return Role.ROLE_STORE;
		}
		return null;
		
	}

}
