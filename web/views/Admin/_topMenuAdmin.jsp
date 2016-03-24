<%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<div class="topMenuBar">
    <a href="<%=url%>"> <!-- link ve menu -->
        <img src="" alt="" class="logo"> <!-- chen link hinh logo vao src -->
    </a>


    <a href="Admin?page=ReportManager"> <!-- link toi trang quan ly report -->
        <img src="" alt="reportManager" class="reportManager"> <!-- chen link hinh avatar vao src -->
    </a>

    <a href="Admin?page=ImageManager"> <!-- link toi trang quan ly thanh toan -->
        <img src="" alt="ImageManager" class="ImageManager"> 
    </a>
    
    <a href="Admin?page=UserManager.jsp"> <!-- link toi trang quan ly thanh toan -->
        <img src="" alt="UserManager" class="UserManager"> 
    </a>

    <a href="Login?command=logout"> 
        <img src="" alt="logout" class="logout"> 
    </a>

</div>