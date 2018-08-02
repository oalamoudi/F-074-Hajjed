/**
 * 
 */
package com.hajjed.mutawifbackend.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Shoaib
 *
 */
@Data
@NoArgsConstructor
public class HajjiStatusDto {

	private long hajjiId;
	private long mutawifId;
	private String hajjiName;
	private float latitude;
	private float longitude;
	private long tagId;
	private long lastSeen;

	public HajjiStatusDto(Long id, Long mutawifId2, String name, Double latitude2, Double longitude2, Long tagId2,
			long time) {
	}
}
