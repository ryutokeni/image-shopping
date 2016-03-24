<%@page import="java.util.List"%>
<%@page import="Model.Image"%>
<%@page import="DataAccess.User_DAL"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Cart</title>

        <!-- Bootstrap core CSS -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="style/bootstrap.js"></script>
        <!--.................-->
        <link href="style/css/style.css" rel="stylesheet">
        <link href="style/admin/footer.css" rel="stylesheet">
        <!--bootstrap content admin-->


        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.min.css" rel="stylesheet">
        <link href="style/admin/libs/bootstrap-editable.css" rel="stylesheet">
        <link href="style/admin/src/bootstrap-filterable.css" rel="stylesheet">
        <link href="style/admin/table-fixed-header.css" rel="stylesheet">

    </head>

    <body>

        <jsp:include page="template/menu/_topMenuLogged.jsp"></jsp:include>
        <%
            User user = (User) session.getAttribute("user");

        %>
        <div class="content">
            <div class="container">
                <div class="row center span10 " id="container">
                    <h1>List product<small>  Click one of the <i class="icon-filter"></i> 's below to begin</small></h1>
                    <h4>User:   <%=user.getUsername()%></h4>
                    <h4>Email:  <%= user.getEmail()%></h4>
                    <div class="table-content">

                        <table class="table table-hover table-condensed table-fixed table-fixed-header" style="background-color: #ffffff;">
                            <thead>
                                <tr>
                                    <th class="col-md-3 col-xs-2" >Product</th>
                                    <th>Name<i class="icon-filter editable editable-click editable-empty " ></i></th>
                                    <th>Price<i class="icon-filter editable editable-click editable-empty "></i></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% List<Image> image = User_DAL.getCart(user.getID());
                                    if (image != null) {
                                        int Sum = 0;
                                        for (int i = 0; i < image.size(); i++) {%>
                                <tr>
                                    <td class="col-md-2 col-xs-1"><img class="photo img-rounded" src="<%=image.get(i).getLinkImage()%>" style="height: auto; width: 50%;"></td>
                                    <td><%=image.get(i).getName()%></td>
                                    <td><%=image.get(i).getPrice()%></td>
                                    <td class="col-md-1" >
                                        <a class="btn fa fa-trash-o" style="color:red;" href="Cart?command=remove&id_remove=<%=image.get(i).getIDImage()%>"> Remove</a>   
                                    </td>
                                    <% Sum = Sum + image.get(i).getPrice();%>
                                </tr>
                                <%}%>
                                <tr>
                                    <td class="col-md-2 col-xs-1"></td>
                                    <td><strong>Total</strong></td>
                                    <td><strong>$<%= Sum %></strong></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="col-md-5 col-sm-12"></div>
                        <div class="col-md-7 col-sm-12 text-left">
                            <form action="Cart" id="bill_form">
                                <button type="button" id="BackButton" class="btn btn-default">Back to home</button>
                                Atm code: <input type="text" required id="codeatm" name="codeatm" placeholder="Enter your atm code" onKeyPress="return isNumberKey(event)"/>
                                <button type="submit" id="checkoutcart">Check out</button>
                            </form>
                        </div>
                        <% } else {%>
                        <div class="col-md-5 col-sm-12"></div>
                        <div class="col-md-7 col-sm-12 text-left">
                            <h1>Your cart are empty!</h1>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
            <footer style="background: #ffffff; text-align: center;">
                <p>
                    Designed in 2016.
                </p>
            </footer>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="style/admin/libs/bootstrap-editable.min.js"></script>
        <script src="style/admin/src/filterable-utils.js"></script>
        <script src="style/admin/src/filterable-cell.js"></script>
        <script src="style/admin/src/filterable-row.js"></script>
        <script src="style/admin/src/filterable.js"></script>
        <script src="style/admin/table-fixed-header.js"></script>
        <script type="text/javascript">
            $('table').filterable();
        </script>
        <script>
            $("#checkoutcart").on('click', function (){
                if(document.getElementsByName(codeatm).value() = ""){
                    return false;
                }
                else{
                    $("#bill_form").submit();
                }
            })
            $('#BackButton').on('click', function () {

                var url = "<%=request.getScheme()%>" + "://" + "<%=request.getServerName()%>"
                        + ":" + "<%=request.getServerPort()%>" + "<%=request.getContextPath()%>";
                window.location.assign(url);

            });
            function isNumberKey(evt)
                {
                    var charCode = (evt.which) ? evt.which : event.keyCode;
                    if (charCode > 31 && (charCode < 48 || charCode > 57))
                        return false;
                    return true;
                }
        </script>
    </body>
</html>