package org.kuali.coeus.sys.framework.auth;

import java.io.Serializable;
import java.time.Instant;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

@SuppressWarnings("serial")
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class AuthUser implements Serializable {
	
	private String id;
	private String schoolId;
	private String name;
	private String username;
	private String email;
	private String phone;
	private String role;
	private String firstName;
	private String lastName;
	private String password;
	
	@JsonIgnore
	private String authToken;
	@JsonIgnore
	private Instant lastValidated;
	@JsonIgnore
	private boolean active = true;
	
	public AuthUser() { 
		super();
		lastValidated = Instant.now();
	}
	
	@JsonProperty
	public String getPassword() {
		return password;
	}

	@JsonIgnore
	public void setPassword(String password) {
		this.password = password;
	}
	
	@JsonIgnore
	public String getId() {
		return id;
	}
	
	@JsonProperty
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getAuthToken() {
		return authToken;
	}
	public void setAuthToken(String authToken) {
		this.authToken = authToken;
	}
	public Instant getLastValidated() {
		return lastValidated;
	}
	public void setLastValidated(Instant lastValidated) {
		this.lastValidated = lastValidated;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null) { return false; }
		if (obj == this) { return true; }
		if (obj.getClass() != getClass()) {
		return false;
		}
		AuthUser rhs = (AuthUser) obj;
		return new EqualsBuilder()
			.append(schoolId, rhs.schoolId)
			.append(name, rhs.name)
			.append(username, rhs.username)
			.append(email, rhs.email)
			.append(phone, rhs.phone)
			.append(role, rhs.role)
			.append(firstName, rhs.firstName)
			.append(lastName, rhs.lastName)
			.isEquals();
	}
	
	@Override
	public String toString() {
		return new ToStringBuilder(this)
			.append(username)
			.append(schoolId)
			.append(name)
			.append(email)
			.append(phone)
			.append(role)
			.append(firstName)
			.append(lastName)
			.append(lastValidated)
			.append(active)
			.toString();
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}
}
