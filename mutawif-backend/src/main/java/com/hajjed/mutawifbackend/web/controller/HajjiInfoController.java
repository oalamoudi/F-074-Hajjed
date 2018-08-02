/**
 * 
 */
package com.hajjed.mutawifbackend.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hajjed.mutawifbackend.domain.HajjiProfile;
import com.hajjed.mutawifbackend.repository.HajjiProfileRepository;

/**
 * @author Shoaib
 *
 */
@RestController
@RequestMapping("/hajji")
public class HajjiInfoController {

	@Autowired
	private HajjiProfileRepository hajjiProfileRepository;

	/**
	 * Return the information of Hajji by his Id
	 * 
	 * @param tagId
	 * @return
	 */
	@GetMapping("/{id}")
	public HajjiProfile getLostHajjiByTagId(@PathVariable long id) {
		return hajjiProfileRepository.findById(id).get();
	}
}
