<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp" %>

<div class="pagecontentsubheader">
    <h3 id="headTicketFiles">Załączniki do zgłoszenia</h3>
</div>

<div class="contentmiddle">
    <c:if test="${not empty attachments}">
    <h3>Załączniki aktualne</h3>
    <ol class="attachList">
        <c:forEach items="${attachments}" var="a">
        <li>
            <span class="attachName">${a.originalFileName} 
                <span class="attachSize">(${a.humanReadableFileSize})</span>
            </span>
            <span class="attachMeta">(dodany: ${a.createdAt} przez: ${a.creator})</span>
        </li>
        </c:forEach>
    </ol>
    </c:if>
    <c:if test="${not empty currentFiles}">
    <h3>Nowe załączniki</h3>
    <ol class="attachList">
        <c:forEach items="${currentFiles}" var="f" varStatus="i">
        <li id="attachment_id_${i.index}">
            <a class="attachDel" href="#"
                onclick="new Ajax.Request('<c:url value="/tickets/attachments/remove.html?t=${ticket.ticketstamp}&amp;a=${f.filename}&amp;e=attachment_id_${i.index}"/>', {
                                asynchronous:true, evalScripts:true}); return false;">Usuń</a>
            <span class="attachName"><c:out value="${f.filename}"/> <span class="attachSize">(<c:out value="${f.filesize}"/>)</span></span>
        </li>
        </c:forEach>
    </ol>
    </c:if>
    <form:form commandName="fileBean" enctype="multipart/form-data">
        <spring:bind path="fileBean.file">
            <input type="file" name="file"/>
        </spring:bind>
        <input type="submit" value="Dodaj"/>
    </form:form>
    <br/>
    <a href="javascript:window.parent.eval('refreshFiles();Lightview.hide()');" class="">zamknij</a>
</div>
