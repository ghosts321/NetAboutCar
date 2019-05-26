package com.nasoft.aboutcar.customer.domain;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mot")
public class Customer implements Serializable{

	@Id  
    @Basic(optional = false)   
    @GeneratedValue(strategy = GenerationType.IDENTITY)   
    @Column(name = "id", nullable = false)
	private String id;
	
	@Column(name="motname")
	private String motname;
	
	@Column(name="motcode")
	private String motcode;
	
	@Column(name="motupper")
	private String motupper;
	
	@Column(name="del")
	private String del;
	
	@Column(name="city")
	private String city;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMotname() {
		return motname;
	}
	public void setMotname(String motname) {
		this.motname = motname;
	}
	public String getMotcode() {
		return motcode;
	}
	public void setMotcode(String motcode) {
		this.motcode = motcode;
	}
	public String getMotupper() {
		return motupper;
	}
	public void setMotupper(String motupper) {
		this.motupper = motupper;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return this.id+" "+this.motname+" "+this.motcode+" "+this.del;
	}
	
}
