<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
            <h2><c:out value="${employee.name}" />&nbsp;さん</h2>
                <div class="mypage_container">
                    <div class="mypage_index">
                        <table class="mypage_list">
                            <tbody>
                                <tr>
                                    <th>部署</th>
                                    <td><c:out value="${employee.department}" /></td>
                                </tr>
                                <tr>
                                    <th>目標</th>
                                    <td><c:out value="${employee.objective}" /></td>
                                </tr>
                            </tbody>
                        </table>

                    <p><a href="<c:url value='/mypage/edit?id=${employee.id}' />">編集する</a></p>
                    </div>

                    <div class="follow_list">
                        <h3>フォローリスト</h3>
                            <ul>
                                <c:forEach var="follow" items="${follows}">
                                    <li>
                                        ・<a href="<c:url value='/mypage/other?id=${follow.employee.id}'/>"><c:out value="${follow.employee.name}" /></a>
                                    </li>
                                </c:forEach>
                            </ul>
                    </div>
                </div>

    </c:param>
</c:import>