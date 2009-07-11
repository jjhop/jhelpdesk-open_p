package com.jjhop.helpdesk.dao.impl.jdbc;

import java.util.LinkedList;
import java.util.List;

import com.jjhop.helpdesk.dao.BugPriorityDAO;
import com.jjhop.helpdesk.model.BugPriority;

public class BugPriorityDAOJdbc implements BugPriorityDAO {

	public List<BugPriority> getAllPriorities() {
		final List<BugPriority> toReturn = new LinkedList<BugPriority>();
		toReturn.add( BugPriority.NORMAL );
		toReturn.add( BugPriority.WAZNY );
		toReturn.add( BugPriority.BARDZO_WAZNY );
		toReturn.add( BugPriority.CRITICAL );
		return toReturn;
	}

	public BugPriority getById( Long bugCategoryId ) {
		return getById( bugCategoryId.intValue() );
	}

	public BugPriority getById( int id ) {
		return BugPriority.fromInt( id );
	}
}
