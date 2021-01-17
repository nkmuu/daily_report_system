<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h3>フォローリスト</h3>
        <ul>
            <c:forEach var="follow" items="${follows}">
                <li>
                    ・<a href="<c:url value='/mypage/other?id=${follow.employee.id}'/>"><c:out value="${follow.employee.name}" /></a>
                </li>
            </c:forEach>
        </ul>