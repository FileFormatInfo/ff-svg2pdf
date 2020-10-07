<%@ page contentType="text/html;charset=utf-8"
		 errorPage="/500.jsp"
		 import="java.io.*,
		 		 java.text.*,
		 		 java.util.*"
%><%

	String formUrl = System.getenv("FORM_URL");

%><html>
	<head>
		<title>SVG to PDF - FileFormat.Info</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="/css/light.css" />
		<link rel="canonical" href="https://svg2pdf.fileformat.info/" />
	</head>
	<body>
		<h1>
			<a href="https://www.fileformat.info/"><img alt="FileFormat.Info logo" src="favicon.svg" style="height:2.2em;vertical-align:middle;" /></a>
			SVG to PDF
		</h1>
		<p>
			Convert an SVG to a PDF
		</p>
	<% if (formUrl != null && formUrl.length() > 0) { %>
		<p>
			<a href="<%=formUrl%>">Try it!</a>
		</p>
	<% } else { %>
		<p>
			<form method="POST" action="convert.html" enctype="multipart/form-data">
				<input type="hidden" name="size" value="custom" />

				Width (in points):
				<input type="text" name="width" />

				Height (in points):
				<input type="text" name="height" />

				SVG file:
				<input type="file" name="stdin" />

				<input type="submit" value="Convert" />
			</form>
		</p>
	<% } %>
		<p>
			<a href="https://github.com/FileFormatInfo/ff-svg2pdf">How this works</a>, including source code!
		</p>
		<p>
			<a href="https://www.fileformat.info/">FileFormat.Info</a> has more
			<a href="https://www.fileformat.info/convert/">file conversion utilities</a>
			and documentation on different <a href="https://www.fileformat.info/format/">file formats</a>.
		</p>
		<footer style="text-align:center">
			<a href="https://www.fileformat.info/about/privacy.htm">Privacy Policy</a>
			| <a href="https://www.fileformat.info/about/tos.htm">Terms of Service</a>
			<img src="https://fileformat.goatcounter.com/count?p=/subsite/svg2pdf/index.html">
		</footer>
	</body>
</html>
