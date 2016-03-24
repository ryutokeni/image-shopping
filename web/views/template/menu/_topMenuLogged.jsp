
<%@page import="Model.User"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    User us = (User) session.getAttribute("user");
%>
<div class="topMenuBar">
    <a href="<%=url%>"> <!-- link ve menu -->
        <img src="" alt="" class="logo"> <!-- chen link hinh logo vao src -->
    </a>

    <a data-toggle="modal" data-target="#UploadForm" href="#">
        <div class="glyphicon glyphicon-cloud-upload upload"></div>
    </a>
        
    <a href="<%=url%>?userid=<%=us.getID()%>"> <!-- link toi trang quan ly profile -->
        <img src="" alt="profile" class="profile"> <!-- chen link hinh avatar vao src -->
    </a>

    <a data-target="#Cart"> <!-- link toi trang thanh toan -->
        <img src="" alt="shoppingCart" class="shoppingCart" id="Cart"> 
    </a>

    <a href="Login?command=logout"> 
        <img src="" alt="logout" class="logout"> 
    </a>

    

    <a data-toggle="modal" data-target="#TopSellers" href="#"> <!-- link dan toi trang danh sach top seller -->
        <img src="resource/icon/topSeller.png" alt="" class="iconTopSeller"> 
    </a>

    <a data-toggle="modal" data-target="#TopDownloads" href="#"> <!-- link dan toi trang danh sach top download -->
        <img src="resource/icon/topDownload.png" alt="" class="iconTopDownload"> 
    </a>

    <jsp:include page="search.jsp"></jsp:include>
</div>