<%@page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*,javax.swing.JOptionPane" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            body {
                color: white;
            }
        </style>
    </head>

    <body>

        <%
        try {
            String from=session.getAttribute("send").toString(); 
            String to=request.getParameter("topay");
            String amount=request.getParameter("amount");
            int amt=Integer.parseInt(amount);
            int gtamt,n_gtamt;

            //out.println(from +" want to send "+amount+" to "+ to);
    
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking", "root" , "root" ); 
            Statement  st = con.createStatement(); 
            String q= "select CURRENT_BALANCE from customers where NAME = '" +from+"'";
            String q1 = "select CURRENT_BALANCE from customers where NAME='"+to+"'";
    
    ResultSet rs = st.executeQuery(q);
    
    if(rs.next()) { 
        String gotamount = rs.getString(1);
        gtamt = Integer.parseInt(gotamount);
        
        if( amt > gtamt  ){
            %> 
            
            <div style="margin: 10% 10%;border:2px solid black;width:400px;height:400px">
                <h1> NOT ENOUGH AMOUNT </h1> <br>
              <a href="server1.jsp">  <button> VIEW CUSTOMERS INFO. </button> </a>
            </div>
            
            <%
        } 
        else{
            
            ResultSet r= st.executeQuery(q1);
            gtamt = gtamt - amt; 
            
            if(r.next())
            { 
                String n_gotamount = r.getString(1);
                n_gtamt = Integer.parseInt(n_gotamount); 

                n_gtamt = n_gtamt + amt;
                
                String u ="update customers set CURRENT_BALANCE = '"+gtamt+"' where NAME='"+from+"' ";
                String u1 = "update customers set CURRENT_BALANCE='"+n_gtamt+"' where NAME='"+to+"' ";
                
                st.executeUpdate(u);
                st.executeUpdate(u1);
                %> 
                
                <div style="margin:10% 10%;border:2px solid black;width:400px;height:400px">
                    <h1> AMOUNT SUCCESSFULLY TRANSFERED </h1> <br> 
                    <a href="server1.jsp">  <button> VIEW CUSTOMERS INFO. </button> </a>
                </div>
                
                <%

            } 
        }
    } 
    con.close(); 
} catch(Exception e)
{
    out.println(e); 
}
%>

</body>

    </html>