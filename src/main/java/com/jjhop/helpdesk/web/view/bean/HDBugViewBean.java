package com.jjhop.helpdesk.web.view.bean;

import java.util.Date;

import com.jjhop.helpdesk.model.BugCategory;
import com.jjhop.helpdesk.model.BugPriority;
import com.jjhop.helpdesk.model.BugStatus;

class _HDBugViewBean {
	private Long bugId;
	private String subject;
	private BugCategory category;
	private Date createDate;
	private BugStatus status;
	private BugPriority priority;
	
	private Long notifierId;
	private String notifier;
	
	private Long saviourId;
	private String saviour;
	
	private Long inputerId;
	private String inputer;
	
	
	/**
	 * @return Returns the bugId.
	 */
	public Long getBugId() {
		return bugId;
	}
	/**
	 * @param bugId The bugId to set.
	 */
	public void setBugId(Long bugId) {
		this.bugId = bugId;
	}
	/**
	 * @return Returns the category.
	 */
	public BugCategory getCategory() {
		return category;
	}
	/**
	 * @param category The category to set.
	 */
	public void setCategory(BugCategory category) {
		this.category = category;
	}
	/**
	 * @return Returns the createDate.
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * @param createDate The createDate to set.
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	/**
	 * @return Returns the notifier.
	 */
	public String getNotifier() {
		return notifier;
	}
	/**
	 * @param notifier The notifier to set.
	 */
	public void setNotifier(String notifier) {
		this.notifier = notifier;
	}
	/**
	 * @return Returns the notifierId.
	 */
	public Long getNotifierId() {
		return notifierId;
	}
	/**
	 * @param notifierId The notifierId to set.
	 */
	public void setNotifierId(Long notifierId) {
		this.notifierId = notifierId;
	}
	/**
	 * @return Returns the priority.
	 */
	public BugPriority getPriority() {
		return priority;
	}
	/**
	 * @param priority The priority to set.
	 */
	public void setPriority(BugPriority priority) {
		this.priority = priority;
	}
	/**
	 * @return Returns the status.
	 */
	public BugStatus getStatus() {
		return status;
	}
	/**
	 * @param status The status to set.
	 */
	public void setStatus(BugStatus status) {
		this.status = status;
	}
	/**
	 * @return Returns the subject.
	 */
	public String getSubject() {
		return subject;
	}
	/**
	 * @param subject The subject to set.
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}
	/**
	 * @return Returns the inputer.
	 */
	public String getInputer() {
		return inputer;
	}
	/**
	 * @param inputer The inputer to set.
	 */
	public void setInputer(String inputer) {
		this.inputer = inputer;
	}
	/**
	 * @return Returns the inputerId.
	 */
	public Long getInputerId() {
		return inputerId;
	}
	/**
	 * @param inputerId The inputerId to set.
	 */
	public void setInputerId(Long inputerId) {
		this.inputerId = inputerId;
	}
	/**
	 * @return Returns the saviour.
	 */
	public String getSaviour() {
		return saviour;
	}
	/**
	 * @param saviour The saviour to set.
	 */
	public void setSaviour(String saviour) {
		this.saviour = saviour;
	}
	/**
	 * @return Returns the saviourId.
	 */
	public Long getSaviourId() {
		return saviourId;
	}
	/**
	 * @param saviourId The saviourId to set.
	 */
	public void setSaviourId(Long saviourId) {
		this.saviourId = saviourId;
	}
	
}
