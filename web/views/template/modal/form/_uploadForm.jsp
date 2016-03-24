<%@page import="Model.User"%>
<%@page import="DataAccess.Album_DAL"%>
<%@page import="Model.Album"%>
<%@page import="java.util.ArrayList"%>
<!-- Login form -->
<script>
    
</script>
<%
    User us = (User) session.getAttribute("user");
    ArrayList<Album> listAlbum = new ArrayList<Album>();
    int userid = -1;
    if (us != null) {
        userid = us.getID();
        listAlbum = Album_DAL.Search("", Integer.toString(userid), "");
    }
%>
<div class="modal fade" id="UploadForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content modal-wide">
            <form action="Upload" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Upload Image</h4>
                </div>
                <div class="modal-body uploadContainer">     
                    <div class="form-group">
                        <input  type="file" id="images" name="images" multiple accept="image/*" data-overwrite-initial="true" data-min-file-count="1"/>
                    </div>
                    <input type="hidden" value="<%= userid%>" id="username" name="userid"/>                  
                    Choose album:<input type="text" class="form-control" placeholder="Choose album or create a new one..." list="AlbumList" id="albumUpload" name="albumUpload">
                    <datalist id="AlbumList">
                        <%
                            if (listAlbum != null) {
                                for (int i = 0; i < listAlbum.size(); i++) {
                        %>
                        <option value="<%= listAlbum.get(i).getName()%>"></option>
                        <% }
                            }%>
                    </datalist>
                    <br>
                    <div id="imagePreview">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Upload</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#images").change(function () {
            $("#imagePreview-inner").remove();
            var innerCode = '<div id="imagePreview-inner">';
            var inp = document.getElementById('images');
            for (var i = 0; i < inp.files.length; ++i) {
                var name = inp.files.item(i).name;
                var tmppath = URL.createObjectURL(inp.files[i]);
                innerCode += '<div class="col-xs-3 imagePreviewGroup" id="preview-container-' + i.toString() + '">';
                innerCode += '<img src="'+ tmppath.toString() +'" id="img-' + i.toString() + '" alt="" class="imagePreview">';
                innerCode += '<input class="form-control" type="text" placeholder="Name of image" id = "nameImageUpload" name="nameImageUpload"/><br>';
                innerCode += '<input class="form-control" type="text" placeholder="Type of image" id="typeImageUpload" name ="typeImageUpload"/><br>';
                innerCode += '<input class="form-control" type="text" placeholder="Price of image" id="priceImageUpload" name ="priceImageUpload" onKeyPress="return isNumberKey(event)"/><br>'
                innerCode += '</div>';
            }
            innerCode += '</div>';
            $("#imagePreview").append(innerCode);
        });
    });
</script>