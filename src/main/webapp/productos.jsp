<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nja.modelos.entidades.Producto"%>
<%@include file="WEB-INF/header.jsp" %>
<div class="alert alert-primary">
    <a href="?accion=ingresar" class="btn btn-primary">Ingresar</a>
</div>

<table class="table table-striped table-hover" style="text-align: center;">
    <thead>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>Marca</th>
            <th>Precio</th>
            <th>Categoria</th>
            <th>Cantidad</th>
            <th>Imagen</th>
            <th>Activo</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>

        <%
            List<Producto> productos = (ArrayList<Producto>) request.getAttribute("productos");
            int i = 0;
            for (Producto producto : productos) {
                i++;
        %>
        <tr>
            <td><%=producto.getId()%></td>
            <td><%=producto.getNombre()%></td>
            <td><%=producto.getMarca()%></td>
            <td><%=producto.getPrecio()%></td>
            <td><%=producto.getCategoria()%></td>
            <td><%=producto.getCantidad()%></td>
            <td><%=producto.getImagen()%></td>
            <td><%=producto.getActivo()%></td>
            <td>
                <a href="?accion=actualizar&id=<%=producto.getId()%>" class="btn btn-warning">Editar</a>
                <a href="?accion=eliminar&id=<%=producto.getId()%>" 
                   class="btn btn-danger"
                   onclick="return confirm('Desea eliminar el estudiante seleccionado')">Eliminar</a>
            </td>
        </tr>
        <%
            }
        %>


    </tbody>
</table>
<%@include file="WEB-INF/footer.jsp" %>