package com.xworkz.parkingrental.entity;

import java.time.LocalTime;
import javax.persistence.*;

import lombok.*;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@ToString
@Entity
@Table(name = "user_registration")
@NamedQuery(
		name = "findByUserEmail",
		query = "select u from UserEntity u where u.email = :mail"
)
public class UserEntity {

	@Id
	@Column(name = "ID")
	private int id;

	@Column(name = "NAME")
	private String name;

	@Column(name = "EMAIL_ID")
	private String email;

	@Column(name = "CONTACT_NO")
	private long phoneNo;

	@Column(name = "CREATED_BY")
	private String createdBy;

	@Column(name = "CREATED_DATE")
	private String createdDate;

	@Column(name = "UPDATED_BY")
	private String updatedBy;

	@Column(name = "UPDATE_DATE")
	private String updatedDate;

	@Column(name = "OTP")
	private Integer otp;

	@Column(name = "COUNT")
	private int otpCount;

	@Column(name = "STATUS")
	private String acctStatus;

	@Column(name = "EXPIRE_ON")
	private LocalTime otpExpiryTime;
}
