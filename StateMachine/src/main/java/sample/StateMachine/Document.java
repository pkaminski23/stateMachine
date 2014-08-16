package sample.StateMachine;

import java.util.Date;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Document {
	private int stateId;
	private String stateName;
	private String stateContent;
	private String stateReason;
	private Date createdAt;
	private Date verifiedAt;
	private Date acceptedAt;
	private Date rejectedAt;

	@Id
	@GeneratedValue
	public int getStateId() {
		return stateId;
	}
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String schoolName) {
		this.stateName = schoolName;
	}
	public String getStateContent() {
		return stateContent;
	}
	public void setStateContent(String stateContent) {
		this.stateContent = stateContent;
	}
	public String getStateReason() {
		return stateReason;
	}
	public void setStateReason(String stateReason) {
		this.stateReason = stateReason;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getVerifiedAt() {
		return verifiedAt;
	}
	public void setVerifiedAt(Date verifiedAt) {
		this.verifiedAt = verifiedAt;
	}
	public Date getAcceptedAt() {
		return acceptedAt;
	}
	public void setAcceptedAt(Date acceptedAt) {
		this.acceptedAt = acceptedAt;
	}
	public Date getRejectedAt() {
		return rejectedAt;
	}
	public void setRejectedAt(Date rejectedAt) {
		this.rejectedAt = rejectedAt;
	}
}
