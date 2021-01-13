<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2><c:out value="${sessionScope.login_employee.name}" />&nbsp;さん</h2>
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
                    </tbody>
                </table>

                <p><a href="<c:url value='/mypage/edit' />">編集する</a></p>
            </div>

            <div class="follow_list">
              フォローリスト<br />
              ・Aさん<br />
              ・Bさん<br />
              ・Cさん<br />
              ・Dさん<br />
              ・Eさん<br />
              ・Fさん<br />
            </div>
        </div>
    </c:param>
</c:import>