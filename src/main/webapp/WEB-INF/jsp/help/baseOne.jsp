<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/jsp/inc/taglibs.jsp" %>

<c:out value="${article.title}"/>
<br/><br/>
<c:out value="${article.lead}"/>
<br/><br/>
<c:out value="${article.body}"/>
<hr/>
<h3>Powiązane zgłoszenia</h3>
<ol>
    <c:forEach items="${article.associatedTickets}" var="ticket">
        <li><a href="<c:url value="/ticketDetails.html?ticketId=${ticket.ticketId}"/>"><c:out value="${ticket.subject}"/></a></li>
    </c:forEach>
</ol>
<hr/>
<h3>Komentarze</h3>
<c:forEach items="${article.comments}" var="comment">
    <b><c:out value="${comment.title}"/></b><br/>
    <c:out value="${comment.body}"/><br/><br/>
</c:forEach>