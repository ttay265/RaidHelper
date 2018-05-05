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
    <body>

        <form  action="ProcessServlet">
            <div style="display:inline-block;width: 250px">
                <p>Add Member to Raid</p>

                <input class='form-control' width="250" maxlength="16" name="txtMemberName" placeholder="Enter member's name..."/>
                <button class='btn' type="submit" name="action" value="addMember" >Add</button>
            </div> 

            <div style=" margin-left: 100px;display:inline-block;width: 250px">
                <p>Bid</p>
                <input class='form-control' width="250" maxlength="20" name="txtLootName" placeholder="Enter loot..."/>
                <input class='form-control' width="250" maxlength="20" name="txtBidAmount" placeholder="Enter amount..."/>
                <button class='btn' type="submit" name="action" value="addBid">Bid</button>
            </div> 
            <div>
                <table style="min-width: 650px;width: 40%" class="table table-striped">
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
    </body>
</html>

