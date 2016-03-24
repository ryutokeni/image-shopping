<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<div class="container">
    <div class="row center span10 " id="container">
        <h1>List user<small>  Click one of the <i class="icon-filter"></i> 's below to begin</small></h1>
        <% ArrayList<User> List = (ArrayList<User>) request.getAttribute("listAllUsers");%>
        <h4>Admin: <%=List.get(0).getUsername()%></h4>
        <div class="table-content">

            <table class="table table-hover table-condensed table-bordered table-fixed table-fixed-header" style="background-color: #ffffff;">
                <thead>
                    <tr>
                    <th>ID<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th>Username<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th>Fullname<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th>Email<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th>Status<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th>Permission<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th class="col-md-1"><div><div>Action</div></div></th>
                    </tr>
                </thead>
                <tbody>

                    <% for (int i = 1; i < List.size(); i++) {%>
                    <tr>
                    <td><%=List.get(i).getID()%></td>
                    <td><%=List.get(i).getUsername()%></td>
                    <td><%=List.get(i).getFullname()%></td>
                    <td><%=List.get(i).getEmail()%></td>
                    <%if (List.get(i).getActive() == 0) {%>
                    <td>Member</td>
                    <td id="permission_<%=List.get(i).getID()%>">Deny</td>
                    <td class="col-md-1">
                        <a class="btn btn-default " id="Access_userpermission_<%=List.get(i).getID()%>" onclick="access_user('<%=List.get(i).getID()%>')" style="display: block">Access</a>
                        <a class="btn btn-default " id="Deny_userpermission_<%=List.get(i).getID()%>" onclick="deny_user('<%=List.get(i).getID()%>')" style="display: none">Deny</a>
                    </td>
                    <%} else if (List.get(i).getActive() == 1) {%>
                    <td>Member</td>
                    <td id="permission_<%=List.get(i).getID()%>">Not yet</td>
                    <td class="col-md-1"></td>
                    <%} else if (List.get(i).getActive() == 2) {%>
                    <td>Member</td>
                    <td id="permission_<%=List.get(i).getID()%>">Access</td>
                    <td class="col-md-1">
                        <a class="btn btn-default " id="Access_userpermission_<%=List.get(i).getID()%>" onclick="access_user('<%=List.get(i).getID()%>')" style="display: none">Access</a>
                        <a class="btn btn-default " id="Deny_userpermission_<%=List.get(i).getID()%>" onclick="deny_user('<%=List.get(i).getID()%>')" style="display: block">Deny</a>
                    </td>
                    <%} else if (List.get(i).getActive() == 3) {%>
                    <td>Mod</td>
                    <td id="permission_<%=List.get(i).getID()%>">Access</td>
                    <td class="col-md-1"></td>
                    <%}%>
                    </tr>
                    <%}%>
                </tbody>
            </table>              
        </div>
    </div>
</div>
