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

    // Get EnumEntity by key and find specific EnumValue by valueId
    public Optional<EnumValue> getEnumValueByKeyAndValueId(String key, Long valueId) {
        Optional<EnumEntity> enumEntityOptional = enumEntityRepository.findById(key);
        if (enumEntityOptional.isPresent()) {
            EnumEntity enumEntity = enumEntityOptional.get();
            // Search for the EnumValue with the provided valueId
            return enumEntity.getValues().stream()
                    .filter(enumValue -> enumValue.getId().equals(valueId))
                    .findFirst();
        }
        return Optional.empty();
    }
}
