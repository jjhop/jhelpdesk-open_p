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
package de.berlios.jhelpdesk.web.stats;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import de.berlios.jhelpdesk.dao.UserDAO;

@Scope("prototype")
@Controller
public class TicketsByNotyfierViewController {

    @Autowired
    private UserDAO hdUserDAO;

    @RequestMapping("/stats/tickets/notifyier.html")
    public String handleRequest(
                  @RequestParam(value = "stats", required = false) String stats,
                  @RequestParam(value = "letter", required = false) String letter,
                  ModelMap map) {
        if (stats != null) {
            return "stats/ticketsByNotyfierStats"; // przegladanie statystyk
        }
        if (letter == null) {
            return "redirect:notifyier.html?letter=A";
        }
        map.addAttribute(
            "users",
            hdUserDAO.getAllUserWithLastNameStartsWithLetter(letter));
        return "stats/ticketsByNotyfierList";
    }
}