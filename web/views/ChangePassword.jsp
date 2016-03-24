<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Chang password</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <!-- bootstrap dialog-->
        <script src="style/bootstrap.js"></script>

        <!--.................-->
        <link href="style/css/style.css" rel="stylesheet"/>
    </head>
    <body>
        <jsp:include page="template/modal/_topDownloads.jsp"></jsp:include>
        <jsp:include page="template/modal/_topSellers.jsp"></jsp:include>
        <jsp:include page="template/modal/form/_loginForm.jsp"></jsp:include>
        <jsp:include page="template/modal/form/_registerForm.jsp"></jsp:include>
        <jsp:include page="template/modal/form/_reportForm.jsp"></jsp:include>
        <jsp:include page="template/menu/_topMenuNonLog.jsp"></jsp:include>

        <div class="container">
            <div class="row" style="margin-top: 200px;">
                <div class="col-sm-6 col-sm-offset-3">
                    <h1>Change Password</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">

                    <form action="ChangePassword" method="post" id="passwordForm">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input type="password" class="input-lg form-control" name="new_Password" id="password1" placeholder="New Password" autocomplete="off">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" style="visibility: hidden"><i class="glyphicon glyphicon-lock" ></i></span></br>
                            <input type="submit" class="input-lg btn btn-primary btn-load" data-loading-text="Changing Password..." value="Change Password">

                        </div>
                    </form>
                </div><!--/col-sm-6-->
            </div><!--/row-->
        </div>
    </body>
</html>