/**
 * 
 */
package com.hajjed.mutawifbackend.domain;

import java.util.Date;

import lombok.Data;

/**
 * @author Shoaib
 *
 */
@Data
public class HajjiProfile {

	private Long id;
	private String name;
	private String passportNumber;
	private Long mutawifId;
	private Long wearableId;
	private Date createdAt;
	private Date updatedAt;

}
