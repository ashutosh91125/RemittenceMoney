package com.llm.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name = "TimeZone")
public class AppTimeZone {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer timeZoneId;

    @Column(nullable = false)
    private String zone;
    private Double differBy;
    private String zoneType;
    private Integer zoneCode;
    @ManyToOne
    @JoinColumn(name = "agent_id")
    private Agent agents;

}
