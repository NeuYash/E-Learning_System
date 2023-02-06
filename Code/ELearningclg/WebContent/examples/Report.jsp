<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.*"%>
<%@page import="com.DAO.*"%>
<%@page import="java.sql.*"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="../assets/css/demo.css" rel="stylesheet" />
    
    
    
    
      <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>e-learning</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

    
<title>Insert title here</title>
</head>
<body>
 <div class="wrapper">
        <div class="sidebar" data-image="../assets/img/sidebar-5.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="#" class="simple-text">
                       Reports
                    </a>
                    
                </div>
                <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="Report.jsp">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>Uploaded File Report</p>
                        </a>
                    </li>
                    <li>
                    
                </ul>
                  <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="TestReports.jsp">
                            <i class="nc-icon nc-notes"></i>
                            <p>Test  Reports</p>
                        </a>
                    </li>
                    <li>
                    
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
           
            <!-- End Navbar -->
            
            <div class="container" style="margin-top:5vw;">
            
            <button style="margin-left:1000px;">   <a  href="../adminwelcome.jsp"> Back </a></button>
            
            
            </div>
           
            <br>
       <div class="container" style="margin-left:50px;">
    <div class="row">
         <div class="col-md-12">
             <p>You Can Download Your Report Here <button  style="margin-left:0.1vw;color:black;background-color:lightblue;" onclick="exportTableToExcel('datatable-responsive', 'Upload Info Report')"><a href="#">Download Report</a></button>
                               </p></div><br>
                               <br>
             
                                <table style=" width:75vw;"id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th    style="font-size:1vw;color:black;background:#fdd6dc;">Group  Name</th>
                          <th style="font-size:1vw;color:black;background:#fdd6dc;">File Name</th>
                          <th style="font-size:1vw;color:black;background:#fdd6dc;">Upload Date</th>
                          
                          
                          <th style="font-size:1vw;color:black;background:#fdd6dc;">Upload Time</th> 
                         
                        </tr>
                      </thead>
                       
                      
                      <tbody>
                      <% 
		
                                    List<FileInfomation> list=DBConnnection.get1();
                                    
                              
                                    
						for(int i=0;i<list.size();i++)
			{
							FileInfomation info=list.get(i);
				/* out.println("hello");
				out.println(info.getFname()); */
	                 
				
			%>	
			
			              
                               <input type="hidden" value="<%=info.getCatname()%>">
                               
                           
                        <tr>
                       
                      
                         <td  align="center" ><span><%=info.getCatname()%></span></td> 
                      
                          <td align="center"><span><%=info.getFilename()%></span></td>
                          <td align="center"><span><%=info.getDate()%></span></td>
                          <td align="center"><span><%=info.getTime()%></span></td>
                        
                        
                        </tr>
                        <%}   %>
             
                      </tbody>
                    </table> 

         </div>
          
    </div>

    </div>
   
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
  
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    
     <script type="text/javascript">
      /*   $(document).ready(function() {

  $('#datatable-responsive').DataTable( {
    
    responsive: true,
    details: false,
 
    "lengthMenu": [[10, 25, 50,100,-1], [10, 25, 50,100 , " All"]] 
    
  
  } );
} );  */
$(document).ready(function() {
	var table = $('#datatable-responsive').DataTable({
	"columnDefs": [
	{ "visible": false, "targets": 0}
	],
	"lengthMenu": [[10, 25, 50,100,-1], [10, 25, 50,100 , " All"]] ,
	/* "displayLength": 100, */
	"drawCallback": function ( settings ) {
	var api = this.api();
	var rows = api.rows( {page:'current'} ).nodes();
	var last=null;
	api.column(0, {page:'current'} ).data().each( function ( group, i ) {
	if ( last !== group ) {
	$(rows).eq( i ).before(
	'<tr><td style="background-color:	papayawhip;" align="center" colspan="4" > Group Name:&nbsp;&nbsp;&nbsp;'+group+'</td></tr>'
	);
	last = group;
	}
	} );
	}
	} );
	
	
	} );

    </script>    
    
    
    
<!-- -----



-->
    
    
   
    
  <script type="text/javascript">


function exportTableToExcel(tableID, filename = 'Demo'){
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'excel_data.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
}

</script>  
    
    
    
    
    
</body>




<!--   Core JS Files   -->






</html>