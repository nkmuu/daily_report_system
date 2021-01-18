<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <div id="other_menu">
            <h2 id="other_name"><c:out value="${employee.name}" />&nbsp;さん</h2>

            <div class="follow_button">
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
            </div>
         </div>
         <div class="clear"></div>

            <div class="mypage_container">
                <div class="mypage_index">
                    <h3><span class="under">プロフィール</span></h3>
                    <br />
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
                 </div>

                <div class="follow_list">
                    <h3><span class="under">最新日報一覧</span></h3>
                    <br />
                    <table id="report_list">
                        <tbody>
                            <tr>
                                <th class="report_date">日付</th>
                                <th class="report_title">タイトル</th>
                                <th class="report_action">操作</th>
                            </tr>
                            <c:forEach var="report" items="${reports}" varStatus="status">
                            <tr class="row${status.count % 2}">
                                <td class="report_date"><fmt:formatDate value="${report.report_date}" pattern='yyyy-MM-dd' /></td>
                                <td class="report_title">${report.title}</td>
                                <td class="report_action"><a href="<c:url value='/reports/show?id=${report.id}' />">詳細を見る</a></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${reports_count > 5}">
                        <a href="<c:url value='/reports/otherlist?id=${employee.id}' />">更に見る</a>
                    </c:if>
                    </div>
                </div>

    </c:param>
</c:import>