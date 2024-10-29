package com.llm.Service;

import org.springframework.stereotype.Service;

import com.llm.model.Proffession;
import com.llm.repositories.ProffessionRepository;

@Service
public class ProffessionServiceImpl {

	private ProffessionRepository proffessionRepository;

	public Proffession addProffession(Proffession proffession) {
		return proffessionRepository.save(proffession);
	}

}
