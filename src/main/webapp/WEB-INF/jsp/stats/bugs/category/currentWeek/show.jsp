<%@page 
contentType="text/html;charset=UTF-8"
import="com.jjhop.helpdesk.web.charts.BugStatsByCategoryDatasetProducer,
com.jjhop.helpdesk.web.charts.category.Vertical3DChartCategoryDatasetProducer,
com.jjhop.helpdesk.web.charts.BugsStatsByCategoryFullDatasetProducer"%>

<%@include file="/WEB-INF/jsp/inc/taglibs.jsp" %>
<jsp:useBean id="ppChart" class="com.jjhop.helpdesk.web.charts.HDChartPostProcessor"/>

<%
BugStatsByCategoryDatasetProducer currentWeek = ( BugStatsByCategoryDatasetProducer ) request.getAttribute( "currentWeek" );
BugStatsByCategoryDatasetProducer currentMonth = ( BugStatsByCategoryDatasetProducer ) request.getAttribute( "currentMonth" );
BugStatsByCategoryDatasetProducer threeMonth = ( BugStatsByCategoryDatasetProducer ) request.getAttribute( "threeMonths" );
BugStatsByCategoryDatasetProducer allTime = ( BugStatsByCategoryDatasetProducer ) request.getAttribute( "allTime" );

Vertical3DChartCategoryDatasetProducer currentWeekDayByDay = 
( Vertical3DChartCategoryDatasetProducer ) request.getAttribute( "currentWeekDayByDayData" );
Vertical3DChartCategoryDatasetProducer currentMonthWeekByWeekData = 
( Vertical3DChartCategoryDatasetProducer ) request.getAttribute( "currentMonthWeekByWeekData" );
Vertical3DChartCategoryDatasetProducer threeMonthsMonthByMonth = 
( Vertical3DChartCategoryDatasetProducer ) request.getAttribute( "threeMonthsMonthByMonth" );
BugsStatsByCategoryFullDatasetProducer allTimeFull = 
( BugsStatsByCategoryFullDatasetProducer ) request.getAttribute( "allTimeFull" );

%>

<div class="TabView" id="currentWeekTabView">
<div class="Tabs">
<a><span>Podsumowanie</span></a>
<a><span>Wskaźniki tendencji</span></a>
<a><span>Szczegółowa statystyka</span></a>
</div>

<div class="contenttop"></div>

<div class="Pages">

<div class="Page">
<table width="100%" cellspacing="12" cellpadding="4">
<tr>
<td class="chart">
<cewolf:chart 
id="line" 
type="pie3d"
showlegend="false">
<cewolf:data>
<cewolf:producer id="currentWeek"/>
</cewolf:data>
<cewolf:chartpostprocessor id="ppChart" />
</cewolf:chart>
<img src='<% out.print( request.getContextPath() ); %>/<cewolf:imgurl chartid="line" renderer="cewolf" width="320" height="200"/>' alt=""
width="320" height="200" style="border-width: 1px; border-color: black; background-image: url(/helpdesk/i/statbg.gif);background-repeat:no-repeat;" >
</td>
<td class="data">tu tabelka z danymi do wykresu</td>
</tr>
</table>
</div>

<div class="Page">
<table width="100%" cellspacing="12" cellpadding="4">
<tr>
<td class="chart">
<cewolf:chart id="verticalBar3D" type="line" xaxislabel="Dni tygodnia">
<cewolf:data>
<cewolf:producer id="currentWeekDayByDayData" />
</cewolf:data>
</cewolf:chart>
<img src='<% out.print( request.getContextPath() ); %>/<cewolf:imgurl chartid="verticalBar3D" renderer="cewolf" width="320" height="200"/>' 
width="320" height="200"
border-width: 3px; border-color: black; >
</td>
<td class="data">
<table class="statsdata standardtable" cellspacing="0">
<tr class="header">
<th rowspan="2">Lp</th>
<th rowspan="2">Kategoria</th>	
<th class="periodtop" colspan="7">Kolejne dni</th>
<th class="lastcol" rowspan="2">Razem</th>
</tr>
<tr class="header period">
<th>Pon.</th>
<th>Wto.</th>
<th>Śro.</th>
<th>Czw.</th>
<th>Pią.</th>
<th>Sob.</th>
<th>Ndz.</th>
</tr>
<c:forEach var="entry" items="${currentWeekData}" varStatus="s">
<tr class="data">
<td class="scount"><c:out value="${s.count}"/></td>
<td class="entrykey"><c:out value="${entry.key}"/></td>
<td>1</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td class="entryvalue lastcol"><c:out value="${entry.value}"/></td>
</tr>
</c:forEach>
</table>
</td>
</tr>
</table>
</div>

<div class="Page">
bleble tego nie bedzie widac :)
</div>

</div>

<div class="contentbottom"></div>

</div>


<script type="text/javascript">
tabview_initialize('currentWeekTabView');
</script>
