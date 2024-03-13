/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Email;
import model.EmailUtils;
import model.Product;
import model.SoLuongDaBan;
import model.TongChiTieuBanHang;

/**
 *
 * @author admin
 */
@WebServlet(name="OrderControl", urlPatterns={"/order"})
public class OrderControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	        Account a = (Account) session.getAttribute("acc");
	        if(a == null) {
	        	response.sendRedirect("login");
	        	return;
	        }
	        int accountID = a.getId();
	        DAO dao = new DAO();
	        List<Cart> list = dao.getCartByAccountID(accountID);
	        List<Product> list2 = dao.getAllProduct();
	        double totalMoney=0;
	        for(Cart c : list) {
				for(Product p : list2) {
					if(c.getProductID()==p.getId()) {
						totalMoney=totalMoney+(p.getPrice()*c.getAmount());
					}
				}
			}
	        double totalMoneyVAT=totalMoney+totalMoney*0.1;
	        
	        double tongTienBanHangThem=0;
	        int sell_ID;
	        for (Cart c : list) {
	            for (Product p : list2) {
	                if (c.getProductID() == p.getId()) {
	                    tongTienBanHangThem = 0;
	                    sell_ID = dao.getSellIDByProductID(p.getId());
	                    tongTienBanHangThem = tongTienBanHangThem + (p.getPrice() * c.getAmount());
	                    TongChiTieuBanHang t2 = dao.checkTongChiTieuBanHangExist(sell_ID);
	                    if (t2 == null) {
	                        dao.insertTongChiTieuBanHang(sell_ID, 0, tongTienBanHangThem);
	                    } else {
	                        dao.editTongBanHang(sell_ID, tongTienBanHangThem);
	                    }
	                }
	            }
	        }
	        
	        
	        for(Cart c : list) {
				for(Product p : list2) {
					if(c.getProductID()==p.getId()) {
						SoLuongDaBan s = dao.checkSoLuongDaBanExist(p.getId());
						if(s == null) {
							dao.insertSoLuongDaBan(p.getId(), c.getAmount());
						}
						else {
							dao.editSoLuongDaBan(p.getId(), c.getAmount());
						}	
					}
				}
			}
	        
	        dao.insertInvoice(accountID, totalMoneyVAT);
	        TongChiTieuBanHang t = dao.checkTongChiTieuBanHangExist(accountID);
	        if(t==null) {
	        	dao.insertTongChiTieuBanHang(accountID,totalMoneyVAT,0);
	        }
	        else {
	        	dao.editTongChiTieu(accountID, totalMoneyVAT);
	        }
	        
	        
		request.getRequestDispatcher("DatHang.jsp").forward(request, response);
	}


    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String emailAddress = request.getParameter("email");
			String name = request.getParameter("name");
			String phoneNumber = request.getParameter("phoneNumber");
			String deliveryAddress = request.getParameter("deliveryAddress");
			
			 HttpSession session = request.getSession();
		        Account a = (Account) session.getAttribute("acc");
		        if(a == null) {
		        	response.sendRedirect("login");
		        	return;
		        }
		        int accountID = a.getId();
		        DAO dao = new DAO();
		        List<Cart> list = dao.getCartByAccountID(accountID);
		        List<Product> list2 = dao.getAllProduct();
					
		        double totalMoney=0;
		        for(Cart c : list) {
					for(Product p : list2) {
						if(c.getProductID()==p.getId()) {
							totalMoney=totalMoney+(p.getPrice()*c.getAmount());
						}
					}
				}
		        double totalMoneyVAT=totalMoney+totalMoney*0.1;
		        
		        
		        //old code
				Email email =new Email();
				email.setFrom("buisyduc2710@gmail.com"); //chinh lai email quan tri tai day [chu y dung email con hoat dong]
				email.setFromPassword("demdblquwwtzlfsh"); //mat khau email tren
				email.setTo(emailAddress);
				email.setSubject("Dat hang thanh cong tu Fashion Family");
				StringBuilder sb = new StringBuilder();
				sb.append("Dear ").append(name).append("<br>");
				sb.append("Ban vua dat dang tu Fashion Family. <br> ");
				sb.append("Dia chi nhan hang cua ban la: <b>").append(deliveryAddress).append(" </b> <br>");
				sb.append("So dien thoai khi nhan hang cua ban la: <b>").append(phoneNumber).append(" </b> <br>");
				sb.append("Cac san pham ban dat la: <br>");
				for(Cart c : list) {
					for(Product p : list2) {
						if(c.getProductID()==p.getId()) {
							sb.append(p.getName()).append(" | ").append("Price:").append(p.getPrice()).append("$").append(" | ").append("Amount:").append(c.getAmount()).append(" | ").append("Size:").append(c.getSize()).append("<br>");
						}
					}
				}
				sb.append("Tong Tien: ").append(String.format("%.02f",totalMoneyVAT)).append("$").append("<br>");
				sb.append("Cam on ban da dat hang tai Fashion Family<br>");
				sb.append("Chu cua hang");
				
				email.setContent(sb.toString());
				EmailUtils.send(email);
				request.setAttribute("mess", "Dat hang thanh cong!");
				
				dao.deleteCartByAccountID(accountID);
				
				
				//new code
//				request.setAttribute("email", emailAddress);
//				request.getRequestDispatcher("ThongTinDatHang.jsp").forward(request, response);
				
			
		} catch (Exception e) {
			request.setAttribute("error", "Dat hang that bai!");
			e.printStackTrace();
		}
	
		request.getRequestDispatcher("DatHang.jsp").forward(request, response);
	}

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
