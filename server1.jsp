<%@page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
    <style>

        table {
            font-family: Arial, Helvetica, sans-serif;
            color:white;
        }

        tr,th{
            padding:2em;
        }

        td {
            color: black;
            background-color: white;
            padding:1em;
        }

        h1{
            margin-top: 5%;
            color: white;
        }

        input{
            border:0px solid white;
        }
    </style>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
        
    <nav class="navbar navbar-dark bg-dark">
        <form class="container-fluid justify-content-start">
        <a href="index.html">  <button class="btn btn-outline-success me-2" type="button"> Back </button> </a>
        </form>
      </nav>

      <center>
        <h1> ALL CUSTOMERS INFORMATION </h1>
    </center>
   <%
   try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking", "root", "root");

    Statement st = con.createStatement();
    String q = "select * from customers";
    ResultSet rs = st.executeQuery(q);
    
    %>
    
    <center>");
        <form action="transfer.jsp" method="POST">
        <table border='1'>
                <tbody>
                <tr>
                    <th>  CUSTOMER NAME  </th>
                    <th>  CUSTOMER ID  </th>
                    <th>  CUSTOMER EMAIL  </th>
                    <th>  CURRENT BALANCE  </th>
                    <th>  TRANSFER  </th>
                </tr> 

        <% while(rs.next()) { %>
                <tr>
                <td><input type="text" name="c_name" value="<%=rs.getString(1)%>" readonly> </td>
                <%
                out.println("<td>" + rs.getString(2) + "</td>");
                out.println("<td>" + rs.getString(3) + "</td>");
                out.println("<td>" + rs.getString(4) + "</td>");
                %>
                <td> <input type="submit" value="tranfer"> </td> 
               </tr>
        <%  } %>
        </tbody> 
        </table> 
    </form> </center>
    <% 
    con.close();
    } catch (Exception e) {
    out.println(e);    
    }
 %>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>

</body>
</html>