/**
 * 
 */
package com.hajjed.mutawifbackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hajjed.mutawifbackend.domain.HajjiProfile;

/**
 * @author Shoaib
 *
 */
public interface HajjiProfileRepository extends JpaRepository<HajjiProfile, Long> {

	List<HajjiProfile> findByMutawifId(Long mutawifId);
}
