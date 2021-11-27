<%@page import="com.nja.modelos.dao.ProductoDao"%>
<%@page import="com.nja.modelos.entidades.Producto"%>
<%@include file="WEB-INF/header.jsp" %>
<h3 class="text-center pb-3">Actualice Producto</h3>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ProductoDao ProductoDao = new ProductoDao();
    Producto producto = ProductoDao.getProducto(id);
    
    String letra = producto.getActivo() + ".";
    boolean activo = (letra.equals("S.")) ? true : false;
%>
<form method="post" action="">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header bg-dark">
                    <h4 class="text-white text-center">Ingresar Datos</h4>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <input type="hidden" name="id" value="<% out.print(id); %>" class="form-control" required>
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" value="<% out.print(producto.getNombre()); %>" placeholder="Ingrese el nombre del producto" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="marca">Marca:</label>
                        <input type="text" id="marca" name="marca" value="<% out.print(producto.getMarca()); %>" placeholder="Ingrese el marca del producto" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="precio">Precio:</label>
                        <input type="text" id="precio" name="precio" value="<% out.print(producto.getPrecio()); %>" placeholder="Ingrese el precio del producto" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="categoria">Categoria:</label>
                        <input type="text" id="categoria" name="categoria" value="<% out.print(producto.getCategoria()); %>" placeholder="Ingrese la categoria del producto" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="cantidad">Cantidad:</label>
                        <input type="text" id="cantidad" name="cantidad" value="<% out.print(producto.getCantidad()); %>" placeholder="Ingrese la cantidad del producto" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="imagen">Imagen:</label>
                        <input type="text" id="imagen" name="imagen" value="default.png" value="<% out.print(producto.getImagen()); %>" placeholder="Ingrese la imagen del producto" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="activo">Activo:</label>
                        <select id="activo" name="activo" class="form-control">
                            <% if (activo) {%>
                            <option value="S" selected>Activo</option>
                            <option value="N">Inactivo</option>
                            <% } else {%>
                            <option value="S">Activo</option>
                            <option value="N" selected>Inactivo</option>
                            <% }%>
                        </select>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row">

                        <div class="col-md-6">                    
                            <input type="submit" name="guardar" value="Guardar" class="btn btn-primary btn-block">
                        </div>

                        <div class="col-md-6">
                            <a href="productos" class="btn btn-danger btn-block">Cancelar</a>
                        </div>
                    </div>
                </div>
            </div>



        </div>
</form>

<%@include file="WEB-INF/footer.jsp" %>          
