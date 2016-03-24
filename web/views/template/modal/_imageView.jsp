
<%@page import="Model.User"%>
<%@page import="DataAccess.User_DAL"%>
<div class="modal modal-wide fade" id="ImageView" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content modal-big">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">                
                <input type="hidden" value="" id="imageid">
                <div class="photoLargeUnit">
                    <img id="photoLarge" class="photoLarge" src="">
                    <% if (null != session.getAttribute("user")) { %>
                    <div class="photoToolbar" style="width: 1290px; bottom: 15px;">
                        <div class="like-button" id="like-button"></div>
                        <a class="report-button" data-toggle="modal" data-target="#ReportForm"></a>
                    </div>
                    <% }%>
                </div>
                <h2 class="photoLargeName" id="photoLargeName"></h2>
                <a href="" id="link">
                    <h4 class="photoLargeAuthor" id="photoLargeAuthor"></h4>
                </a>
                <div class="views">
                    <h3 id="viewCount"></h3>
                    <h5>views</h5>
                </div>
            </div>
        </div>
    </div>
</div>
