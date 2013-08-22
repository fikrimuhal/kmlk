<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>

<g:render template="/shared/comps/innerSearch"/>


<h1>Dashboard</h1>

<g:render template="/shared/comps/statsWidget"/>

<g:render template="/shared/comps/3divRow"/>
<g:render template="/shared/comps/webSiteTraffic"/>


<p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

<div class="innerLR innerB">

    <div class="row-fluid">
        <div class="span9 tablet-column-reset">

            <g:render template="/shared/comps/span9/timeline"/>
            <p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

            <g:render template="/shared/comps/span9/employee-directory"/>
            <p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

            <g:render template="/shared/comps/span9/recent-activity"/>
            <p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

            <g:render template="/shared/comps/span9/carousel"/>

            <g:render template="/shared/comps/span9/special-offers"/>
            <p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

            <g:render template="/shared/comps/span9/chat"/>

        </div>

        <div class="span3 tablet-column-reset">

            <h2 class="margin-none separator bottom"><i
                    class="icon-external-link-sign icon-fixed-width text-primary"></i>Statistics</h2>

            <g:render template="/shared/comps/span3/roi"/>
            <div class="separator bottom"></div>

            <g:render template="/shared/comps/span3/serverWorkLoad"/>
            <div class="separator bottom"></div>

            <g:render template="/shared/comps/span3/visits"/>
            <p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

            <g:render template="/shared/comps/span3/activity"/>

            <g:render template="/shared/comps/span3/last-orders"/>

            <g:render template="/shared/comps/span3/notes"/>

            <g:render template="/shared/comps/span3/alert"/>

            <g:render template="/shared/comps/span3/twitter"/>
        </div>

    </div>

</div>

</body>
</html>
