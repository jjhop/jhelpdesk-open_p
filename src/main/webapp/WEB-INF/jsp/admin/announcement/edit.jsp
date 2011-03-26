<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/jsp/inc/taglibs.jsp" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div id="editannouncement" class="management">
    <div id="pagecontentheader"><h2>Zarządzanie</h2></div>
    <table cellspacing="0">
        <tr>
            <td class="rightcells">
                <div id="pagecontentsubheader"><h3>Edycja wiadomości</h3></div>
                <div id="content">
                    <div class="contenttop"></div>
                    <div class="contentmiddle">
                        <c:url value="/announcements/save.html" var="formUrl"/>
                        <form:form commandName="announcement" action="${formUrl}" method="post">
                            <c:if test="${announcement.id != null}">
                                <form:hidden path="id"/>
                            </c:if>
                            <table cellspacing="0" class="standardtable">
                                <tr>
                                    <td class="lastcol">
                                        <ul class="formContainer">
                                            <li>
                                                <label>Tytuł</label>
                                                <form:input maxlength="255" cssErrorClass="w98p fieldError" cssClass="w98p" path="title"/>
                                                <form:errors path="title" cssClass="formError errorBottom"/>
                                            </li>
                                            <li>
                                                <label>Skrót</label>
                                                <form:textarea cssErrorClass="w98p fieldError" cssClass="w98p ml4096" path="lead" />
                                                <form:errors cssClass="formError errorBottom" path="lead"/>
                                            </li>
                                            <li>
                                                <label>Treść główna</label>
                                                <form:textarea cssClass="w98p ml16384" rows="8" path="body"/>
                                                <form:errors cssClass="formError errorBottom" path="body"/>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" value="zapisz" class="btn btnMarginTop floatRight" />
                            <div class="clearFloat"></div>
                        </form:form>
                    </div>
                    <div class="contentbottom"></div>
                </div>
            </td>
        </tr>
    </table>
</div>
