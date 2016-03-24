<%if (null == (session.getAttribute("user"))) { %>
<jsp:include page="menu/_topMenuNonLog.jsp"></jsp:include>
<% } else { %>
<jsp:include page="menu/_topMenuLogged.jsp"></jsp:include>
<% }%>

<!-- top download & top sellers -->
<jsp:include page="modal/_topDownloads.jsp"></jsp:include>
<jsp:include page="modal/_topSellers.jsp"></jsp:include>