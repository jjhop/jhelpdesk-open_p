package com.jjhop.helpdesk.web.charts;

import java.io.Serializable;
import java.text.AttributedString;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

import com.jjhop.helpdesk.dao.BugDAO;
import com.jjhop.helpdesk.dao.BugStatusDAO;
import com.jjhop.helpdesk.dao.UserDAO;
import com.jjhop.helpdesk.model.Bug;
import com.jjhop.helpdesk.model.BugStatus;
import com.jjhop.helpdesk.model.User;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.PieSectionLinkGenerator;
import de.laures.cewolf.tooltips.PieToolTipGenerator;
import de.laures.cewolf.tooltips.ToolTipGenerator;

public class BugStatsByNotyfier2DatasetProducer implements DatasetProducer, PieToolTipGenerator,
		PieSectionLinkGenerator, PieSectionLabelGenerator, ToolTipGenerator, Serializable {

	private static final long serialVersionUID = -6385829065111292806L;
	private static final Log log = LogFactory.getLog(BugStatsByNotyfier2DatasetProducer.class);
	
	private UserDAO userDAO;
	private BugStatusDAO  statusDAO;
	private BugDAO bugDAO;

	/**
	 * @param statusDAO The statusDAO to set.
	 */
	public void setStatusDAO(BugStatusDAO statusDAO) {
		log.debug( "Ustawiam statusDAO w 2..." );
		this.statusDAO = statusDAO;
		log.debug( "...ustawione." );
	}

	/**
	 * @param userDAO The userDAO to set.
	 */
	public void setUserDAO(UserDAO userDAO) {
		log.debug( "Ustawiam userDAO w 2..." );
		this.userDAO = userDAO;
		log.debug( "...ustawione." );
	}

	/**
	 * @param bugDAO The bugDAO to set.
	 */
	public void setBugDAO(BugDAO bugDAO) {
		log.debug( "Ustawiam bugDAO w 2..." );
		this.bugDAO = bugDAO;
		log.debug( "...ustawione." );
	}
	
	public Object produceDataset(Map arg0) throws DatasetProduceException {
		DefaultPieDataset dataset = new DefaultPieDataset();

		List<BugStatus> listOfStatuses = statusDAO.getNonOpenedStatuses();
		List<Bug> listOfBugs = new ArrayList<Bug>();
		for( BugStatus status : listOfStatuses ) {
			listOfBugs.addAll( bugDAO.getBugsByStatus( status ) );
			log.debug( "Nowy rozmiar listy => " + listOfBugs.size() );
		}

		List<User> listOfUsers = userDAO.getAllUser();
		log.debug( "Ilosc uzytkownikow w liscie -> " + listOfUsers.size() );
		
		for( User user : listOfUsers ) {
			int numOfBugs = 0;
			for( Bug bug : listOfBugs )
				if( bug.getNotifier().getUserId().longValue() == user.getUserId().longValue() )
					numOfBugs++;
			log.debug( "Ilosc bledow [" + user.getFullName() + "] => " + numOfBugs );
			if( numOfBugs > 0 )
				dataset.setValue( user.getFullName(), numOfBugs );
		}
		return dataset;
	}

	public boolean hasExpired(Map arg0, Date arg1) {
		return false;
	}

	public String getProducerId() {
		return null;
	}

	public String generateToolTip(PieDataset arg0, Comparable arg1, int arg2) {
		return null;
	}

	public String generateLink(Object arg0, Object arg1) {
		return null;
	}

	public String generateSectionLabel(PieDataset arg0, Comparable arg1) {
		return null;
	}

    public AttributedString generateAttributedSectionLabel(PieDataset arg0, Comparable arg1) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
