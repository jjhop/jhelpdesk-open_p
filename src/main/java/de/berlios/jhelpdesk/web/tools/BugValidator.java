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
package de.berlios.jhelpdesk.web.tools;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import de.berlios.jhelpdesk.model.Bug;

public class BugValidator implements Validator {
	
	// implementujemy Validator.supports(Class), dlatego SuppressWarnings
	public boolean supports(@SuppressWarnings("unchecked") Class clazz) { 
		return Bug.class.equals(clazz);
	}

	public void validate(Object command, Errors errors) {
		Bug hdBug = (Bug) command;
		if (hdBug.getSubject().trim().isEmpty())
			errors.reject("pofakany.subject");
		if (hdBug.getBugPriority() == null)
			errors.reject("pofakany.priorytet");
		if (hdBug.getBugCategory() == null)
			errors.reject("pofakana.kategoria");
	}
}
