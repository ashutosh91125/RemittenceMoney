package com.llm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.llm.Service.IAgentService;
import com.llm.Service.IAgentTypeService;
import com.llm.Service.ISubAgentService;
import com.llm.Service.IWorkingHoursService;
import com.llm.dto.SubAgentDto;
import com.llm.model.Agent;
import com.llm.model.AgentType;
import com.llm.model.SubAgent;
import com.llm.model.WorkingHours;

@Controller
@SessionAttributes("subAgent")
public class SubAgentcontroller {
	@Autowired
	private IWorkingHoursService workingHoursService;
	@Autowired
	private ISubAgentService subAgentService;
	@Autowired
	private IAgentService agentService;
	@Autowired
	private IAgentTypeService agentTypeService;

	@ModelAttribute("subAgent")
	public SubAgent initializeSubAgent() {
		return new SubAgent();
	}

	@GetMapping("/subgent")
	public String showCompanyDetailsForm(Model model) {
		model.addAttribute("subAgentDTO", new SubAgentDto());
		List<Agent> agentList = agentService.findAllAgent();
		List<WorkingHours> workinghourslist = workingHoursService.getAllWorkingHours();
		model.addAttribute("agentList", agentList);
		model.addAttribute("workinghourslist", workinghourslist);
		model.addAttribute("step", 1);
		return "registersubagent";
	}

	@PostMapping("/subgent")
	public String processSubAgentForm(@ModelAttribute("subAgentDTO") SubAgentDto subAgentDto,
			@RequestParam("step") int step, @ModelAttribute("subAgent") SubAgent subagent, Model model) {
		try {
			List<WorkingHours> workinghourslist = workingHoursService.getAllWorkingHours();
			model.addAttribute("workinghourslist", workinghourslist);

			if (step == 1) {
				handleStep1(subAgentDto, subagent);

				model.addAttribute("step", 2);
				model.addAttribute("subAgentDTO", subAgentDto);
				return "contactdetailssubagent";

			} else if (step == 2) {
				model.addAttribute("step", 3);
				model.addAttribute("subAgentDTO", subAgentDto);
				return "regurilitysubagent";
			} else if (step == 3) {
				handleStep3(subAgentDto, subagent);

				model.addAttribute("step", 4);
				model.addAttribute("subAgentDTO", subAgentDto);
				return "auditsubagent";
			} else if (step == 4) {
				handleStep4(subAgentDto, subagent);
				subAgentService.addSubAgent(subagent);
				return "success";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("subAgentDTO", subAgentDto);
		model.addAttribute("step", step);
		return "registersubagent";

	}

	private void handleStep1(SubAgentDto subAgentDto, SubAgent subagent) {

		if (subAgentDto.getAgent() != null && !subAgentDto.getAgent().isEmpty()) {
			List<Agent> validateAgent = new ArrayList<>();
			for (Agent agent : subAgentDto.getAgent()) {
				Agent agentFound = agentService.getAgentByCompanyId(agent.getCompanyId());
				if (agentFound != null) {
					validateAgent.add(agentFound);
				}
			}
			subagent.setAgent(validateAgent);
		}

		if (subAgentDto.getAgentTypes() != null && !subAgentDto.getAgentTypes().isEmpty()) {
			List<AgentType> validateAgentType = new ArrayList<>();
			for (AgentType agentType : subAgentDto.getAgentTypes()) {
				AgentType foundAgentType = agentTypeService.getByAgentTypeId(agentType.getAgentTypeId());
				if (foundAgentType != null) {
					validateAgentType.add(foundAgentType);
				}
			}
			subagent.setAgentTypes(validateAgentType);
		}

		if (subAgentDto.getWorking() != null && !subAgentDto.getWorking().isEmpty()) {
			List<WorkingHours> validWorkingHours = new ArrayList<>();
			for (WorkingHours hours : subAgentDto.getWorking()) {
				WorkingHours foundHours = workingHoursService.findByWorkingHoursId(hours.getId());
				if (foundHours != null) {
					validWorkingHours.add(foundHours);
				}
			}
			subagent.setWorking(validWorkingHours);
		}

		subagent.setAgentChannelId(subAgentDto.getAgentChannelId());
		subagent.setAddress1(subAgentDto.getAddress1());
		subagent.setAddress2(subAgentDto.getAddress2());
		subagent.setAddress3(subAgentDto.getAddress3());
		subagent.setCity(subAgentDto.getCity());
		subagent.setZip(subAgentDto.getZip());
		subagent.setState(subAgentDto.getState());
	}

	private void handleStep2(SubAgentDto subAgentDto, SubAgent subagent) {

		subagent.setEmail(subAgentDto.getEmail());
		subagent.setPhone(subAgentDto.getPhone());
		subagent.setMisEmailId(subAgentDto.getMisEmailId());
		subagent.setMobile(subAgentDto.getMobile());
		subagent.setContactPerson(subAgentDto.getContactPerson());
	}

	private void handleStep3(SubAgentDto subAgentDto, SubAgent subagent) {

		subagent.setAgentLocationId(subAgentDto.getAgentLocationId());
		subagent.setLicenceNo(subAgentDto.getLicenceNo());
		subagent.setOutlateCode(subAgentDto.getOutlateCode());
		if (subAgentDto.getWorking() != null && !subAgentDto.getWorking().isEmpty()) {
			List<WorkingHours> validWorkingHours = new ArrayList<>();
			for (WorkingHours hours : subAgentDto.getWorking()) {
				WorkingHours foundHours = workingHoursService.findByWorkingHoursId(hours.getId());
				if (foundHours != null) {
					validWorkingHours.add(foundHours);
				}
			}
			subagent.setWorking(validWorkingHours);
		}
	}

	private void handleStep4(SubAgentDto subAgentDto, SubAgent subagent) {

		subagent.setRemarks(subAgentDto.getRemarks());
		subagent.setStatusFlag(subAgentDto.getStatusFlag());
	}

	@GetMapping("/subagentlist")
	public String getSubAgentList(Model model) {
		List<SubAgent> subAgentList = subAgentService.findAllAgent();
		model.addAttribute("subAgentList", subAgentList);
		return "subagentlist";
	}

	@GetMapping("/subagentlogin")
	public String login(Model model) {
		model.addAttribute("subAgentDTO", new SubAgentDto());
		return "subagentlogin";

	}

	@PostMapping("/subagentlogin")
	public String login(@ModelAttribute("subAgentDTO") SubAgentDto subAgentDto, @RequestParam("email") String email,
			@RequestParam("password") String password, Model model) {

		SubAgent subagent = subAgentService.getByEmail(email);
		if (subagent != null && subagent.getPassword().equals(password)) {

			model.addAttribute("subagent", subagent);
			return "subagentlist";
		} else {

			model.addAttribute("error", "Invalid user email or password.");
			return "subagentlogin";
		}
	}

}
