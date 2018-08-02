/**
 * 
 */
package com.hajjed.mutawifbackend.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

/**
 * @author Shoaib
 *
 */
@Data
public class WearableData {

	private Long id;
	private Long tagId;
	private Double latitude;
	private Double longitude;
	private Timestamp timestamp;
	private Date createdAt;
}
