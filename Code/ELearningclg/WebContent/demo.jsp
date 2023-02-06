<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="/js/jquery-1.12.3.min.js"></script>
<script src="/js/jspdf.min.js"></script> 
<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script> 

<script> 
var doc = new jsPDF();
var specialElementHandlers = {
    '#editor': function (element, renderer) {
        return true;
    }
};

$('#cmd').click(function () {   
    doc.fromHTML($('#content').html(), 15, 15, {
        'width': 170,
            'elementHandlers': specialElementHandlers
    });
    doc.save('sample-file.pdf');
});


</script>
<style>
h3
{
  border:1px solid black;
}
</style>
</head>


<body>
<div id="content">
    <h3>Sample h3 tag</h3>
    <p>Sample pararaph</p>
</div>
<div id="editor"></div>
<button id="cmd">Generate PDF</button>
 
</body>
</html>