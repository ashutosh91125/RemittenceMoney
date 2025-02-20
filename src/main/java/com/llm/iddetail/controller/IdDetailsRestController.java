package com.llm.iddetail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.llm.iddetail.model.IdDetail;
import com.llm.iddetail.repository.IdDetailRepository;
import com.llm.iddetail.service.IdDetailsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/caas/api/v2/iddetail")
public class IdDetailsRestController {

	@Autowired
	private IdDetailsService idetailsService;

	@Autowired
	private IdDetailRepository idetailRepository;

//	@GetMapping("/id-image/{id}")
//	@ResponseBody
//	public ResponseEntity<?> getImageFrontImage(@PathVariable Long id) {
//		IdDetail idDetails = idetailsService.getById(id).orElseThrow();
//		Map response = new HashMap<>(
//				Map.of("front", idDetails.getFrontBase64Data(), "back", idDetails.getBackBase64Data()));
//		return ResponseEntity.ok(response);
//	}

	@GetMapping("/frontimage/{id}")
	public byte[] getImageFrontImage(@PathVariable Long id) {
		IdDetail idDetails = idetailsService.getById(id).orElseThrow();
		return idDetails.getFrontBase64Data();
	}

	@GetMapping("/backimage/{id}")
	public byte[] getImageBackImage(@PathVariable Long id) {
		IdDetail idDetails = idetailsService.getById(id).orElseThrow();
		return idDetails.getBackBase64Data();
	}

	@GetMapping("/get-by-idnumber/{idNumber}")
	public String getByIdNumber(@PathVariable("idNumber") String idNumber,
			@RequestParam("activeStatus") boolean activeStatus) {
		IdDetail idDetails = idetailsService.getByIdNumber(idNumber);
		if (idDetails != null) {
			idDetails.setActiveStatus(activeStatus);
			idetailRepository.save(idDetails);
			return "status changed successfully";
		}
		return "id not found";

	}
	
	@GetMapping("/verify-idNumber")
	public ResponseEntity<String> verifyWithIdNumber(@RequestParam("idNumber") String idNumber) {
	    boolean existedIdNumber = idetailsService.verifyIdNumber(idNumber);
	    
	    if (existedIdNumber) {
	        return ResponseEntity.ok("ID Number exists: " + idNumber);
	    } else {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("ID Number not found: " + idNumber);
	    }
	}
	@PutMapping("/date-of-expiry/update")
	public ResponseEntity<?> updateIdDetails(@RequestBody List<IdDetail> updatedIdDetails) {
	    try {
	        if (!updatedIdDetails.isEmpty()) {
	            for (IdDetail updatedDetail : updatedIdDetails) {
	                IdDetail idDetails = idetailsService.getByIdNumber(updatedDetail.getIdNumber());
	                if (idDetails != null) {
	                    idDetails.setDateOfExpiry(updatedDetail.getDateOfExpiry());
	                    idDetails.setActiveStatus(updatedDetail.getActiveStatus());
	                    idetailRepository.save(idDetails);
	                }
	            }
	            return ResponseEntity.ok("ID Details updated successfully!");
	        } else {
	            return ResponseEntity.badRequest().body("Invalid request: No details provided.");
	        }
	    } catch (Exception e) {
	    	log.error(e.toString());
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body("Error updating ID Details");
	    }
	}




}