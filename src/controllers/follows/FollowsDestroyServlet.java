package controllers.follows;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Employee;
import models.Follow;
import utils.DBUtil;

/**
 * Servlet implementation class FollowsDestroyServlet
 */
@WebServlet("/follows/destroy")
public class FollowsDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowsDestroyServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Employee login_employee = (Employee)request.getSession().getAttribute("login_employee");
            Employee e = em.find(Employee.class, Integer.parseInt(request.getParameter("id")));

            List<Follow> follows = em.createNamedQuery("getFollowsDestroyCheck", Follow.class)
                    .setParameter("follower", login_employee)
                    .setParameter("employee", e)
                    .getResultList();


            em.getTransaction().begin();

            for (int i = 0; i < follows.size(); i++) {
                em.remove(follows.get(i));
              }

            em.getTransaction().commit();
            em.close();

            request.getSession().removeAttribute("followcheck");
            request.getSession().setAttribute("flush", "フォロー解除しました");

            response.sendRedirect(request.getContextPath() + "/reports/index");
        }
    }

}
