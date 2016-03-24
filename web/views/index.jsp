
<%@page import="DataAccess.Image_DAL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Image"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <!-- bootstrap dialog-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
        <!-- bootstrap select -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.9.3/css/bootstrap-select.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.9.3/js/bootstrap-select.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.9.3/js/i18n/defaults-*.min.js"></script>
        <!-- bootstrap file input -->
        <script src="js/canvas-to-blob.min.js"></script>
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="js/fileinput.js" type="text/javascript"></script>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
        <!--.................-->
        <link href="style/css/style.css" rel="stylesheet">
        <link href="style/css/album.css" rel="stylesheet">
        <%
            String authorid = request.getParameter("userid");
            String contentURL;
            if (null == authorid) {
                contentURL = "template/_indexContent.jsp";
            } else {
                contentURL = "template/_indexContent.jsp?userid=" + authorid;
            }
        %>
        <script>
            var $IDImg;
            var $name;
            var $authorUserName;
            var $authorId = "";
            var $link;
            var $view;
            var $cart;
        </script>
    </head>
    <body>
        <jsp:include page="template/_menu.jsp"></jsp:include>
        <jsp:include page="template/modal/_imageView.jsp"></jsp:include>   
        <jsp:include page="template/_form.jsp"></jsp:include>        
        <jsp:include page= "<%=contentURL%>" ></jsp:include>
            <script>
                //show-hide top download
                $('#TopDownloads').on('shown.bs.modal', function () {
                });
                //show-hide top seller
                $('#TopSellers').on('shown.bs.modal', function () {
                });
                //show-hide login form
                $('#LoginForm').on('shown.bs.modal', function () {
                })
                //show-hide register form
                $('RegisterForm').on('shown.bs.modal', function () {
                })
                //show-hide forget pw form
                $('ForgetPWForm').on('shown.bs.modal', function () {
                })
                //show-hide report form
                $('#ReportForm').on('shown.bs.modal', function () {
                });
                //show-hide upload form
                $('#UploadForm').on('shown.bs.modal', function () {
                });
                //show-hide image view
                $('#ImageView').on('shown.bs.modal', function (e) {
                    var ImageId = parseInt(e.relatedTarget.id.toString());
                    //var ImageLink = document.getElementById("ImageLink" + ImageId).value;
                    $('#photoLarge').attr('src', $link[ImageId]);
                    $('#viewCount').text($view[ImageId]);
                    $('#photoLargeName').text($name[ImageId]);
                    $('#photoLargeAuthor').text($authorUserName[ImageId]);
                    $('a#link').prop("href","?userid=" + $authorId[ImageId]);
                    $('#reason_report').attr('value', $IDImg[ImageId]);

                    /* stop form from submitting normally */
                    $("#formViewImage_" + [ImageId]).submit(function (e) {
                        e.preventDefault();
                    });

                    /* get some values from elements on the page: */
                    var values = "idimg=" + $IDImg[ImageId];

                    /* Send the data using post and put the results in a div */
                    request = $.ajax({
                        url: "View",
                        type: "post",
                        data: values,
                        success: function () {
                            document.getElementById("like-button").className = document.getElementById("image_" + $IDImg[ImageId]).className;
                        },
                        error: function () {

                        }
                    });
                });
                $('#ImageView').on('hidden.bs.modal', function () {
                    var Index = document.getElementById("reason_report").value;
                    document.getElementById("image_" + Index).className = document.getElementById("like-button").className;
                    $(this).removeData('modal');
                    $.ajax({
                        url: "CloseView",
                        type: "post",
                        success: function () {
                            document.getElementById("image_" + Index).className = document.getElementById("like-button").className;
                        },
                        error: function () {

                        }
                    });
                });
                $(document).on('click', '.like-button', function () {
                    $(this).toggleClass('like-button-selected');
                    var idimg = $(this).attr('value');
                    var form = "#image_" + idimg;

                    $(form).submit(function (e) {
                        e.preventDefault();
                    });
                    var values = "idimg=" + idimg;
                    request = $.ajax({
                        url: "Like",
                        type: "post",
                        data: values,
                        success: function () {
                            
                        },
                        error: function () {

                        }
                    });
                })


                //action
                $('#LoginButton').on('click', function () {
                    var user = document.getElementById("inputusername").value;
                    var pass = document.getElementById("inputpassword").value;
                    if (user == '' && pass == '') {
                        alert('You must enter username and password');
                        return false;
                    }
                    else if (pass == '') {
                        alert('You must enter your password');
                        return false;
                    }
                    else if (user == '') {
                        alert('You must enter username');
                        return false;
                    }
                    else {
                        $("#LoginForm_action").submit(function (e) {
                            e.preventDefault();
                        });
                        var values = "username=" + user + "&password=" + pass;
                        request = $.ajax({
                            url: "Login",
                            type: "post",
                            data: values,
                            success: function (check) {
                                if (check.success == false) {
                                    alert('incorrect username or password');
                                } else {
                                    var url = "<%=request.getScheme()%>" + "://" + "<%=request.getServerName()%>"
                                            + ":" + "<%=request.getServerPort()%>" + "<%=request.getContextPath()%>";
                                    window.location.assign(url + "/Login");
                                }
                            },
                            error: function (check) {

                            }
                        });
                    }
                });

                $('#LogoutButton').on('click', function () {
                    $("#Logout_action").submit();
                });
                $('#RegisterButton').on('click', function () {
                    var user = document.getElementById("username").value;
                    var email = document.getElementById("email").value;
                    var fullname = document.getElementById("fullname").value;
                    var phone = document.getElementById("phone").value;
                    var address = document.getElementById("address").value;
                    if (user == '' && email == '' && fullname == '') {
                        alert('You must fill: username, email and fullname');
                    } else if (user == '') {
                        alert('You must enter username')
                    } else if (email == '') {
                        alert('You must enter email');
                    } else if (fullname == '') {
                        alert('You must enter fullname');
                    } else {
                        $("#RegisterForm_action").submit(function (e) {
                            e.preventDefault();
                        });
                        var values = "username=" + user + "&email=" + email + "&fullname=" + fullname
                                + "&phone=" + phone + "&address=" + address;
                        request = $.ajax({
                            url: "Register",
                            type: "post",
                            data: values,
                            success: function (check) {
                                if (check.type == 0) {
                                    alert('only accept Gmail, Yahoo!, Microsoft');
                                } else if (check.type == 1) {
                                    alert('Username available, please choose other username');
                                } else {
                                    alert('Sign Up Success');
                                    var url = "<%=request.getScheme()%>" + "://" + "<%=request.getServerName()%>"
                                            + ":" + "<%=request.getServerPort()%>" + "<%=request.getContextPath()%>";
                                    window.location.assign(url);
                                }
                            }
                        });
                    }


                });
                $('#ReportButton').on('click', function () {
                    $("#ReportForm_action").submit(function (e) {
                        e.preventDefault();
                    });
                    var Idimg = document.getElementById("reason_report").value;
                    var optradio = $('input[name="optradio"]:checked').val();
                    var values = "IDImage=" + Idimg + "&optradio=" + optradio;
                    request = $.ajax({
                        url: "Report",
                        type: "post",
                        data: values,
                        success: function () {
                            var radios = document.getElementsByName('optradio');
                            for (var i = 0, length = radios.length; i < length; i++) {
                                if (radios[i].checked) {
                                    // do whatever you want with the checked radio
                                    radios[i].checked = false;

                                    // only one radio can be logically checked, don't check the rest
                                    break;
                                }
                            }
                        }
                    });
                });

                // --------------------- C A R T ---------------------------------------//
                // Showwing Cart onClick -> Pass data to Cart servlet, Method Post
                $('#Cart').on('click', function () {
                    $.ajax({
                        url: "Cart",
                        type: "POST",
                        data: {cart: $cart},
                        success: function () {
                            var url = "<%=request.getScheme()%>" + "://" + "<%=request.getServerName()%>"
                                    + ":" + "<%=request.getServerPort()%>" + "<%=request.getContextPath()%>" + "/Cart";
                            window.location.assign(url);
                        }
                    });
                });

                // Function add to cart:
                // Mini cart in Index.jsp: Store the current Image which has just been added to $Cart
                // If image isnt in the $Cart (Mini cart) -> add the image to $Cart and chang to button remove (class = glyphicon-log-out) 
                // If image is in the $Cart -> remove the image and change button remove the class = glyphicon-log-out
                function addToCart(e) {
                    var i = 0;
                    while ($cart[i] != null) {
                        if ($cart[i] == e.name) {
                            $(e).removeClass("glyphicon-log-out");
                            while ($cart[i] != null) {
                                $cart[i] = $cart[i + 1];
                                i++;
                            }
                            return;
                        }
                        i++
                    }
                    $(e).addClass("glyphicon-log-out");
                    $cart[i] = e.name;
                }


                // ---------------------------- END CART ---------------------------------------------------------//
                function isNumberKey(evt)
                {
                    var charCode = (evt.which) ? evt.which : event.keyCode;
                    if (charCode > 31 && (charCode < 48 || charCode > 57))
                        return false;
                    return true;
                }


                function checkemail()
                {

                    if ((document.frm.F1.value.lastIndexOf("@gmail.com") == -1) && (document.frm.F1.value.lastIndexOf("@yahoo.com") == -1) && (document.frm.F1.value.lastIndexOf("@outlook.com") == -1))
                    {
                        this.color = red;
                        alert("use only Gmail, Yahoo! and Microsoft")
                        return false
                    }
                    return true
                }

                function sort() {
                    var url = "<%=request.getScheme()%>" + "://" + "<%=request.getServerName()%>"
                            + ":" + "<%=request.getServerPort()%>" + "<%=request.getContextPath()%>" + "/";
                    var x = document.getElementById("select_sort").value;
                    if (x == "None") {
                        url = url + "Sortby?by=none"
                        window.location.assign(url);
                    } else if (x == "Most Viewed") {
                        url = url + "Sortby?by=view"
                        window.location.assign(url);
                    } else if (x == "Top Rated") {
                        url = url + "Sortby?by=rate"
                        window.location.assign(url);
                    }
                }

        </script>
        <script scr="js/NoRightClicking.js" type="text/javascript"></script>
    </body>

</html>