<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="fragment" content="!">%{--https://developers.google.com/webmasters/ajax-crawling/docs/specification?csw=1--}%
    <style type="text/css"> body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,p,blockquote,th,td{margin:0;padding:0}table{border-collapse:collapse;border-spacing:0}fieldset,img{border:0}address,caption,cite,code,dfn,em,strong,th,var{font-style:normal;font-weight:normal}ol,ul{list-style:none}caption,th{text-align:left}h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:normal}q:before,q:after{content:''}abbr,acronym{border:0}html,body,iframe{height:100%;width:100%;background-color:transparent;border:0 none transparent;padding:0;overflow:hidden}</style>
</head><body>
<iframe id="mainFrame" seamless="seamless" src="${url}"></iframe>
<g:if test="${googleAnalytics}">
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', '${googleAnalytics}', '${ga_domain}');
    ga('send', 'pageview');
</script>
</g:if>
</body></html>