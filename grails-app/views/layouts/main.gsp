<!DOCTYPE html>

<html lang="en" xmlns:display="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<script src ="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link href ="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link href ="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css"></link>
	<script src=https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js></script>
	<script src=https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js></script>

	<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
	<g:javascript src="util.js" />

	<script >
        $(function() {
            $( ".datepicker" ).datepicker();
        });


        $(document).ready(function() {
            $('#display').DataTable();

        } );
	</script>

	<g:layoutHead />
	<r:layoutResources/>

</head>
<div id = "wrap">
	<body>

	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">

				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>

 				<a href="/"><img src="https://logos-download.com/wp-content/uploads/2018/02/PGA_Tour_logo_R.png" style="width : 70px; height : 75px; style="display: inline-block; /></a>

			</div>

			<!-- app content -->
			<div class="collapse navbar-collapse" id="mainNavbar">
				<ul class="nav navbar-nav">
 					<li><a href="javascript:void(0);" class="navbar-text-header-color" onclick="doHome();"> <span class="glyphicon glyphicon-home"  aria-hidden="true"></span> Home</a></li>
				</ul>

 			</div>
		</div>
	</nav>
	<g:layoutBody />


	<footer class="footer">
		<div class="container">
			<p class="text-muted"><center> 2018 Jeff Kramer Golf Improvement Application Thesis. </center></p>
		</div>
	</footer>

	</body>
</div>
</html>
