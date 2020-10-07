<%@ page contentType="application/pdf"
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

	//LATER: referrer check

	if (!request.getMethod().equalsIgnoreCase("post"))
	{
		//response.sendRedirect(formUrl);
		//return;
	}

	int width = 0;
	int height = 0;

	String sizeMethod = request.getParameter("sizemethod");
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
		String paper = request.getParameter("paper");
		//LATER: parse
	}

	if (width <= 0)
	{
		width = 756;
	}

	if (height <= 0)
	{
		height = 1188;
	}

	ByteArrayOutputStream baos = new ByteArrayOutputStream();
	Part p = request.getPart("stdin");
	if (p == null)
	{
		throw new Exception("No SVG file!");
	}
	InputStream stdin = p.getInputStream();

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
	response.reset();

	OutputStream os = response.getOutputStream();
	os.write(output);
	os.close();
	if (1 == 1) // otherwise it won't compile with 'unreachable code'
	{
		// otherwise jsp stuff throws an exception when it messes with the outputstream
		return;
	}
%>
