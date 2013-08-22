<!-- Top navbar -->
<div class="navbar main">

<!-- Menu Toggle Button -->
<button type="button" class="btn btn-navbar pull-left visible-phone">
    <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
</button>
<!-- // Menu Toggle Button END -->


<!-- Full Top Style -->
<ul class="topnav pull-left">
    <li class="active"><a href="/dashboard" class="glyphicons dashboard"><i></i> Dashboard</a></li>


    <g:render template="/shared/flat/navbar/company"/>
    <g:render template="/shared/flat/navbar/pages"/>
</ul>
<!-- // Full Top Style END -->




<!-- Top Menu Right -->
<ul class="topnav pull-right hidden-phone">
    %{--<g:render template="/shared/flat/navbar/language"/>--}%
    <g:render template="/shared/flat/navbar/profile"/>
</ul>
<!-- // Top Menu Right END -->


<ul class="topnav pull-right hidden-phone">
    <li><a href="" class="glyphicons envelope single-icon"><i></i><span class="badge fix badge-primary">5</span></a>
    </li>
    <li><a href="" class="glyphicons cup single-icon"><i></i><span class="badge fix badge-primary">7</span></a></li>
    <li class="hidden-tablet"><a href="" class="glyphicons comments single-icon"><i></i><span
            class="badge fix badge-primary">3</span></a></li>
</ul>

<div class="clearfix"></div>

</div>
<!-- Top navbar END -->
