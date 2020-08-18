<%-- 
    Document   : Cliente.jsp
    Created on : 17/08/2020, 10:47:34 PM
    Author     : Juampi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, Controlador.*" session="true" %>

<%  

    //todo lo que hay aqui adentro es codigo java
    String usuario = "";
    HttpSession sessionok = request.getSession();
    if(sessionok.getAttribute("usuario") == null){

%>

<jsp:forward page="index.html">
    <jsp:param name="error" value="Es obligatorio tener una cuenta autenticada"/>
</jsp:forward>

<%   

    }else{
        usuario = (String)sessionok.getAttribute("usuario");
    }
    //todo lo anterior se encarga de validar la sesion que sea correcta
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
            
    <p> <b> Bienvenido</b> </p><%=usuario%> 
     <p> <b> Pagina de Clientes de Estetica</b> </p><%=usuario%> 
    
        
    </body>
</html>

