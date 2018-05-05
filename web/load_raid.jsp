<%-- 
    Document   : new-raid
    Created on : May 3, 2018, 5:20:54 AM
    Author     : ttay2
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

    </head>
    <body class="container">
        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <a class="navbar-brand" href="index.jsp">Home</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

            </nav>
        </header>
        <main role="main">
            <div style="margin-top:100px; min-width: 650px;width: 40%">
                <form  action="ProcessServlet">
                    <h5>Add Member to Raid</h5>
                    <div style="margin-bottom: 20px" class='form-inline mt-2 mt-md-0'>
                        <input class='form-control mr-sm-2'   maxlength="16" name="txtMemberName" placeholder="Enter member's name..."/>
                        <button class='btn btn-outline-success my-2 my-sm-0' type="submit" name="action" value="addMember" >Add</button>
                        <c:if test="${fn:length(applicationScope.raid.members) gt 0}">

                            <button style="margin-left: 279px" class='btn btn-outline-warning my-2 my-sm-0'<a  href="/myapp/download?p=myparamvalue">Export XML</a> </button>
                        </c:if>
                    </div>
                    <c:if test="${fn:length(applicationScope.raid.members) gt 0}">
                        <h5>Bid</h5>
                        <div style="margin-bottom: 20px" class='form-inline mt-2 mt-md-0'>
                            <input class='form-control mr-sm-2' width="250" maxlength="20" name="txtLootName" placeholder="Enter loot..."/>
                            <input class='form-control mr-sm-2' width="250" maxlength="20" name="txtBidAmount" placeholder="Enter amount..."/>
                            <button class='btn btn-outline-info my-2 my-sm-0' type="submit" name="action" value="addBid">Bid</button>
                        </div> 
                    </c:if>
                    <div>
                        <table class="table table-striped">
                            <thead>
                                <tr><th colspan="5" style="text-align: center">Raid Members</th>
                                </tr>
                                <tr><th style="width: 45px"></th>
                                    <th scope="col" style="text-align: left">Name</th>
                                    <th scope="col" style="text-align: right">Total Earn</th>
                                    <th scope="col" style="text-align: right">Total Bid</th>
                                    <th scope="col" style="text-align: center">Bid</th>
                                </tr>
                            </thead>
                            <c:if test="${fn:length(applicationScope.raid.members) le 0}">
                                <tfoot>
                                    <tr>
                                        <td colspan="5" style="text-align: center">No members</td>
                                    </tr>
                                </tfoot>
                            </c:if>
                            <tbody
                                <tr>
                                    <c:forEach varStatus="counter" var="member" items="${applicationScope.raid.members}">
                                    <tr class="mem_item">
                                        <td style="text-align: right">${counter.count}</td>
                                        <td>${member.name}</td>
                                        <td style="text-align: right">${member.totalShare}</td>
                                        <td style="text-align: right">${member.totalBid}</td>
                                        <td style="text-align: center">
                                            <input name="bidder" value="${member.name}" type="radio">

                                            </input>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </main>
    </body>
</html>

