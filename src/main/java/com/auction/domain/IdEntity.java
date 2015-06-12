package com.auction.domain;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class IdEntity implements Comparable<IdEntity>, Serializable {
	private static final long serialVersionUID = 4589843057412283997L;

	private Long id;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_gen")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public int compareTo(IdEntity o) {
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
		if ((!(obj instanceof IdEntity))) {
			return false;
		}
		IdEntity tempId = (IdEntity) obj;
		return getId().equals(tempId.getId());
	}

}
