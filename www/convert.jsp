<%@ page contentType="text/html; charset=utf-8"
		 errorPage="/500.jsp"
		 import="java.util.*,
				 java.awt.*,
				 java.awt.print.*,
				 java.io.*,
				 com.lowagie.text.*,
				 com.lowagie.text.pdf.*,
				 org.apache.batik.transcoder.*,
				 org.apache.batik.transcoder.print.*"
%><%
	String formUrl = System.getenv("FORM_URL");
	if (formUrl == null || formUrl.length() == 0)
	{
		formUrl = "/";
	}

	if (!request.getMethod().equalsIgnoreCase("post"))
	{
		//response.sendRedirect(formUrl);
		//return;
	}
%><html>
	<head>
		<title>SVG to PDF - FileFormat.Info</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="/css/light.css" />
		<link rel="canonical" href="https://svg2pdf.fileformat.info/" />
	</head>
	<body>
		<pre><%

	long start = System.currentTimeMillis();
	try
	{
		int width = 0;
		int height = 0;

		String sizeMethod = request.getParameter("size");
		if (sizeMethod == null || sizeMethod.length() == 0)
		{
			// shouldn't happen, will be handled below
		}
		else if (sizeMethod.equals("custom"))
		{
			width = Integer.parseInt(request.getParameter("width"));
			height = Integer.parseInt(request.getParameter("height"));
		}
		else
		{
			//LATER: parse
		}

		if (width <= 0)
		{
			width = 612;
		}

		if (height <= 0)
		{
			height = 792;
		}

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		Part p = request.getPart("stdin");
		if (p == null)
		{
			throw new Exception("No SVG file!");
		}
		out.println("INFO: upload SVG is " + p.getSize() + " bytes");
		InputStream stdin = p.getInputStream();

		//LATER: display input width/height

		out.println("INFO: output width=" + width);
		out.println("INFO: output height=" + height);

		com.lowagie.text.Document document = new com.lowagie.text.Document(new com.lowagie.text.Rectangle(width, height));
		PdfWriter writer = PdfWriter.getInstance(document,	baos);
		document.addCreator("http://www.fileformat.info/convert/image/svg2pdf.htm");
		document.open();
		PdfContentByte cb = writer.getDirectContent();
		cb.saveState();
		Graphics2D g2 = cb.createGraphics(width, height);
		PrintTranscoder prm = new PrintTranscoder();
		TranscoderInput ti = new TranscoderInput( stdin );
		prm.transcode(ti, null);
		PageFormat pg = new PageFormat();
		Paper pp = new Paper();
		pp.setSize(width, height);
		pp.setImageableArea(0, 0, width, height);
		pg.setPaper(pp);
		prm.print(g2, pg, 0);
		g2.dispose();
		cb.restoreState();
		document.close();

		byte[] output = baos.toByteArray();
		out.println("INFO: output PDF is " + output.length + " bytes");
		out.print("OUTPUT: <a href=\"data:application/pdf;base64,");
		out.print(Base64.getEncoder().encodeToString(output));
		out.println("\" download=\"output.pdf\">download</a>");
	}
	catch (Exception e)
	{
		out.println("ERROR: " + e.getMessage());
	}
	out.println("INFO: complete in " + (System.currentTimeMillis() - start) + " milliseconds");
	out.print("<a href=\"");
	out.print(formUrl);
	out.println("\">Return</a>");
%></pre>
	</body>
</html>
