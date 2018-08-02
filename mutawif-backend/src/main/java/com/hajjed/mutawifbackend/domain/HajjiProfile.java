/**
 * 
 */
package com.hajjed.mutawifbackend.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

/**
 * @author Shoaib
 *
 */
@Entity
@Data
public class HajjiProfile {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String name;
	private String passportNumber;
	private Long mutawifId;
	private Long wearableId;
	private Date createdAt;
	private Date updatedAt;

}
