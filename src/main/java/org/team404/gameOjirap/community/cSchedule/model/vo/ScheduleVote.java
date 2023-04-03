package org.team404.gameOjirap.community.cSchedule.model.vo;

import java.sql.Date;

public class ScheduleVote {
	private int schId;
	private String user_id; 
	private String schName;
	private String schDes;
	private Date schStart;
	private Date schEnd;
	private String votePart;
	public ScheduleVote() {
		super();
	}
	public ScheduleVote(int schId, String user_id, String schName, String schDes, Date schStart, Date schEnd,
			String votePart) {
		super();
		this.schId = schId;
		this.user_id = user_id;
		this.schName = schName;
		this.schDes = schDes;
		this.schStart = schStart;
		this.schEnd = schEnd;
		this.votePart = votePart;
	}
	public int getSchId() {
		return schId;
	}
	public void setSchId(int schId) {
		this.schId = schId;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSchName() {
		return schName;
	}
	public void setSchName(String schName) {
		this.schName = schName;
	}
	public String getSchDes() {
		return schDes;
	}
	public void setSchDes(String schDes) {
		this.schDes = schDes;
	}
	public Date getSchStart() {
		return schStart;
	}
	public void setSchStart(Date schStart) {
		this.schStart = schStart;
	}
	public Date getSchEnd() {
		return schEnd;
	}
	public void setSchEnd(Date schEnd) {
		this.schEnd = schEnd;
	}
	public String getVotePart() {
		return votePart;
	}
	public void setVotePart(String votePart) {
		this.votePart = votePart;
	}
	@Override
	public String toString() {
		return "ScheduleVote [schId=" + schId + ", user_id=" + user_id + ", schName=" + schName + ", schDes=" + schDes
				+ ", schStart=" + schStart + ", schEnd=" + schEnd + ", votePart=" + votePart + "]";
	}
	
	
}
