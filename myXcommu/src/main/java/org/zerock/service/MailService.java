package org.zerock.service;

public interface MailService {
	public boolean send();

	boolean send(String userId, String uuid, String targetEmail );
}
