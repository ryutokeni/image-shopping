<%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<div class="topMenuBar">
    <a href="<%=url%>"> <!-- link ve menu -->
        <img src="" alt="" class="logo"> <!-- chen link hinh logo vao src -->
    </a>


    <a data-toggle="modal" data-target="#LoginForm" href="#"> 
        <img src="" alt="login" class="shoppingCart"> 
    </a>

    

    <a data-toggle="modal" data-target="#TopSellers" href="#"> <!-- link dan toi trang danh sach top seller -->
        <img src="./resource/icon/topSeller.png" alt="" class="iconTopSeller"> 
    </a>

    <a data-toggle="modal" data-target="#TopDownloads" href="#"> <!-- link dan toi trang danh sach top download -->
        <img src="./resource/icon/topDownload.png" alt="" class="iconTopDownload"> 
    </a>

    <jsp:include page="search.jsp"></jsp:include>
</div>
