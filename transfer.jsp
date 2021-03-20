<%@page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <title>Document</title>
    <style>
        
        .tranferbox{
            display: inline-block;
            margin: 7% 36%;
            border:2px solid white;
            padding:2em;
            width: max-content;
            height: auto;
            background-color: #202020;
        }

        body{
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            color: white;
        }
        

        input {
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            font-size: 1.5em;
            height: 2em;
            width: 76%;
        }

        option{
            background-color: white;
            color:black;
        }

        button{
            font-family: sans-serif;
            width: 34%;
            height: 45px;
            margin: 10% 30%;
        }

        select {
        width: 72%;
        font-family: monospace;
        font-size: 2em;
        }

    </style>
</head>
<body>

    
    <nav class="navbar navbar-dark bg-dark">
        <form class="container-fluid justify-content-start">
        <a href="server1.jsp">  <button class="btn btn-outline-success me-2" type="button"> Back </button> </a>
        </form>
    </nav>

    <form action="process.jsp" method="POST">
    <div class="tranferbox">

        <%
        String s = request.getParameter("c_name");
        session.setAttribute("send",s);
        %>
        
        <h1> ENTER AMOUNT </h1> <br>
            <input type="text" name="amount"> <br> <br> 
            <h1> TRANSFER TO </h1> <br>         
            
            <select name="topay" id="select">
                <option value="Select"> Select to pay  </option>
                <option value="Abhi" name="Abhi"> Abhi  </option>
                <option value="Ajay" name="Ajay"> Ajay  </option>
                <option value="Deep" name="Deep"> Deep </option>
                <option value="Aman" name="Aman"> Aman </option>
                <option value="chirag" name="chirag"> chirag </option>
                <option value="jay"  name="jay"> jay </option>
                <option value="Alok" name="Alok"> Alok </option>
            </select> <br> <br> <br> <br>

            <input type="submit" value="TRANSFER">
    </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>


</body>
</html>