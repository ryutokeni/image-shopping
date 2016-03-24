 var request;
            function accept_imgpermission(id, permis) {
                var name_form = "#accept_imgpermission_form" + id;
                $(name_form).submit(function (e) {
                    e.preventDefault();
                });
                var values = "idimg=" + id + "&" + "act=" + permis;
                request = $.ajax({
                    url: "Admin/imgpermission",
                    type: "post",
                    data: values,
                    success: function () {
                        var permis_name = "permis_" + id;
                        var form = "accept_imgpermission_form"+id;
                        document.getElementById(permis_name).innerHTML = permis;
                        document.getElementById(form).style.display = 'none';
                        form = "deny_imgpermission_form"+id;
                        document.getElementById(form).style.display = 'block';
                    },
                    error: function () {

                    }
                })
            }
            
            function deny_imgpermission(id, permis) {
                var name_form = "#deny_imgpermission_form" + id;
                $(name_form).submit(function (e) {
                    e.preventDefault();
                });
                var values = "idimg=" + id + "&" + "act=" + permis;
                request = $.ajax({
                    url: "Admin/imgpermission",
                    type: "post",
                    data: values,
                    success: function () {
                        var permis_name = "permis_" + id;
                        var form = "accept_imgpermission_form"+id;
                        document.getElementById(permis_name).innerHTML = permis;
                        document.getElementById(form).style.display = 'block';
                        form = "deny_imgpermission_form"+id;
                        document.getElementById(form).style.display = 'none';
                    },
                    error: function () {

                    }
                })
            }
            
            function agree_report(id, permis) {
                var name_form = "#Agree_reportpermission" + id;
                $(name_form).submit(function (e) {
                    e.preventDefault();
                });
                var values = "idreport=" + id + "&" + "act=" + permis;
                request = $.ajax({
                    url: "Admin/reportpermission",
                    type: "post",
                    data: values,
                    success: function () {
                        var permis_name = "report_result_" + id;
                        var form = "Agree_report"+id;
                        document.getElementById(permis_name).innerHTML = permis;
                        document.getElementById(form).style.display = 'none';
                        form = "Ignore_report"+id;
                        document.getElementById(form).style.display = 'none';
                    },
                    error: {
                        
                    }
                })
            }
            
            function ignore_report(id, permis){
                agree_report(id, permis);
            }
            
            function access_user(id) {
                var name_form = "#Access_userpermission" + id;
                $(name_form).submit(function (e) {
                    e.preventDefault();
                });
                var values = "iduser=" + id + "&" + "act=Access";
                request = $.ajax({
                    url: "Admin/userpermission",
                    type: "post",
                    data: values,
                    success: function () {
                        var permis_name = "permission_" + id;
                        var form = "Access_userpermission_"+id;
                        document.getElementById(permis_name).innerHTML = "Access";
                        document.getElementById(form).style.display = 'none';
                        form = "Deny_userpermission_"+id;
                        document.getElementById(form).style.display = 'block';
                    },
                    error: function () {

                    }
                })
            }
            
            function deny_user(id) {
                var name_form = "#Access_userpermission" + id;
                $(name_form).submit(function (e) {
                    e.preventDefault();
                });
                var values = "iduser=" + id + "&" + "act=Deny";
                request = $.ajax({
                    url: "Admin/userpermission",
                    type: "post",
                    data: values,
                    success: function () {
                        var permis_name = "permission_" + id;
                        var form = "Access_userpermission_"+id;
                        document.getElementById(permis_name).innerHTML = "Deny";
                        document.getElementById(form).style.display = 'block';
                        form = "Deny_userpermission_"+id;
                        document.getElementById(form).style.display = 'none';
                    },
                    error: function () {

                    }
                })
            }
            