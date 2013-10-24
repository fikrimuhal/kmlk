<!DOCTYPE html>
<html lang="en" ng-app="kimlik">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="layout" content="_none"/>

    <title>Kimlik.io</title>


    <r:require modules="bootstrap3,company,jquery"/>


    <r:layoutResources/>


    <style type="text/css">
    /* Sticky footer styles
    -------------------------------------------------- */

    html,
    body {
        height: 100%;
        /* The html and body elements cannot have any padding or margin. */
    }

    /* Wrapper for page content to push down footer */
    #wrap {
        min-height: 100%;
        height: auto !important;
        height: 100%;
        /* Negative indent footer by its height */
        margin: 0 auto -60px;
        /* Pad bottom by footer height */
        padding: 0 0 60px;
    }

    /* Set the fixed height of the footer here */
    #footer {
        height: 60px;
        background-color: #f5f5f5;
    }

    /* Custom page CSS
    -------------------------------------------------- */
    /* Not required for template or sticky footer method. */

    #wrap > .container {
        /*padding: 60px 15px 0;*/
    }

    #wrap > .container > .page-header {
        margin-top: 0px;
    }

    .container .credit {
        margin: 20px 0;
    }

    #footer > .container {
        padding-left: 15px;
        padding-right: 15px;
    }

    code {
        font-size: 80%;
    }
    </style>

    <script type="text/ng-template" id="_template/company.inline">

        <g:render template="/shared/nav"/>
         <div class="container">
            <div app-view-segment="1"></div>
        </div> <!-- /container -->
</script>

</head>

<body>
<div id="wrap">
    <div app-view-segment="0"></div>
</div>

<g:render template="/shared/footer"/>
<r:layoutResources/>

</body>
</html>
