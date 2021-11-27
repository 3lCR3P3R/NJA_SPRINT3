package com.nja.controladores;

import com.nja.bd.Conexion;
import com.nja.modelos.entidades.Producto;
import com.nja.modelos.dao.ProductoDao;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Productos", urlPatterns = {"/productos"})
public class ProductoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductoDao ProductoDao = new ProductoDao();

        String opcion = request.getParameter("accion");

        opcion = (opcion == null) ? "listar" : opcion;

        if (opcion.equals("ingresar")) {
            boolean ingresar = (request.getParameter("guardar") != null) ? true : false;

            if (ingresar) {
                Producto Producto = new Producto();
                Producto.setNombre(request.getParameter("nombre"));
                Producto.setMarca(request.getParameter("marca"));
                Producto.setPrecio(Float.parseFloat(request.getParameter("precio")));
                Producto.setCategoria(request.getParameter("categoria"));
                Producto.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
                Producto.setImagen(request.getParameter("imagen"));
                Producto.setActivo(request.getParameter("activo"));

                Producto p = ProductoDao.add(Producto);

                response.sendRedirect("productos");

                /*if(e.getId()!=0){
                }
                else{
                }*/
            } else {
                request.getRequestDispatcher("ingresar.jsp").forward(request, response);
            }

        } else if (opcion.equals("actualizar")) {
            boolean ingresar = (request.getParameter("guardar") != null) ? true : false;

            if (ingresar) {
                Producto Producto = new Producto();
                Producto.setId(Integer.parseInt(request.getParameter("id")));
                Producto.setNombre(request.getParameter("nombre"));
                Producto.setMarca(request.getParameter("marca"));
                Producto.setPrecio(Float.parseFloat(request.getParameter("precio")));
                Producto.setCategoria(request.getParameter("categoria"));
                Producto.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
                Producto.setImagen(request.getParameter("imagen"));
                Producto.setActivo(request.getParameter("activo"));

                Producto p = ProductoDao.edit(Producto);

                response.sendRedirect("productos");
                
            } else {
                request.getRequestDispatcher("actualizar.jsp").forward(request, response);
            }

        } else if (opcion.equals("eliminar")) {

            int id = (request.getParameter("id") != null) ? Integer.parseInt(request.getParameter("id")) : 0;
            System.out.println("El valor de id es " + id);
            if (id != 0) {
                ProductoDao.delete(id);
                response.sendRedirect("productos");
            }
        } else {
            List<Producto> Productos = ProductoDao.list();

            request.setAttribute("productos", Productos);

            request.getRequestDispatcher("productos.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
