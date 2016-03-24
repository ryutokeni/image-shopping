
<%@page import="Model.Image"%>
<%@page import="DataAccess.Image_DAL"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Image> listImg = (ArrayList<Image>) request.getAttribute("listAllImages");
    ArrayList<Integer> listTopDownload = Image_DAL.top10Download();
%>

<div class="modal fade" id="TopDownloads" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Top Downloads</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tr>
                        <td>Rank</td>
                        <td>Name</td>
                    </tr>
                    <%for (int i = 1; i <= listTopDownload.size(); i++) {%>
                    <tr>
                        <td><%= i%></td>
                        <td><%= listImg.get(listTopDownload.get(i - 1).intValue()).getName()%></td>
                        <td>
                            <img style="height: 50px; width: 100px;" src="<%=listImg.get(listTopDownload.get(i - 1).intValue()).getLinkImage()%>" alt="<%=listImg.get(listTopDownload.get(i - 1).intValue()).getName()%>">
                        </td>
                    </tr>
                    <% }%>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
