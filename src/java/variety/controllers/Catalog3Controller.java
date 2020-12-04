
package variety.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;


import variety.business.*;
import variety.data.*;
/**
 *
 * @author Sophie
 */
public class Catalog3Controller extends HttpServlet {

       @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url;
            url = showProduct(request, response);
        getServletContext()
            .getRequestDispatcher(url)
            .forward(request, response);
    
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/catalog/3";

        getServletContext()
            .getRequestDispatcher(url)
            .forward(request, response);
    }

    private String showProduct(HttpServletRequest request, 
            HttpServletResponse response) {
        String productId = request.getPathInfo();
        // This should never be null. But just to be safe.
        if (productId != null) {
            productId = productId.substring(1);
            Product product = ProductDB.selectProduct(productId);
            HttpSession session = request.getSession();
            session.setAttribute("product", product);
        }        
        return "/catalog/3/" + productId + "/index.jsp";
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
