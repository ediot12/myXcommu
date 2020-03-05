package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService {
	

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter( onMethod_ = @Autowired )
	private BoardAttachMapper attachMapper;
	
	@Override
	@Transactional
	public void register( BoardVO board ) {
		
		log.info( "register.......... " + board );
		
		mapper.insertSelectKey( board );
		
		if( board.getAttachList() == null || board.getAttachList().size() <= 0 ) {
			return;
		}
		
		board.getAttachList().forEach( attach -> {
			
			attach.setBno( board.getBno() );
			attachMapper.insert( attach );
			
		});
		
	}

	@Override
	public BoardVO get(Long bno) {
		
		System.out.println("get.................." + bno );
		return mapper.read( bno );
		
	}

	@Override
	@Transactional
	public boolean modify(BoardVO board) {
		
		log.info("modify............" + board );
		
		attachMapper.deleteAll( board.getBno() );
		
		boolean modifyResult = mapper.update( board ) == 1;
		
		if( modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0 ) {
			
			board.getAttachList().forEach( attach -> {
			
				attach.setBno( board.getBno() );
				attachMapper.insert( attach );
				
			});
			
		}
		
		return modifyResult;
		
	}

	@Override
	@Transactional
	public boolean remove(Long bno) {
		
		log.info("remove.............." + bno );

		attachMapper.deleteAll( bno );
		return mapper.delete( bno ) == 1;
		
	}

	/*
	 * @Override public List<BoardVO> getList() {
	 * 
	 * System.out.println("getList ..............."); return mapper.getList();
	 * 
	 * }
	 */
	
	@Override
	public List<BoardVO> getList( Criteria cri ) {
		
		System.out.println("Get List with criteria : " + cri);
		return mapper.getListWithPaging( cri );
		
	}
	
	@Override
	public int getTotal( Criteria cri ) {
		
		return mapper.getTotalCount( cri );
		
	}
	
	@Override
	public List<BoardAttachVO> getAttachList( Long bno ){
		
		log.info("get Attach List by bno " + bno );
		
		return attachMapper.findByBno( bno );
		
	}
	
	
	
}

