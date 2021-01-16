package controllers.mypage;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Employee;
import utils.DBUtil;

/**
 * Servlet implementation class MypageOtherServlet
 */
@WebServlet("/mypage/other")
public class MypageOtherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageOtherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Employee login_employee = (Employee)request.getSession().getAttribute("login_employee");
        Employee e = em.find(Employee.class, Integer.parseInt(request.getParameter("id")));

        long followcheck = (long)em.createNamedQuery("getMyFollowsCheckCount", Long.class)
                .setParameter("follower", login_employee)
                .setParameter("employee", e)
                .getSingleResult();

        em.close();

        request.setAttribute("employee", e);
        request.setAttribute("followcheck", followcheck);
        request.setAttribute("_token", request.getSession().getId());


        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/mypage/other.jsp");
        rd.forward(request, response);
    }

}
