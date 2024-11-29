package com.llm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.llm.Service.IAgentService;
import com.llm.Service.IAppTimeZoneService;
import com.llm.Service.ICountryService;
import com.llm.Service.ICurrencyService;
import com.llm.Service.ISetteleMentModeService;
import com.llm.Service.ISettleMentTypeService;
import com.llm.Service.IWorkingHoursService;
import com.llm.dto.AgentDto;
import com.llm.model.Agent;
import com.llm.model.AppTimeZone;
import com.llm.model.Country;
import com.llm.model.Currency;
import com.llm.model.SettelementType;
import com.llm.model.SettlementMode;
import com.llm.model.WorkingHours;

@Controller
@SessionAttributes({ "formData", "agentDTO" })
public class AgentController {
	private static final Logger logger = LoggerFactory.getLogger(AgentController.class);

	@Autowired
	private IAgentService agentService;

	@Autowired
	private ICountryService countryService;
	@Autowired
	private ICurrencyService currencyService;

	@Autowired
	private IAppTimeZoneService timezoneService;

	@Autowired
	private IWorkingHoursService workingHoursService;
	@Autowired
	private ISetteleMentModeService setteleMentModeService;
	@Autowired
	private ISettleMentTypeService settleMentTypeService;

	@GetMapping("/agent")
	public String showCompanyDetailsForm(Model model) {
		logger.info("Displaying company details form");
		model.addAttribute("agentDTO", new AgentDto());
		model.addAttribute("countrieslist", countryService.fetchCountries());
		model.addAttribute("listCurrencies", currencyService.fetchCurrencies());
		model.addAttribute("timezonelist", timezoneService.getAllTimeZones());
		return "companydetails";
	}

	@PostMapping("/agent")
	public String processCompanyDetails(@ModelAttribute("agentDTO") AgentDto agentDTO, Model model) {
		logger.info("Processing company details: {}", agentDTO);
		try {

			Map<String, Object> formData = (Map<String, Object>) model.asMap().get("formData");
			if (formData == null) {
				formData = new HashMap<>();
				model.addAttribute("formData", formData);
			}

			if (agentDTO.getCurrencies() != null && !agentDTO.getCurrencies().isEmpty()) {
				List<Currency> validatedCurrencies = new ArrayList<>();
				for (Currency currency : agentDTO.getCurrencies()) {
					Currency foundCurrency = currencyService.getCurrecyById(currency.getCurrencyId());
					if (foundCurrency != null) {
						validatedCurrencies.add(foundCurrency);
					} else {
						logger.warn("Currency not found: {}", currency.getCurrencyId());
					}
				}

				agentDTO.setCurrencies(validatedCurrencies);
				formData.put("currencies", validatedCurrencies);
			}

			if (agentDTO.getCountries() != null && !agentDTO.getCountries().isEmpty()) {
				List<Country> validatedCountries = new ArrayList<>();
				for (Country country : agentDTO.getCountries()) {
					Country foundCountry = countryService.findByCountryId(country.getCountryId());
					if (foundCountry != null) {
						validatedCountries.add(foundCountry);
					} else {
						logger.warn("Currencies not found: {}", country.getCountryId());
					}
				}

				agentDTO.setCountries(validatedCountries);
				formData.put("countries", validatedCountries);
			}

			if (agentDTO.getTimeZone() != null && !agentDTO.getTimeZone().isEmpty()) {
				List<AppTimeZone> validatedTimezone = new ArrayList<>();
				for (AppTimeZone timezone : agentDTO.getTimeZone()) {
					AppTimeZone foundCountry = timezoneService.findByZoneID(timezone.getTimeZoneId());
					if (foundCountry != null) {
						validatedTimezone.add(timezone);
					} else {
						logger.warn("Timezone not found: {}", timezone.getTimeZoneId());
					}
				}

				agentDTO.setTimeZone(validatedTimezone);
				formData.put("timeZone", validatedTimezone);
			}

			formData.put("companyId", agentDTO.getCompanyId());
			formData.put("companyName", agentDTO.getCompanyName());
			formData.put("companyDisplayName", agentDTO.getCompanyDisplayName());
			formData.put("address1", agentDTO.getAddress1());
			formData.put("address2", agentDTO.getAddress2());
			formData.put("address3", agentDTO.getAddress3());
			formData.put("city", agentDTO.getCity());
			formData.put("state", agentDTO.getState());
			formData.put("zip", agentDTO.getZip());

			return "redirect:/contactdetails";
		} catch (Exception e) {
			logger.error("Error processing company details: ", e);
			return "error";
		}
	}

	@GetMapping("/contactdetails")
	public String showContactDetailsForm(Model model) {
		logger.info("Displaying contact details form");
		model.addAttribute("agentDTO", new AgentDto());
		return "contactdetails";
	}

	@PostMapping("/contactdetails")
	public String processContactDetails(@ModelAttribute("agentDTO") AgentDto agentDTO, Model model) {
		logger.info("Processing contact details: {}", agentDTO);
		try {
			Map<String, Object> formData = (Map<String, Object>) model.asMap().get("formData");
			formData.put("email", agentDTO.getEmail());
			formData.put("mobile", agentDTO.getMobile());
			formData.put("phone", agentDTO.getPhone());
			formData.put("contactPerson", agentDTO.getContactPerson());
			formData.put("misEmailId", agentDTO.getMisEmailId());

			return "redirect:/regularitydetails";
		} catch (Exception e) {
			logger.error("Error processing contact details: ", e);
			return "error";
		}
	}

	@GetMapping("/regularitydetails")
	public String showRegularityDetailsForm(Model model) {
		logger.info("Displaying regularity details form");
		model.addAttribute("agentDTO", new AgentDto());
		model.addAttribute("workinghourslist", workingHoursService.getAllWorkingHours());
		return "regularitydetails";
	}

	@PostMapping("/regularitydetails")
	public String processRegularityDetails(@ModelAttribute("agentDTO") AgentDto agentDTO, Model model) {
		logger.info("Processing regularity details: {}", agentDTO);
		try {
			Map<String, Object> formData = (Map<String, Object>) model.asMap().get("formData");
			formData.put("taxIdentificationNumber", agentDTO.getTaxIdentificationNumber());
			formData.put("licenceNo", agentDTO.getLicenceNo());
			boolean taxApplicable = agentDTO.getTaxApplicable();
			formData.put("taxApplicable", taxApplicable);
			formData.put("working", agentDTO.getWorking());

			if (agentDTO.getWorking() != null && !agentDTO.getWorking().isEmpty()) {
				List<WorkingHours> validWorkingHours = new ArrayList<>();
				for (WorkingHours hours : agentDTO.getWorking()) {
					WorkingHours foundHours = workingHoursService.findByWorkingHoursId(hours.getId());
					if (foundHours != null) {
						validWorkingHours.add(foundHours);
					} else {
						logger.warn("Working hours not found: {}", hours.getId());
					}
				}

				agentDTO.setWorking(validWorkingHours);
				formData.put("working", validWorkingHours);
			}

			return "redirect:/creditdetails";
		} catch (Exception e) {
			logger.error("Error processing regularity details: ", e);
			return "error";
		}
	}

	@GetMapping("/creditdetails")
	public String showCreditDetailsForm(Model model) {
		logger.info("Displaying credit details form");
		model.addAttribute("agentDTO", new AgentDto());
		model.addAttribute("setteleMentModeList", setteleMentModeService.fetchSettlementMode());
		model.addAttribute("setteleMentTypeList", settleMentTypeService.fetchAllSettleMentsType());
		return "creditlimit";
	}

	@PostMapping("/creditdetails")
	public String processCreditDetails(@ModelAttribute("agentDTO") AgentDto agentDTO, Model model) {
		logger.info("Processing credit details: {}", agentDTO);
		try {
			Map<String, Object> formData = (Map<String, Object>) model.asMap().get("formData");
			formData.put("daily", agentDTO.getDaily());
			formData.put("settlementMode", agentDTO.getSettlementMode());
			formData.put("settlementType", agentDTO.getSettlementType());
			boolean status = agentDTO.getStatus();
			formData.put("status", status);

			if (agentDTO.getSettlementMode() != null && !agentDTO.getSettlementMode().isEmpty()) {
				List<SettlementMode> settlementMode = new ArrayList<>();
				for (SettlementMode settelments : agentDTO.getSettlementMode()) {
					SettlementMode foundHours = setteleMentModeService
							.findBysettelementIdId(settelments.getSettelementId());
					if (foundHours != null) {
						settlementMode.add(foundHours);
					} else {
						logger.warn("SettlementMode not found: {}", settelments.getSettelementId());
					}
				}

				agentDTO.setSettlementMode(settlementMode);
				formData.put("settlementMode", settlementMode);
			}
			if (agentDTO.getSettlementType() != null && !agentDTO.getSettlementType().isEmpty()) {
				List<SettelementType> settlementType = new ArrayList<>();
				for (SettelementType settelments1 : agentDTO.getSettlementType()) {
					SettelementType foundSetteleMentType = settleMentTypeService
							.findBySettleMentsId(settelments1.getSettelementId());
					if (foundSetteleMentType != null) {
						settlementType.add(foundSetteleMentType); // Use foundHours to add to the list
					} else {
						logger.warn("Settlement Type not found: {}", settelments1.getSettelementId());
					}
				}

				agentDTO.setSettlementType(settlementType);
				formData.put("settlementType", settlementType);
			}
			return "redirect:/customertransaction";
		} catch (Exception e) {
			logger.error("Error processing credit details: ", e);
			return "error";
		}
	}

	@GetMapping("/customertransaction")
	public String customerTransactionDetailsForm(Model model) {
		logger.info("Displaying customer transaction details form");
		model.addAttribute("agentDTO", new AgentDto());
		return "customertansaction";
	}

	@PostMapping("/customertransaction")
	public String customerTransactionDetails(@ModelAttribute("agentDTO") AgentDto agentDTO, Model model) {
		logger.info("Processing customer transaction details: {}", agentDTO);
		try {
			Map<String, Object> formData = (Map<String, Object>) model.asMap().get("formData");
			formData.put("perTransactionLimit", agentDTO.getPerTransactionLimit());
			formData.put("perDayLimit", agentDTO.getPerDayLimit());
			formData.put("perMonthLimit", agentDTO.getPerMonthLimit());
			return "redirect:/apidetails";
		} catch (Exception e) {
			logger.error("Error processing customer transaction details: ", e);
			return "error";
		}
	}

	@GetMapping("/apidetails")
	public String apiDetailsForm(Model model) {
		logger.info("Displaying API details form");
		model.addAttribute("agentDTO", new AgentDto());
		return "apidetails";
	}

	@PostMapping("/apidetails")
	public String apiDetails(@ModelAttribute("agentDTO") AgentDto agentDTO, Model model) {
		logger.info("Processing API details: {}", agentDTO);
		try {
			Map<String, Object> formData = (Map<String, Object>) model.asMap().get("formData");
			formData.put("grantType", agentDTO.getGrantType());
			formData.put("scope", agentDTO.getScope());
			formData.put("clientId", agentDTO.getClientId());
			formData.put("clientSecret", agentDTO.getClientSecret());
			formData.put("adminPassword", agentDTO.getAdminPassword());
			formData.put("adminUserName", agentDTO.getAdminUserName());

			return "redirect:/auditdetails";
		} catch (Exception e) {
			logger.error("Error processing API details: ", e);
			return "error";
		}
	}

	@GetMapping("/auditdetails")
	public String showAuditDetailsForm(Model model) {
		logger.info("Displaying audit details form");
		model.addAttribute("agentDTO", new AgentDto());
		return "auditdetails";
	}

	@PostMapping("/auditdetails")
	public String processAuditDetails(@ModelAttribute("agentDTO") AgentDto agentDTO, Model model) {
		logger.info("Processing audit details: {}", agentDTO);
		try {
			Map<String, Object> formData = (Map<String, Object>) model.asMap().get("formData");
			formData.put("remarks", agentDTO.getRemarks());
			// Create a single Agent object with all collected data
			Agent agent = new Agent();
			agent.setCompanyId(parseLong(formData.get("companyId")));
			agent.setCompanyName((String) formData.get("companyName"));
			agent.setCompanyDisplayName((String) formData.get("companyDisplayName"));
			agent.setAddress1((String) formData.get("address1"));
			agent.setAddress2((String) formData.get("address2"));
			agent.setAddress3((String) formData.get("address3"));
			agent.setCity((String) formData.get("city"));
			agent.setState((String) formData.get("state"));
			agent.setZip((String) formData.get("zip"));
			agent.setEmail((String) formData.get("email"));
			agent.setPhone(getLongValue(formData.get("phone")));
			agent.setMobile(getLongValue(formData.get("mobile")));
			agent.setContactPerson((String) formData.get("contactPerson"));
			agent.setMisEmailId((String) formData.get("misEmailId"));
			agent.setTaxIdentificationNumber((String) formData.get("taxIdentificationNumber"));
			agent.setLicenceNo((String) formData.get("licenceNo"));
			agent.setDaily(getLongValue(formData.get("daily")));
			agent.setPerTransactionLimit(getLongValue(formData.get("perTransactionLimit")));
			agent.setPerDayLimit(getLongValue(formData.get("perDayLimit")));
			agent.setPerMonthLimit(getLongValue(formData.get("perMonthLimit")));
			agent.setRemarks((String) formData.get("remarks"));
			agent.setGrantType((String) formData.get("grantType"));
			agent.setScope((String) formData.get("scope"));
			agent.setClientId((String) formData.get("clientId"));
			agent.setClientSecret((String) formData.get("clientSecret"));
			agent.setAdminUserName((String) formData.get("adminUserName"));
			agent.setAdminPassword((String) formData.get("adminPassword"));
			agent.setRemarks((String) formData.get("remarks"));
			agent.setDaily(getLongValue(formData.get("daily")));
			boolean tax = (boolean) formData.get("taxApplicable");
			agent.setTaxApplicable(tax);
			agent.setStatusFlag(agentDTO.getStatusFlag());
			boolean status = (boolean) formData.get("status");
			agent.setStatus(status);

			List<AppTimeZone> timezones = (List<AppTimeZone>) formData.get("timeZone");
			if (timezones != null && !timezones.isEmpty()) {
				List<AppTimeZone> managedTimeZones = new ArrayList<>();
				for (AppTimeZone timezone : timezones) {
					AppTimeZone managedTimezone = timezoneService.findByZoneID(timezone.getTimeZoneId());
					if (managedTimezone != null) {
						managedTimezone.setAgents(agent);
						managedTimeZones.add(managedTimezone);
					} else {
						logger.warn("Timezone not found: {}", timezone.getTimeZoneId());
					}
				}
				agent.setTimeZone(managedTimeZones);
			}
			// Handle Currencies
			List<Currency> currencies = (List<Currency>) formData.get("currencies");
			if (currencies != null && !currencies.isEmpty()) {
				List<Currency> managedCurrencies = new ArrayList<>();
				for (Currency currency : currencies) {
					Currency managedCurrency = currencyService.getCurrecyById(currency.getCurrencyId());
					if (managedCurrency != null) {
						managedCurrency.setAgents(agent);
						managedCurrencies.add(managedCurrency);
					} else {
						logger.warn("Currency not found: {}", currency.getCurrencyId());
					}
				}
				agent.setCurrencies(managedCurrencies);
			}

			// Handle Countries
			List<Country> countries = (List<Country>) formData.get("countries");
			if (countries != null && !countries.isEmpty()) {
				List<Country> managedCountries = new ArrayList<>();
				for (Country country : countries) {
					Country managedCountry = countryService.findByCountryId(country.getCountryId());
					if (managedCountry != null) {
						managedCountry.setAgents(agent);
						managedCountries.add(managedCountry);
					} else {
						logger.warn("Country not found: {}", country.getCountryId());
					}
				}
				agent.setCountries(managedCountries);
			}

			List<WorkingHours> workingHours = (List<WorkingHours>) formData.get("working");
			if (workingHours != null && !workingHours.isEmpty()) {
				List<WorkingHours> managedWorkingHours = new ArrayList<>();
				for (WorkingHours hours : workingHours) {
					WorkingHours managedHours = workingHoursService.findByWorkingHoursId(hours.getId());
					if (managedHours != null) {
						managedHours.setAgents(agent);
						managedWorkingHours.add(managedHours);
					} else {
						logger.warn("Working hours not found: {}", hours.getId());
					}
				}
				agent.setWorking(managedWorkingHours);
			}
			List<SettlementMode> settleemnt = (List<SettlementMode>) formData.get("settlementMode");
			if (settleemnt != null && !settleemnt.isEmpty()) {
				List<SettlementMode> managedMods = new ArrayList<>();
				for (SettlementMode setlle : settleemnt) {
					SettlementMode managedSettlement = setteleMentModeService
							.findBysettelementIdId(setlle.getSettelementId());
					if (managedSettlement != null) {
						managedSettlement.setAgents(agent);
						managedMods.add(managedSettlement);
					} else {
						logger.warn("Settelement hours not found: {}", setlle.getSettelementId());
					}
				}
				agent.setSettlementMode(managedMods);
			}
			List<SettelementType> settlementTypes = (List<SettelementType>) formData.get("settlementType");
			if (settlementTypes != null && !settlementTypes.isEmpty()) {
				List<SettelementType> managedTypes = new ArrayList<>();
				for (SettelementType settlement : settlementTypes) {
					SettelementType managedSettlement = settleMentTypeService
							.findBySettleMentsId(settlement.getSettelementId());
					if (managedSettlement != null) {
						managedSettlement.setAgents(agent);
						managedTypes.add(managedSettlement);
					} else {
						logger.warn("Settlement type not found: {}", settlement.getSettelementId());
					}
				}
				agent.setSettlementType(settlementTypes);
			}

			agentService.addAgent(agent);
			formData.clear();

			return "agentlist";
		} catch (Exception e) {
			logger.error("Error processing audit details: ", e);
			return "error";
		}
	}

	@GetMapping("/agentlist")
	public String getAdminList(Model model) {
		List<Agent> agentList = agentService.findAllAgent();
		model.addAttribute("agentList", agentList);
		return "agentlist";

	}

	@GetMapping("/agentlogin")
	public String showLoginForm(Model model) {
		model.addAttribute("agentDTO", new AgentDto());
		return "agentlogin";
	}

	@PostMapping("/agentlogin")
	public String loginAgent(@ModelAttribute("agentDTO") AgentDto agentDto, Model model) {
		Agent agent = agentService.getByEmail(agentDto.getEmail());

		if (agent != null && agent.getAdminPassword().equals(agentDto.getAdminPassword())) {
			return "redirect:/agentlist";
		} else {
			model.addAttribute("error", "Invalid email or password");
			return "agentlogin";
		}
	}

	private Long getLongValue(Object value) {
		if (value instanceof Long) {
			return (Long) value;
		} else if (value instanceof String) {
			String strValue = (String) value;
			if (strValue != null && !strValue.isEmpty()) {
				try {
					return Long.parseLong(strValue);
				} catch (NumberFormatException e) {
					logger.error("Invalid number format for value: {}", strValue);
				}
			}
		}
		return null;
	}

	private Long parseLong(Object value) {
		if (value instanceof Long) {
			return (Long) value;
		} else if (value instanceof String) {
			String strValue = (String) value;
			if (strValue != null && !strValue.isEmpty()) {
				try {
					return Long.parseLong(strValue);
				} catch (NumberFormatException e) {
					logger.error("Invalid number format for value: {}", strValue);
				}
			}
		}
		return null;
	}

}
