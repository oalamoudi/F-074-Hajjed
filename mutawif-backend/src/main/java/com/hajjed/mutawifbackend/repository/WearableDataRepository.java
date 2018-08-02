/**
 * 
 */
package com.hajjed.mutawifbackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hajjed.mutawifbackend.domain.WearableData;

/**
 * @author Shoaib
 *
 */
public interface WearableDataRepository extends JpaRepository<WearableData, Long> {

	WearableData findOneByTagIdOrderByTimestampDesc(Long tagId);

}
