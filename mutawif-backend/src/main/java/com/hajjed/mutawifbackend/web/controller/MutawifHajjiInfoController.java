/**
 * 
 */
package com.hajjed.mutawifbackend.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hajjed.mutawifbackend.dto.HajjiStatusDto;
import com.hajjed.mutawifbackend.service.HajjiStatusService;

/**
 * @author Shoaib
 *
 */
@RestController
@RequestMapping("/mutawif-hajji")
public class MutawifHajjiInfoController {

	@Autowired
	private HajjiStatusService hajjiStatusService;

	/**
	 * Return the latest status of Hajji's under the Mutawif by Mutawif Id.
	 * 
	 * @param mutawifId
	 * @return
	 */
	@GetMapping("/{id}")
	public List<HajjiStatusDto> getHajjisStatus(@PathVariable long mutawifId) {
		return hajjiStatusService.getCurrentStatusOfHajjis(mutawifId);
	}

}
