package org.zerock.mapper;

import java.util.Map;

import org.zerock.domain.FileInfoDTO;

public interface UploadFileMapper {
	
	public void insertFileInformation( Map<String,Object> map );
	public FileInfoDTO findFileInformation( Map<String,Object> map );
	public int findFileInformationByUpdate( Map<String,Object> map );
	public void fileDeleteInformation( Map<String,Object> map );
	public void updateFileInformation( Map<String,Object> map );

}
