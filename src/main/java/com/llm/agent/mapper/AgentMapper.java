package com.llm.agent.mapper;
import com.llm.agent.model.Agent;
import com.llm.agent.model.dto.AgentDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface AgentMapper {

    AgentMapper INSTANCE = Mappers.getMapper(AgentMapper.class);
    Agent toAgent(AgentDTO agentDTO);

}
