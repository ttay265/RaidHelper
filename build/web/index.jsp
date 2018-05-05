<%-- 
    Document   : index
    Created on : May 2, 2018, 5:32:02 PM
    Author     : ttay2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>

    </head>
    <body>
        <form action="ProcessServlet">
            <button type="submit" class="btn btn-info btn-lg" name="action" value="newraid">New Raid</button>
        </form>
        <!-- Trigger the modal with a button -->
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Import File</button>
        <!-- Modal -->

        <div id="myModal" class="modal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Load Raid by XML</h4>
                    </div>
                    <div class="modal-body">
                        <form style="width: 100%" action="Upload" method="POST" enctype="multipart/form-data">
                            <input width="300px" type="file" name="file"/>
                            <br/>
                            <input width="3000px" type='submit' class='btn btn-info float-right' >Upload</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>  
    </body>
</html>
