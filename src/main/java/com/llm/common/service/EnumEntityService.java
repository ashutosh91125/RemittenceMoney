package com.llm.common.service;

import com.llm.common.model.EnumEntity;
import com.llm.common.model.EnumValue;
import com.llm.common.repository.EnumEntityRepository;
import com.llm.common.repository.EnumValueRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EnumEntityService {

    @Autowired
    private EnumEntityRepository enumEntityRepository;

    @Autowired
    private EnumValueRepository enumValueRepository;

    // Create or Update EnumEntity along with its EnumValues
    @Transactional
    public EnumEntity saveOrUpdateEnumEntity(EnumEntity enumEntity) {
        return enumEntityRepository.save(enumEntity);
    }

    // Get a single EnumEntity by key
    public Optional<EnumEntity> getEnumEntityByKey(String key) {
        return enumEntityRepository.findById(key);
    }

    // Get all EnumEntities
    public List<EnumEntity> getAllEnumEntities() {
        return enumEntityRepository.findAll();
    }

    // Delete an EnumEntity by key and all associated EnumValues
    public void deleteEnumEntity(String key) {
        Optional<EnumEntity> entity = enumEntityRepository.findById(key);
        entity.ifPresent(enumEntityRepository::delete);
    }

    // Delete an individual EnumValue by its ID
    public boolean deleteEnumValueById(Long valueId) {
        if (enumValueRepository.existsById(valueId)) {
            enumValueRepository.deleteById(valueId);
            return true;
        }
        return false;
    }
    public List<EnumValue> getDataByDependent(String dependent) {
        return enumValueRepository.findByDependent(dependent);
    }


    public String getEnumValueDescriptionByKeyAndValueId(String key, String valueId) {
        Optional<EnumEntity> enumEntityOptional = enumEntityRepository.findById(key);
        if (enumEntityOptional.isPresent()) {
            EnumEntity enumEntity = enumEntityOptional.get();
            return enumEntity.getValues().stream()
                    .filter(enumValue -> enumValue.getValueId().equals(valueId))
                    .map(EnumValue::getDescription) 
                    .findFirst()
                    .orElse(null); 
        }
        return null; 
    }



    // Update EnumValue by key and valueId
    @Transactional
    public Optional<EnumValue> updateEnumValueByKeyAndValueId(String key, String valueId, EnumValue updatedEnumValue) {
        Optional<EnumEntity> enumEntityOptional = enumEntityRepository.findById(key);
        if (enumEntityOptional.isPresent()) {
            EnumEntity enumEntity = enumEntityOptional.get();
            // Find the EnumValue by valueId (String)
            Optional<EnumValue> enumValueOptional = enumEntity.getValues().stream()
                    .filter(enumValue -> enumValue.getValueId().equals(valueId)) // Match by String valueId
                    .findFirst();

            if (enumValueOptional.isPresent()) {
                EnumValue enumValue = enumValueOptional.get();
                // Update the EnumValue fields
                enumValue.setValueId(updatedEnumValue.getValueId());
                enumValue.setDescription(updatedEnumValue.getDescription());
                enumValue.setDependent(updatedEnumValue.getDependent());

                // Save the updated EnumEntity back to the database
                enumEntityRepository.save(enumEntity); // Persist changes to the EnumEntity and EnumValues
                return Optional.of(enumValue); // Return updated EnumValue
            }
        }
        return Optional.empty(); // Return empty if no EnumEntity or EnumValue is found
    }

    public String getEnumValueDescriptionByKeyAndFilters(String key, String dependent, String valueId) {
        // Retrieve the EnumEntity by its key
        Optional<EnumEntity> enumEntityOptional = enumEntityRepository.findById(key);

        if (enumEntityOptional.isPresent()) {
            EnumEntity enumEntity = enumEntityOptional.get();

            // Check if dependent is null or empty and handle accordingly
            if (dependent == null || dependent.trim().isEmpty()) {
                throw new IllegalArgumentException("Dependent value cannot be null or empty");
            }

            // Check if valueId is null or empty and handle accordingly
            if (valueId == null || valueId.trim().isEmpty()) {
                throw new IllegalArgumentException("ValueId cannot be null or empty");
            }

            // Search for the EnumValue that matches both dependent and valueId
            return enumEntity.getValues().stream()
                    .filter(enumValue -> dependent.equals(enumValue.getDependent()) && valueId.equals(enumValue.getValueId())) // Filter based on dependent and valueId
                    .map(EnumValue::getDescription) // Map to the description
                    .findFirst() // Return the first match
                    .orElse(null); // Return null if not found
        }

        // Return null if EnumEntity is not found
        return null;
    }

}
