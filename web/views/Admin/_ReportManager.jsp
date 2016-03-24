<%@page import="Model.Report"%>
<%@page import="Model.Image"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<div class="container">
    <div class="row center span10" id="container">
        <h1>List Report<small>  Click one of the <i class="icon-filter"></i> 's below to begin</small></h1>
        <% ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listAllUsers");
           ArrayList<Image> listImg = (ArrayList<Image>) request.getAttribute("listAllImages");
           ArrayList<Report> listReport = Report.getListReport();
        %>
        <div class="table-content">
                
            <table class="table table-hover table-condensed table-bordered table-fixed table-fixed-header" style="background-color: #ffffff;">
                <thead>
                    <tr>
                    <th>Username<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th>ID image<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th class="col-md-3 col-xs-2">Image</th>
                    <th>Content<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th>Status<i class="icon-filter editable editable-click editable-empty"></i></th>
                    <th><div><div>Action</div></div></th>
                    </tr>
                </thead>
                <tbody>

                    <% for (int i = listReport.size() - 1; i >= 0 ; i--) {%>
                    <tr>
                    <td><%=listUser.get(listReport.get(i).getId_user()).getUsername()%></td>
                    <td><%=listReport.get(i).getId_img()%></td>
                    <td class="col-md-3 col-xs-2"><img src="<%=listImg.get(listReport.get(i).getId_img()).getLinkImage()%>" style="height: auto; width: 50%; "></td>
                    <td><%=listReport.get(i).getContent()%></td>
                    <%if (listReport.get(i).getAccept() == 0) {%>
                    <td id="report_result_<%=listReport.get(i).getId()%>">Ignore</td>
                    <td></td>
                    <%} else if (listReport.get(i).getAccept() == 1) {%>
                    <td id="report_result_<%=listReport.get(i).getId()%>">Not yet</td>
                    <td >
                        <a class="btn btn-default " id="Agree_report<%=listReport.get(i).getId()%>" onclick="agree_report(<%=listReport.get(i).getId()%>, 'Agree')">Agree</a></br>
                        <a class="btn btn-default " id="Ignore_report<%=listReport.get(i).getId()%>" onclick="ignore_report(<%=listReport.get(i).getId()%>, 'Ignore')">Ignore</a>
                    </td>
                    <%} else if (listReport.get(i).getAccept() == 2) {%>
                    <td id="report_result_<%=listReport.get(i).getId()%>">Agree</td>
                    <td></td>
                    <%}%>
                    </tr>
                    <%}%>
                </tbody>
            </table>              
        </div>
    </div>
</div>

