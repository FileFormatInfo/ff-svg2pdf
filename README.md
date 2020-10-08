# SVG to PDF Converter [<img alt="FileFormat.Info logo" src="www/favicon.svg" height="90" align="right" />](https://svg2pdf.fileformat.info/)

This is a simple server that converts an SVG image to a PDF using [Apache Batik](http://pdfbox.apache.org/) and [iText](https://itextpdf.com/en)

You can try it from the [svg2pdf page ](http://www.fileformat.info/convert/image/svg2pdf.htm) on [FileFormat.Info](http://www.fileformat.info/).  Note that this is only for light, non-commercial use.  For other use, please run your own copy.

## Running your own copy

The code is deliberately simple to avoid external dependencies.  All necessary libraries are included.

The easiest way to run it is with the included super-simple Dockerfile.  See the [run.sh](run.sh) and [docker-run.sh](docker-run.sh) shell scripts to see how I run it in development and production.

The code should work on any recent Java web server.  There is nothing to compile: all the code is in the `.jsp` files.

Environment variables:

- `FORM_URL`: the full URL of a form that should be used instead of the form in index.jsp.  This will also trigger logging if it doesn't match the referrer.  If you are running it locally, don't set it and the home page will display a form instead of the "Try It" link.

## License

[GNU Affero General Public License v3.0](LICENSE.txt)

## Credits
[![Apache Batik](https://www.vectorlogo.zone/logos/apache_batik/apache_batik-ar21.svg)](https://xmlgraphics.apache.org/batik/ "SVG Rendering")
[![Docker](https://www.vectorlogo.zone/logos/docker/docker-ar21.svg)](https://www.docker.com/ "Containers")
[![Git](https://www.vectorlogo.zone/logos/git-scm/git-scm-ar21.svg)](https://git-scm.com/ "Version control")
[![Github/GithubActions](https://www.vectorlogo.zone/logos/github/github-ar21.svg)](https://github.com/ "Code hosting and Continuous Integration")
[![GoatCounter](https://www.vectorlogo.zone/logos/goatcounter/goatcounter-ar21.svg)](https://www.goatcounter.com/ "Traffic Measurement")
[![Google Cloud Run](https://www.vectorlogo.zone/logos/google_cloud_run/google_cloud_run-ar21.svg)](https://cloud.google.com/run/ "Hosting")
[![iText](https://www.vectorlogo.zone/logos/itextpdf/itextpdf-ar21.svg)](https://itextpdf.com/en "PDF Generation")
[![Java](https://www.vectorlogo.zone/logos/java/java-ar21.svg)](https://www.java.com/ "Programming Language")
[![Jetty](https://www.vectorlogo.zone/logos/eclipse_jetty/eclipse_jetty-ar21.svg)](https://www.eclipse.org/jetty/ "Web server")
[![water.css](https://www.vectorlogo.zone/logos/netlifyapp_watercss/netlifyapp_watercss-ar21.svg)](https://watercss.netlify.app/ "Classless CSS")

* [JSON Simple](https://github.com/fangyidong/json-simple)

## To Do

- size parameters
- maximum upload size
- deploy

- README: note about direct.pdf
- `Graphics2D from BufferedImage lacks BUFFERED_IMAGE hint`
- convert.jsp: more verbose logging
- link rel=canonical
- note about light, non-commercial use
- make a shared function for code in common between direct and convert
- ability to set margins
