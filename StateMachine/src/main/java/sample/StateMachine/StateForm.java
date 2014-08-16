package sample.StateMachine;

import java.util.Date;

public class StateForm {
	private int id;
	private String name;
	private String content;
	private String reason;
	private Date created;
	private Date verified;
	private Date accepted;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getVerified() {
		return verified;
	}
	public void setVerified(Date verified) {
		this.verified = verified;
	}
	public Date getAccepted() {
		return accepted;
	}
	public void setAccepted(Date accepted) {
		this.accepted = accepted;
	}
}
