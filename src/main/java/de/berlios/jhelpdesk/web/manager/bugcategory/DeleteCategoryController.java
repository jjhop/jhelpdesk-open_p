/*
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Copyright: (C) 2006 jHelpdesk Developers Team
 */
package de.berlios.jhelpdesk.web.manager.bugcategory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.view.RedirectView;

import de.berlios.jhelpdesk.dao.BugCategoryDAO;

public class DeleteCategoryController implements Controller {
	
	private static Log log = LogFactory.getLog( DeleteCategoryController.class );
	private BugCategoryDAO categoryDAO;
	
	public ModelAndView handleRequest(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		try {
			categoryDAO.deleteCategory(categoryDAO.getById(
					Long.parseLong(request.getParameter("catId"))));
		} catch (Exception ex) {
			log.error(ex);
		}
		return new ModelAndView(new RedirectView(
			request.getContextPath().concat("/manage/category/showAll.html")));
	}
	
	/**
	 * @param categoryDAO the categoryDAO to set 
	 */
	public void setCategoryDAO( BugCategoryDAO categoryDAO ) {
		this.categoryDAO = categoryDAO;
	}
}
