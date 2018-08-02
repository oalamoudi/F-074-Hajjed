package com.hajjed.mutawifbackend.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hajjed.mutawifbackend.domain.HajjiProfile;
import com.hajjed.mutawifbackend.domain.WearableData;
import com.hajjed.mutawifbackend.domain.WearableInfo;
import com.hajjed.mutawifbackend.dto.HajjiStatusDto;
import com.hajjed.mutawifbackend.repository.HajjiProfileRepository;
import com.hajjed.mutawifbackend.repository.WearableDataRepository;
import com.hajjed.mutawifbackend.repository.WearableInfoRepository;

/**
 * 
 * @author Shoaib
 *
 */
@Service
public class HajjiStatusService {

	@Autowired
	private HajjiProfileRepository hajjiProfileRepository;

	@Autowired
	private WearableDataRepository wearableDataRepository;

	@Autowired
	private WearableInfoRepository wearableInfoRepository;

	public List<HajjiStatusDto> getCurrentStatusOfHajjis(long mutawifId) {
		List<HajjiProfile> mutawifHajjisList = hajjiProfileRepository.findByMutawifId(mutawifId);
		return mutawifHajjisList.stream().map(h -> transformToHajjiStatus(h)).collect(Collectors.toList());
	}

	private HajjiStatusDto transformToHajjiStatus(HajjiProfile hajjiProfile) {

		Optional<WearableInfo> wearableInfo = wearableInfoRepository.findById(hajjiProfile.getWearableId());

		WearableData latestHajjiStatus = wearableDataRepository
				.findOneByTagIdOrderByTimestampDesc(wearableInfo.get().getTagId());

		return new HajjiStatusDto(hajjiProfile.getId(), hajjiProfile.getMutawifId(), hajjiProfile.getName(),
				latestHajjiStatus.getLatitude(), latestHajjiStatus.getLongitude(), latestHajjiStatus.getTagId(),
				latestHajjiStatus.getTimestamp().getTime());
	}

}
