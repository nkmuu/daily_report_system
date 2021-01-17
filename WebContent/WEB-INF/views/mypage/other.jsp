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

            <c:choose>
                <c:when test="${followcheck == 0}">
                <form action="<c:url value='/follows/create?id=${employee.id}' />" method="post">
                <input type="hidden" name="_token" value="${_token}" />
                <button type="submit">フォロー</button>
                </form>
                </c:when>
                <c:otherwise>
                <form action="<c:url value='/follows/destroy?id=${employee.id}' />" method="post">
                <input type="hidden" name="_token" value="${_token}" />
                <button type="submit">フォロー解除</button>
                </form>
                </c:otherwise>
            </c:choose>

                <div class="mypage_container">
                    <div class="mypage_index">

                        <br />
                        <table class="mypage_list">
                            <tbody>
                                <tr>
                                    <th>部署</th>
                                    <td><!--<c:out value="${employee.department}" />-->営業部署</td>
                                </tr>
                                <tr>
                                    <th>目標</th>
                                    <td><!--<c:out value="${employee.objective}" />-->獲得件数月間20件</td>
                                </tr>
                            </tbody>
                        </table>

                    </div>

                    <div class="follow_list">
                        日報一覧
                    </div>
                </div>

    </c:param>
</c:import>