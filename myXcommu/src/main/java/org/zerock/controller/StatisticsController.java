package org.zerock.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.MemberStatsDTO;
import org.zerock.domain.StatisticsDTO;
import org.zerock.mapper.AccountMapper;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class StatisticsController {
	
	@Autowired
	private AccountMapper accountMapper;
	
	@RequestMapping( value="/viewStatistics", method=RequestMethod.GET )
	public String viewPage( Model model ) {
		
		StatisticsDTO 				dto 			= accountMapper.getBoardUserReplyCnt();
		ArrayList<MemberStatsDTO>	memberStats 	= accountMapper.getAllMemberStats();
				
		model.addAttribute("stats", dto);
		model.addAttribute("memberStats", memberStats);
		
		return "etc/statisticsRank";
	}

}
