<div class="modal fade" id="RegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form name="register" method="post" id="RegisterForm_action">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Login</h4>
                </div>
                <div class="modal-body">
                    <input class="form-control input-lg" id="username" name="username" required type="text" placeholder="username"><br>
                    <input class="form-control input-lg" id="email" name="email" required type="email" placeholder= "e-mail (only accept Gmail, Yahoo!, Microsoft)" onblur="checkmail()"><br>
                    <p>Personal infomations</p>
                    <input class="form-control input-lg" id="fullname" name="fullname" required type="text" placeholder= "fullname"><br>
                    <input class="form-control input-lg" id="phone" name="phone" type="text" placeholder= "phone number" onKeyPress="return isNumberKey(event)"><br>
                    <input class="form-control input-lg" id="address" name="address" type="text" placeholder= "home adress"><br>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary btn-md" id="RegisterButton" data-dismiss="modal">Register</button>
                </div>
            </form>
        </div>
    </div>
</div>

    