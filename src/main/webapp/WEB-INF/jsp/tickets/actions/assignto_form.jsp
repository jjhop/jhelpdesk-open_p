<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp" %>

<div class="pagecontentsubheader">
    <h3>Komentarz do zlecenia</h3>
</div>
<div class="contentmiddle">
    <c:url value="/tickets/${ticketId}/assignTo.html" var="formURL"/>
    <form:form commandName="assignForm" action="${formURL}" method="post">
        <table class="standardtable" cellspacing="0">
            <tr>
                <td>
                    <ul class="formContainer">
                        <li>
                            <label>
                                Odbiorca zlecenia
                                <span class="lblTip">(wybierz z listy osobę odpowiedzialną za rozwiązanie problemu)</span>
                            </label>
                            <form:select id="ddlUser" path="user"
                                         items="${saviours}" itemValue="email" itemLabel="fullName"/>
                        </li>
                        <li>
                            <label>Komentarz
                                <span class="lblTip">(komentarz jest wymagany, jego maksymalna długość do 4096 znaków)</span>
                            </label>
                            <form:textarea id="comment" path="commentText"
                                           cssClass="addComment" cssErrorClass="addComment fieldError"
                                           onkeyup="charTextCount(this.form.comment, 'commentCounter', 4096)"
                                           onblur="$('commentCounter').hide()"
                                           rows="3" cols="40"/>
                            <form:errors cssClass="formError errorBottom" path="commentText"/>
                            <span id="commentCounter" class="counter"></span>
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
        <input type="submit" value="Zleć" class="btn btnMarginTop floatLeft"/>
        <a href="javascript:window.parent.eval('Lightview.hide()');" class="btnPlain btnMarginTop floatLeft">anuluj</a>
    </form:form>
    <div class="clearFloat"></div>
</div>