

	



<c:import var="fetched_preview_html" url="http://localhost:4200/dashboard" />
<%
String html = pageContext.getAttribute("fetched_preview_html").toString();
%>
<c:import var="fetched_preview_html" url="http://localhost:4200/inline.bundle.js" />
<%
String inline = pageContext.getAttribute("fetched_preview_html").toString();
%>
<c:import var="fetched_preview_html" url="http://localhost:4200/polyfills.bundle.js" />
<%
String polyfills = pageContext.getAttribute("fetched_preview_html").toString();
%>
<c:import var="fetched_preview_html" url="http://localhost:4200/styles.bundle.js" />
<%
String styles = pageContext.getAttribute("fetched_preview_html").toString();
%>
<c:import var="fetched_preview_html" url="http://localhost:4200/vendor.bundle.js" />
<%
String vendor = pageContext.getAttribute("fetched_preview_html").toString();
%>
<c:import var="fetched_preview_html" url="http://localhost:4200/main.bundle.js" />
<%
String main = pageContext.getAttribute("fetched_preview_html").toString();
main = main.replaceAll("<!-- dashboard -->(?s:.)*<!-- dashboard-end -->", "<!-- dashboard --> <h3>Top Heroes - New Title </h3> <div class=\\\\\"grid grid-pad\\\\\"> <a *ngFor=\\\\\"let hero of heroes\\\\\" [routerLink]=\\\\\"['/detail', hero.id]\\\\\" class=\\\\\"col-1-4\\\\\"> <div class=\\\\\"module hero\\\\\"> <h4>{{hero.name}}</h4> </div> </a> </div> <hero-search></hero-search> <!-- dashboard-end -->");
%>
<%
html = html.replaceAll("<!-- base -->(?s:.)*<!-- base-stop -->", "<base href=\\\"http://127.0.0.1:4200\\\">");
inline = "<script>" + inline + "</script>";
html = html.replace("<script type=\"text/javascript\" src=\"inline.bundle.js\"></script>", inline );
polyfills = "<script>" + polyfills + "</script>";
html = html.replace("<script type=\"text/javascript\" src=\"polyfills.bundle.js\"></script>", polyfills);
styles = "<script>" + styles + "</script>";
html = html.replace("<script type=\"text/javascript\" src=\"styles.bundle.js\"></script>", styles);
vendor = "<script>" + vendor + "</script>";
html = html.replace("<script type=\"text/javascript\" src=\"vendor.bundle.js\"></script>", vendor );
main = "<script>" + "// test test \n" + main + "</script>";
html = html.replace("<script type=\"text/javascript\" src=\"main.bundle.js\"></script>", main);
html = html.replaceAll("(\")/on/demandware.static/", "\\\"https://dev05-direct-carters.demandware.net/on/demandware.static/");
html = html.replaceAll("(<!-- dw.+?-->)", "");
html = html.replaceAll("(<!-- Demandware Analytics)(?s:.)*(</script>)", "");
html = html.replaceAll("<!-- CMS_antiClickJack_START -->(?s:.)*<!-- CMS_antiClickJack_END -->", "");
out.print(html);
%>
