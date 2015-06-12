package com.auction.domain;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class IdNameEntity implements Comparable<IdNameEntity>, Serializable {
	private static final long serialVersionUID = 4589843057412283997L;

	private Long id;
	private String name;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_gen")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public int compareTo(IdNameEntity o) {
		return getId().compareTo(o.getId());
	}

	@Override
	public int hashCode() {
		return getId() == null ? 0 : id.intValue();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}
		if ((!(obj instanceof IdNameEntity))) {
			return false;
		}
		IdNameEntity tempId = (IdNameEntity) obj;
		return getId().equals(tempId.getId());
	}

}
