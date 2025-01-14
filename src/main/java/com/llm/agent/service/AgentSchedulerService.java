package com.llm.agent.service;

import com.llm.agent.model.Agent;
import com.llm.agent.repository.AgentRepositories;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.scheduling.annotation.Scheduled;
import java.util.List;

@Service
public class AgentSchedulerService {

    private final AgentRepositories agentRepository;

    public AgentSchedulerService(AgentRepositories agentRepository) {
        this.agentRepository = agentRepository;
    }

    /**
     * Reset remainingPerDayLimit at the start of each day.
     */
    @Scheduled(cron = "0 0 0 * * ?") // Runs daily at midnight
    @Transactional
    public void resetDailyLimit() {
        List<Agent> agents = agentRepository.findAll();
        agents.forEach(agent -> {
            agent.setRemainingPerDayLimit(agent.getPerDayLimit());
        });
        agentRepository.saveAll(agents);
    }

    /**
     * Reset remainingDailyLimit at the start of each day.
     */
    @Scheduled(cron = "0 0 0 * * ?") // Runs daily at midnight
    @Transactional
    public void resetDailyCreditLimit() {
        List<Agent> agents = agentRepository.findAll();
        agents.forEach(agent -> {
            agent.setRemainingDaily(agent.getDaily());
        });
        agentRepository.saveAll(agents);
    }

    /**
     * Reset remainingPerMonthLimit at the start of each month.
     */
    @Scheduled(cron = "0 0 0 1 * ?") // Runs at midnight on the first day of every month
    @Transactional
    public void resetMonthlyLimit() {
        List<Agent> agents = agentRepository.findAll();
        agents.forEach(agent -> {
            agent.setRemainingPerMonthLimit(agent.getPerMonthLimit());
        });
        agentRepository.saveAll(agents);
    }
}
