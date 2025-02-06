package com.llm.iddetail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.llm.iddetail.model.IdDetail;
import com.llm.iddetail.repository.IdDetailRepository;
import com.llm.iddetail.service.IdDetailsService;

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



}