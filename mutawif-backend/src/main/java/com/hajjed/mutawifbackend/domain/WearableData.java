/**
 * 
 */
package com.hajjed.mutawifbackend.domain;

import java.sql.Timestamp;
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
public class WearableData {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private Long tagId;
	private Double latitude;
	private Double longitude;
	private Timestamp timestamp;
	private Date createdAt;
}
