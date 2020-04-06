package org.zerock.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.zerock.domain.ProposalBoardDTO;

public interface ProposalMapper {
	public void registerProposalBoard( ProposalBoardDTO dto );
	public ArrayList<ProposalBoardDTO> getAllProposalBoard();
	public ProposalBoardDTO getProposalBoard( int seq );
	public int updateProposalBoard( Map<String,Object> map );
	public int currSequenceVal();
}
