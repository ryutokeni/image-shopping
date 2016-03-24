<%@page import="Model.User"%>
<%@page import="DataAccess.Album_DAL"%>

<%@page import="Model.Image"%>
<%@page import="java.util.ArrayList"%>

<div class="container">
    <div class="row center span10" id="container">
        <h1>List Img<small>  Click one of the <i class="icon-filter"></i> 's below to begin</small></h1>
        <% 
           ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listAllUsers");
           ArrayList<Image> listImg = (ArrayList<Image>) request.getAttribute("listAllImages");
           ArrayList<String> listAlbum = Album_DAL.getAllAlbumNam();
        %>
        <div class="table-content">
            
            <table class="table table-hover table-condensed table-bordered table-fixed table-fixed-header" style="background-color: #ffffff;">
                <thead>
                    <tr>
                    <th>ID<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th>Type<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th>Name<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th class="col-md-3 col-xs-2">Image</th>
                    <th>Author<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th>Album<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th>Status<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th><div><div>Action</div></div></th>
                    </tr>
                </thead>
                <tbody>
                    
                    <% for (int i = 0; i < listImg.size(); i++) {%>
                    <tr>
                   
                    <td><%=listImg.get(i).getIDImage()%></td>
                    <td><%=listImg.get(i).getType()%></td>
                    <td><%=listImg.get(i).getName()%></td>
                    <td class="col-md-2 col-xs-1"><img src="<%=listImg.get(i).getLinkImage()%>" class="img-rounded" style="height: auto; width: 50%; "></td>
                    <td><%=listUser.get(listImg.get(i).getAuthor()).getUsername()%></td>
                    <td><%=listAlbum.get(listImg.get(1).getAlbum())%></td>
                    <%if (listImg.get(i).getAccept() == 0) {%>
                    <td id="permis_<%=listImg.get(i).getIDImage()%>">Deny</td>
                    <td class="col-md-1">
                        <a class="btn btn-default" id="accept_imgpermission_form<%=listImg.get(i).getIDImage()%>" onclick="accept_imgpermission('<%=listImg.get(i).getIDImage()%>','Accept')" style="max-width: 90px; max-height: 30px;">Accept</a>
                        <a class="btn btn-default" id="deny_imgpermission_form<%=listImg.get(i).getIDImage()%>" onclick="deny_imgpermission('<%=listImg.get(i).getIDImage()%>','Deny')" style="display: none; max-width: 90px; max-height: 30px;">Deny</a>
                    </td>
                    <%} else if (listImg.get(i).getAccept() == 1) {%>
                    <td id="permis_<%=listImg.get(i).getIDImage()%>">Accept</td>
                    <td class="col-md-1">
                        <a class="btn btn-default" id="accept_imgpermission_form<%=listImg.get(i).getIDImage()%>" value="<%=listImg.get(i).getIDImage()%>" onclick="accept_imgpermission('<%=listImg.get(i).getIDImage()%>','Accept')" style="display: none; max-width: 90px; max-height: 30px;">Accept</a>
                        <a class="btn btn-default " id="deny_imgpermission_form<%=listImg.get(i).getIDImage()%>" value="<%=listImg.get(i).getIDImage()%>" onclick="deny_imgpermission('<%=listImg.get(i).getIDImage()%>','Deny')" style="max-width: 90px; max-height: 30px;">Deny</a>
                    </td>
                    <%}%>
                    
                    </tr>
                    </form>
                    <%}%>
                </tbody>
            </table>              
        </div>
    </div>
</div>