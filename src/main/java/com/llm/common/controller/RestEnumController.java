package com.llm.common.controller;

import com.llm.common.model.EnumEntity;
import com.llm.common.model.EnumValue;
import com.llm.common.service.EnumEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/enumEntities")
public class RestEnumController {

    @Autowired
    private EnumEntityService enumEntityService;

    // Create a new EnumEntity with associated EnumValues
    @PostMapping
    public ResponseEntity<EnumEntity> createEnumEntity(@RequestBody EnumEntity enumEntity) {
        EnumEntity savedEntity = enumEntityService.saveOrUpdateEnumEntity(enumEntity);
        return new ResponseEntity<>(savedEntity, HttpStatus.CREATED);
    }

    // Get a single EnumEntity by key, including its EnumValues
    @GetMapping("/{key}")
    public ResponseEntity<EnumEntity> getEnumEntityByKey(@PathVariable String key) {
        Optional<EnumEntity> enumEntity = enumEntityService.getEnumEntityByKey(key);
        return enumEntity.map(ResponseEntity::ok)
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    // Get all EnumEntities
    @GetMapping
    public ResponseEntity<List<EnumEntity>> getAllEnumEntities() {
        List<EnumEntity> enumEntities = enumEntityService.getAllEnumEntities();
        return ResponseEntity.ok(enumEntities);
    }

    // Add a new EnumValue to an existing EnumEntity
    @PostMapping("/{key}/values")
    public ResponseEntity<EnumEntity> addEnumValue(@PathVariable String key, @RequestBody EnumValue enumValue) {
        Optional<EnumEntity> optionalEnumEntity = enumEntityService.getEnumEntityByKey(key);
        if (optionalEnumEntity.isPresent()) {
            EnumEntity enumEntity = optionalEnumEntity.get();
            enumEntity.getValues().add(enumValue); // Add the new value
            EnumEntity updatedEntity = enumEntityService.saveOrUpdateEnumEntity(enumEntity); // Persist changes
            return new ResponseEntity<>(updatedEntity, HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Delete an EnumEntity by key along with its associated EnumValues
    @DeleteMapping("/{key}")
    public ResponseEntity<Void> deleteEnumEntity(@PathVariable String key) {
        Optional<EnumEntity> existingEntity = enumEntityService.getEnumEntityByKey(key);
        if (existingEntity.isPresent()) {
            enumEntityService.deleteEnumEntity(key);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Delete a specific EnumValue by its ID
    @DeleteMapping("/{key}/values/{valueId}")
    public ResponseEntity<Void> deleteEnumValue(@PathVariable Long valueId) {
        boolean deleted = enumEntityService.deleteEnumValueById(valueId);
        return deleted ? new ResponseEntity<>(HttpStatus.NO_CONTENT)
                : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
    @GetMapping("/dependent")
    public List<EnumValue> getStatesByCountry(@RequestParam("dependent") String dependent) {
        return enumEntityService.getDataByDependent(dependent);
    }
}
