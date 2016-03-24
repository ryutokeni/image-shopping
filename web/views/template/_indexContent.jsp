<%@page import="DataAccess.Album_DAL"%>
<%@page import="Model.Album"%>
<%@page import="DataAccess.User_DAL"%>
<%@page import="DataAccess.Image_DAL"%>
<%@page import="Model.Image"%>
<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
    User_DAL.getAllUser();
    Image_DAL.getAllImage();
    ArrayList<Image> listImage = new ArrayList<Image>();
    Image image = new Image();
    ArrayList<User> listUser = User.getList_user();
    String photoRow = "";
    String authorid = request.getParameter("userid");
    String type = request.getParameter("type");
    String albumid = request.getParameter("album");
    String albumname = "";
    String url = "./index?userid=" + authorid + "&type=";
    ArrayList<Album> listAlbum = new ArrayList<Album>();
    Album album;
    if ("album".equals(type)) {
        listAlbum = Album_DAL.Search("", authorid, "");
    } else if ("bought".equals(type)) {
        listImage = Image_DAL.getPaidImage(authorid);
        photoRow = "photoRowProfile";
    } else if ("search".equals(type)) {
        String name = request.getParameter("name");
        String imagetype = request.getParameter("imagetype");
        String author = request.getParameter("author");
        if (name == null){
            name = "";
        }
        if (imagetype == null){
            imagetype = "";
        }
        if (author == null) {
            author = "";
        }
            
        listImage = Image_DAL.Search(name, imagetype, author, "");
        photoRow = "photoRow";
    } else {
        if (null == authorid) {
            listImage = Image.listImg;
            photoRow = "photoRow";
        } else {
            if (null == albumid) {
                listImage = Image_DAL.Search("", "", authorid, "");
            } else {
                albumname = Album_DAL.getAlbumName(authorid, albumid);
                listImage = Image_DAL.Search("", "", "", albumname);
            }
            photoRow = "photoRowProfile";
        }
    }
%>
<script>
    $IDImg = new Array(<%= listImage.size()%>);
    $name = new Array(<%= listImage.size()%>);
    $authorUserName = new Array(<%= listImage.size()%>);
    $authorId = new Array(<%= listImage.size()%>);
    $link = new Array(<%= listImage.size()%>);
    $view = new Array(<%= listImage.size()%>);
    $cart = new Array(<%= listImage.size()%>);
</script>
<div class="content">
    <% if (null == authorid) { %>
    <div class="sortBar">
        <span>View by: </span>
        <select class="selectpicker show-tick" data-width="150px">
            <option>None</option>
            <option data-icon="glyphicon-thumbs-up" >Most Viewed</option>
            <option data-icon="glyphicon-star-empty" >Top Rated</option>
        </select>
    </div>
    <% } else {%>
    <div class="profileInfo">
        <h2><%= listUser.get(Integer.parseInt(authorid)).getUsername()%></h2>
        <h4><%= listUser.get(Integer.parseInt(authorid)).getEmail()%></h4>
        <h4><%= listUser.get(Integer.parseInt(authorid)).getPhone()%></h4>
    </div>
    <div class="profileViewNavBarBG">
        <div class="profileViewNavBar">
            <ul class="nav nav-justified nav-tabs">
                <% if ("album".equals(type) || null != albumid) {%>
                <li role="presentation" ><a href="<%= url%>stream">Photostream</a></li>
                <li role="presentation" class="active"><a href="<%= url%>album">Album: <%= albumname%></a></li>
                <li role="presentation" ><a href="<%= url%>bought">Bought</a></li>
                    <% } else if ("bought".equals(type)) {%>
                <li role="presentation" ><a href="<%= url%>stream">Photostream</a></li>
                <li role="presentation" ><a href="<%= url%>album">Album</a></li>
                <li role="presentation" class="active"><a href="<%= url%>bought">Bought</a></li>
                    <% } else {%>
                <li role="presentation" class="active"><a href="<%= url%>stream">Photostream</a></li>
                <li role="presentation" ><a href="<%= url%>album">Album</a></li>
                <li role="presentation" ><a href="<%= url%>bought">Bought</a></li>
                    <% } %>
            </ul>
        </div>
    </div>
    <% }%>
    <% if (!"album".equals(type) || null != albumid || "bought".equals(type)) {%>

    <div class="<%= photoRow%>">
        <% if (null != albumid) {%>
        <div class="addPhoto">
            <img src="././resource/icon/addAlbum.png" alt="cover"/>
            <a data-toggle="modal" data-target="#UploadForm" href="#">
                <div class="addAlbumMask"></div>
            </a>
        </div>
        <% } %>
        <%  for (int i = 0; i < listImage.size(); i++) {
                image = listImage.get(i);
        %>
        <script>
            $name[<%= i%>] = "<%= image.getName()%>";
            $authorId[<%= i%>] = "<%= image.getAuthor()%>";
            $authorUserName[<%= i%>] = "<%= listUser.get(image.getAuthor()).getUsername()%>";
            $link[<%= i%>] = "<%= image.getLinkImage()%>";
            $view[<%= i%>] = <%= image.getView()%>;
        </script>        
        <%      if (image.getAccept() == 1) {%>
        <div class="photoUnit">       
            <img class="photo" src="<%=image.getLinkImage()%>" alt="<%=image.getName()%>"> 

            <div class="photoUnitMask">
                <a href="#" data-toggle="modal" id="<%=i%>" data-target="#ImageView">
                    <input type="hidden" id="ImageLink<%=i%>" value="<%=image.getLinkImage()%>">
                    <div class="photoMask"></div>
                </a>
                <div class="photoToolbar">
                    <div class="toolbarMask"></div>
                    <div class="photoName">
                        <a style="color: white" data-toggle="modal" data-target="#ImageView" href="#"><%=image.getName()%></a>
                    </div>
                    <% if ("bought".equals(type)) { %>
                    <div class = "glyphicon glyphicon-download-alt download" onclick="download('<%= listImage.get(i).getLinkImage() %>')"></div>
                    <% } else { %>
                    <% if (null != (session.getAttribute("user"))) {
                            User user = (User) (session.getAttribute("user"));
                            if (User_DAL.checkLike(image.getIDImage(), user.getID())) {
                    %>
                    <div class="like-button" id="image_<%=image.getIDImage()%>" name="image_<%=image.getIDImage()%>" value="<%=image.getIDImage()%>"></div>
                    <% } else {%>
                    <div class="like-button like-button-selected" id="image_<%=image.getIDImage()%>" name="image_<%=image.getIDImage()%>" value="<%=image.getIDImage()%>"></div>
                    <%}
                        }%>
                    <%
                        //--------------------------------------------------------------------------------------------------------------------------
                        //Add to cart button 
                        if (null != (session.getAttribute("user"))) {
                            User user = (User) (session.getAttribute("user"));
                            List<Image> Cart = User_DAL.getAllCart(user.getID());
                            if (Cart.size() == 0) {%>
                    <button type="button" id="addToCart_<%=image.getIDImage()%>" name="<%=image.getIDImage()%>" onclick="addToCart(this)" class="glyphicon glyphicon-shopping-cart"></button>
                    <%        } else {
                        // Check if image is in the cart or not
                        for (int j = 0; j < Cart.size(); j++) {
                            if (image.getIDImage() == Cart.get(j).getIDImage()) { // Image is in the cart -> disable "Add to cart" button
                                break;
                            } else if (j < Cart.size() - 1) { // Continue till the end of the Cart list
                                continue;
                            } else { // Show the button if this image isnt in the cart
                    %>
                    <button type="button" id="addToCart_<%=image.getIDImage()%>" name="<%=image.getIDImage()%>" onclick="addToCart(this)" class="glyphicon glyphicon-shopping-cart"></button>
                    <% }
                            }
                        }
                        // End "Add to cart" Button%>

                    <a hred="#" class="report-button" data-toggle="modal" id="<%=image.getIDImage()%>" data-target="#ReportForm"></a>
                    <%}
                        }%>

                </div>
            </div>
        </div>	
        <%}
            }%>
    </div>
    <% } else {%>
    <div class="albumRow">
        <div class="addAlbum">
            <img src="././resource/icon/addAlbum.png" alt="cover"/>
            <a data-toggle="modal" data-target="#UploadForm" href="#">
                <div class="addAlbumMask"></div>
            </a>
        </div>
        <%  for (int i = 0; i < listAlbum.size(); i++) {
                album = listAlbum.get(i);
                String href = "?album=" + Integer.toString(album.getId()) + "&userid=" + authorid;
                listImage = Image_DAL.Search("", "", "", album.getName());
        %>
        <div class="albumCover">    
            <% for (int j = 0; j < listImage.size(); j++) {%>
            <img src="<%= listImage.get(j).getLinkImage()%>" alt="cover"/>
            <% }%>           
            <a href="<%= href%>">
                <div class="albumMask"></div>
            </a>
        </div>	
        <%}%>
    </div>
    <% }%>
</div>

<script>
    function download(file)
    {
        downloadFile(file);
    }
    window.downloadFile = function (sUrl) {

        //iOS devices do not support downloading. We have to inform user about this.
        if (/(iP)/g.test(navigator.userAgent)) {
            alert('Your device does not support files downloading. Please try again in desktop browser.');
            return false;
        }

        //If in Chrome or Safari - download via virtual link click
        if (window.downloadFile.isChrome || window.downloadFile.isSafari) {
            //Creating new link node.
            var link = document.createElement('a');
            link.href = sUrl;

            if (link.download !== undefined) {
                //Set HTML5 download attribute. This will prevent file from opening if supported.
                var fileName = sUrl.substring(sUrl.lastIndexOf('/') + 1, sUrl.length);
                link.download = fileName;
            }

            //Dispatching click event.
            if (document.createEvent) {
                var e = document.createEvent('MouseEvents');
                e.initEvent('click', true, true);
                link.dispatchEvent(e);
                return true;
            }
        }

        // Force file download (whether supported by server).
        if (sUrl.indexOf('?') === -1) {
            sUrl += '?download';
        }

        window.open(sUrl, '_self');
        return true;
    }

    window.downloadFile.isChrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
    window.downloadFile.isSafari = navigator.userAgent.toLowerCase().indexOf('safari') > -1;
</script>

