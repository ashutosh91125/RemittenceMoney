package com.llm.branch.controller;

import com.llm.branch.model.BranchDetails;
import com.llm.branch.service.BranchDetailsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/branch")
@Slf4j
public class BranchDetailsRestController {

    @Autowired
    private BranchDetailsService branchDetailsService;

    @PostMapping
    public ResponseEntity<String> registerBranch(@ModelAttribute BranchDetails branchDetails) {
        log.info(branchDetails.toString());
        try {
            branchDetailsService.createBranch(branchDetails);

            return new ResponseEntity<>("Branch create successfully!", HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Failed to create branch!", HttpStatus.BAD_REQUEST);
        }

    }

    @GetMapping
    public ResponseEntity<String> getAllBranches() {

        try {
            branchDetailsService.getAllBranches();

            return new ResponseEntity<>("Fetched successfully!", HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Failed to fetch the branch details!", HttpStatus.BAD_REQUEST);
        }

    }

}
