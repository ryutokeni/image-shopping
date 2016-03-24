<%-- 
    Document   : ClientManager
    Created on : Jan 1, 2016, 9:49:03 AM
    Author     : Razer Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Admin</title>

        <!-- Bootstrap core CSS -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
         <script src="./style/bootstrap.js"></script>
        <!--.................-->
        <link href="./style/css/style.css" rel="stylesheet">
        <link href="./style/admin/footer.css" rel="stylesheet">
        <!--bootstrap content admin-->


        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.min.css" rel="stylesheet">
        <link href="./style/admin/libs/bootstrap-editable.css" rel="stylesheet">
        <link href="./style/admin/src/bootstrap-filterable.css" rel="stylesheet">
        <link href="./style/admin/table-fixed-header.css" rel="stylesheet">

    </head>

    <body>

        <jsp:include page="_topMenuAdmin.jsp"></jsp:include>

            <div class="content">
            <%if ("ReportManager".equals(session.getAttribute("page"))) {%>
            <jsp:include page="_ReportManager.jsp"></jsp:include>
            <%} else if ("ImageManager".equals(session.getAttribute("page"))) {%>
            <jsp:include page="_ImageManager.jsp"></jsp:include>
            <%} else {%>
            <jsp:include page="_UserManager.jsp"></jsp:include>
            <%}%>
            <!-- FOOTER  -->
            <footer style="background: #ffffff; text-align: center;">
                <p>
                    Designed in 2016.
                </p>
            </footer>
        </div>

        
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="./style/admin/libs/bootstrap-editable.min.js"></script>
        <script src="./style/admin/src/filterable-utils.js"></script>
        <script src="./style/admin/src/filterable-cell.js"></script>
        <script src="./style/admin/src/filterable-row.js"></script>
        <script src="./style/admin/src/filterable.js"></script>
        <script src="./style/admin/table-fixed-header.js"></script>
        <script src="./style/admin/management.js"></script>
        <script type="text/javascript">
            $('table').filterable();
        </script>

    </body>
</html>
