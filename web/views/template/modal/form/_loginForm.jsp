<!-- Login form -->
<div class="modal fade" id="LoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form id="LoginForm_action">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Login</h4>
                </div>
                <div class="modal-body" id="inputInfo">
                    <input class="form-control input-lg" id="inputusername" name="username" required type="text" placeholder="username"><br>
                    <input class="form-control input-lg" id="inputpassword" name="password" required type="password" placeholder= "password"><br>
                    
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary btn-md" id="LoginButton" data-dismiss="modal">Login</button> or 
                    <button data-toggle="modal" data-target="#RegisterForm" class="btn btn-primary btn-md" data-dismiss="modal">Register</button>
                </div>
            </form>
        </div>
    </div>
</div>