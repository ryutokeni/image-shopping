<%@page import="DataAccess.User_DAL"%>
<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>


<% 
    
    ArrayList<Integer> listSeller = User_DAL.top10Seller();
    ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listAllUsers");;
%>

<div class="modal fade" id="TopSellers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Top Sellers</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    
                    <tr>
                        <td>Rank</td>
                        <td>Name</td>
                    </tr>
                    <%for(int i = 1; i <= listSeller.size(); i++){%>
                    <tr>
                        <td><%= i %></td>
                        <td>
                            
                            <a href="?userid=<%= listUser.get(listSeller.get(i-1).intValue()).getID() %>" id="link">
                                <%= listUser.get(listSeller.get(i-1).intValue()).getUsername() %>
                            </a>
                        </td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>