<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/jsp/inc/taglibs.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div id="editcategory" class="management">
    <div id="pagecontentheader"><h2>Zarządzanie</h2></div>
    <table cellspacing="0">
        <tr>
            <td class="rightcells">
                <div id="pagecontentsubheader"><h3>Edycja/dodanie kategorii</h3></div>
                <div id="content">
                    <div class="contenttop"></div>
                    <div class="contentmiddle">
                        <c:url value="/manage/category/save.html" var="formURL"/>
                        <form:form commandName="category" action="${formURL}">
                            <table cellspacing="0" class="standardtable">
                                <c:if test="${category.id != null}">
                                    <form:hidden path="id"/>
                                </c:if>
                                <tr>
                                    <td>
                                        <ul class="formContainer">
                                            <li>
                                                <label>Nazwa</label>
                                                <form:input cssErrorClass="fieldError w98p" maxlength="64" onblur="$('categoryCounter').hide()" onkeyup="this.value.charCount('categoryCounter', 64)" cssClass="w98p" path="categoryName"/>
                                                <form:errors cssClass="formError errorBottom" path="categoryName"/>
                                                <span id="categoryCounter" class="counter"></span>
                                            </li>
                                            <li>
                                                <label>Opis</label>
                                                <form:textarea cssErrorClass="fieldError w98p" cssClass="w98p" onblur="$('descCounter').hide()" onkeyup="this.value = this.value.charTextCount('descCounter', 255)" path="categoryDesc"/>
                                                <form:errors cssClass="formError errorBottom" path="categoryDesc"/>
                                                <span id="descCounter" class="counter"></span>
                                            </li>
                                            <li>
                                                <form:checkbox cssClass="floatLeft chk" path="active"/>
                                                <label>Aktywna</label>
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
