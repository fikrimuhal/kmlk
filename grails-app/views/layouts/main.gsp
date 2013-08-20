<!DOCTYPE html>
<!--[if lt IE 7]> <html class="ie lt-ie9 lt-ie8 lt-ie7 fluid top-full menuh-top"> <![endif]-->
<!--[if IE 7]>    <html class="ie lt-ie9 lt-ie8 fluid top-full menuh-top"> <![endif]-->
<!--[if IE 8]>    <html class="ie lt-ie9 fluid top-full menuh-top"> <![endif]-->
<!--[if gt IE 8]> <html class="animations ie gt-ie8 fluid top-full menuh-top"> <![endif]-->
<!--[if !IE]><!--><html class="animations fluid top-full menuh-top"><!-- <![endif]-->
<head>
    <title>FLAT KIT (v1.2.0)</title>

    <!-- Meta -->
    <meta charset="UTF-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>

    <!-- Bootstrap -->
    <link href="/common/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="/common/bootstrap/css/responsive.css" rel="stylesheet" type="text/css"/>

    <!-- Glyphicons Font Icons -->
    <link href="/common/theme/fonts/glyphicons/css/glyphicons.css" rel="stylesheet"/>

    <link rel="stylesheet" href="/common/theme/fonts/font-awesome/css/font-awesome.min.css">
    <!--[if IE 7]><link rel="stylesheet" href="/common/theme/fonts/font-awesome/css/font-awesome-ie7.min.css"><![endif]-->

    <!-- Uniform Pretty Checkboxes -->
    <link href="/common/theme/scripts/plugins/forms/pixelmatrix-uniform/css/uniform.default.css" rel="stylesheet"/>

    <!-- PrettyPhoto -->
    <link href="/common/theme/scripts/plugins/gallery/prettyphoto/css/prettyPhoto.css" rel="stylesheet"/>

    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="/common/theme/scripts/plugins/system/html5shiv.js"></script>
    <![endif]-->

    <!--[if IE]><!--><script src="/common/theme/scripts/plugins/other/excanvas/excanvas.js"></script><!--<![endif]-->
<!--[if lt IE 8]><script src="/common/theme/scripts/plugins/other/json2.js"></script><![endif]-->

<!-- Bootstrap Extended -->
    <link href="/common/bootstrap/extend/jasny-fileupload/css/fileupload.css" rel="stylesheet">
    <link href="/common/bootstrap/extend/bootstrap-wysihtml5/css/bootstrap-wysihtml5-0.0.2.css" rel="stylesheet">
    <link href="/common/bootstrap/extend/bootstrap-select/bootstrap-select.css" rel="stylesheet"/>
    <link href="/common/bootstrap/extend/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css"
          rel="stylesheet"/>

    <!-- DateTimePicker Plugin -->
    <link href="/common/theme/scripts/plugins/forms/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet"/>

    <!-- JQueryUI -->
    <link href="/common/theme/scripts/plugins/system/jquery-ui/css/smoothness/jquery-ui-1.9.2.custom.min.css"
          rel="stylesheet"/>

    <!-- MiniColors ColorPicker Plugin -->
    <link href="/common/theme/scripts/plugins/color/jquery-miniColors/jquery.miniColors.css" rel="stylesheet"/>

    <!-- Notyfy Notifications Plugin -->
    <link href="/common/theme/scripts/plugins/notifications/notyfy/jquery.notyfy.css" rel="stylesheet"/>
    <link href="/common/theme/scripts/plugins/notifications/notyfy/themes/default.css" rel="stylesheet"/>

    <!-- Gritter Notifications Plugin -->
    <link href="/common/theme/scripts/plugins/notifications/Gritter/css/jquery.gritter.css" rel="stylesheet"/>

    <!-- Easy-pie Plugin -->
    <link href="/common/theme/scripts/plugins/charts/easy-pie/jquery.easy-pie-chart.css" rel="stylesheet"/>

    <!-- Google Code Prettify Plugin -->
    <link href="/common/theme/scripts/plugins/other/google-code-prettify/prettify.css" rel="stylesheet"/>

    <!-- Select2 Plugin -->
    <link href="/common/theme/scripts/plugins/forms/select2/select2.css" rel="stylesheet"/>

    <!-- Pageguide Guided Tour Plugin -->
    <!--[if gt IE 8]><!--><link media="screen" href="/common/theme/scripts/plugins/other/pageguide/css/pageguide.css"
                                rel="stylesheet"/><!--<![endif]-->

<!-- Bootstrap Image Gallery -->
    <link href="/common/bootstrap/extend/bootstrap-image-gallery/css/bootstrap-image-gallery.min.css" rel="stylesheet"/>

    <!-- Main Theme Stylesheet :: CSS -->
    <link href="/common/theme/css/style-default-menus-dark.css?1374506511" rel="stylesheet" type="text/css"/>


    <!-- FireBug Lite -->
    <!-- <script src="https://getfirebug.com/firebug-lite-debug.js"></script> -->

    <!-- LESS.js Library -->
    <script src="/common/theme/scripts/plugins/system/less.min.js"></script>

    <!-- Global -->
    <script>
        //<![CDATA[
        var basePath = '',
                commonPath = '/common/';

        // colors
        var primaryColor = '#e5412d',
                dangerColor = '#b55151',
                successColor = '#609450',
                warningColor = '#ab7a4b',
                inverseColor = '#45484d';

        var themerPrimaryColor = primaryColor;
        //]]>
    </script>
</head>

<body class="document-body ">

<!-- Main Container Fluid -->
<div class="container-fluid menu-hidden sidebar-hidden-phone fluid menu-left">

<!-- Content -->
<div id="content">

<!-- Top navbar -->
<div class="navbar main">

<!-- Menu Toggle Button -->
<button type="button" class="btn btn-navbar pull-left visible-phone">
    <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
</button>
<!-- // Menu Toggle Button END -->

<!-- Not Blank page -->

<!-- Full Top Style -->
<ul class="topnav pull-left">
    <li class="active"><a
            href="index.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
            class="glyphicons dashboard"><i></i> Dashboard</a></li>
    <li class="dropdown dd-1">
        <a href="" data-toggle="dropdown" class="glyphicons settings"><i></i>Components <span class="caret"></span></a>
        <ul class="dropdown-menu pull-left">

            <!-- Components Submenu Level 2 -->
            <li class="dropdown submenu">
                <a data-toggle="dropdown" class="dropdown-toggle">Forms</a>
                <ul class="dropdown-menu submenu-show submenu-hide pull-right">
                    <li class=""><a
                            href="form_wizards.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Form Wizards</a>
                    </li>
                    <li class=""><a
                            href="form_elements.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Form Elements</a>
                    </li>
                    <li class=""><a
                            href="form_validator.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Form Validator</a>
                    </li>
                    <li class=""><a
                            href="file_managers.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">File Managers</a>
                    </li>
                </ul>
            </li>
            <!-- // Components Submenu Level 2 END -->

            <li class="dropdown submenu">
                <a data-toggle="dropdown" class="dropdown-toggle">Tables</a>
                <ul class="dropdown-menu submenu-show submenu-hide pull-right">
                    <li class=""><a
                            href="tables.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Tables</a>
                    </li>
                    <li class=""><a
                            href="tables_responsive.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Responsive Tables</a>
                    </li>
                    <li class=""><a
                            href="pricing_tables.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Pricing tables</a>
                    </li>
                </ul>
            </li>

            <!-- Components Submenu Regular Items -->
            <li class=""><a
                    href="ui.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">UI Elements</a>
            </li>
            <li class=""><a
                    href="icons.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Icons</a>
            </li>
            <li class=""><a
                    href="widgets.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Widgets</a>
            </li>
            <li class=""><a
                    href="tabs.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Tabs</a>
            </li>
            <li class=""><a
                    href="sliders.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Sliders</a>
            </li>
            <li class=""><a
                    href="charts.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Charts</a>
            </li>
            <li class=""><a
                    href="grid.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Grid system</a>
            </li>
            <li class=""><a
                    href="notifications.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Notifications</a>
            </li>
            <li class=""><a
                    href="modals.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Modals</a>
            </li>
            <li class=""><a
                    href="thumbnails.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Thumbnails</a>
            </li>
            <li class=""><a
                    href="carousels.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Carousels</a>
            </li>
            <li class=""><a
                    href="image_crop.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Image Cropping</a>
            </li>
            <li class=""><a
                    href="tour.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Page Tour</a>
            </li>

            <li class="dropdown submenu">
                <a data-toggle="dropdown" class="dropdown-toggle">APIs</a>
                <ul class="dropdown-menu submenu-show submenu-hide pull-right">
                    <li class=""><a
                            href="twitter.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Twitter API</a>
                    </li>
                    <li class=""><a
                            href="google_analytics.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Google Analytics API</a>
                    </li>
                </ul>
            </li>

            <li class=""><a
                    href="infinite_scroll.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Infinite Scroll</a>
            </li>
            <!-- // Components Submenu Regular Items END -->

            <li class="dropdown submenu">
                <a data-toggle="dropdown" class="dropdown-toggle glyphicons circle_info"><i></i>4 Level Menu</a>
                <ul class="dropdown-menu submenu-show submenu-hide pull-right">
                    <li class="dropdown submenu">
                        <a data-toggle="dropdown" href="#" class="dropdown-toggle">Menu item</a>
                        <ul class="dropdown-menu submenu-show submenu-hide pull-right">
                            <li><a href="#">Menu item</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
    <li class="dropdown dd-1">
        <a href="" data-toggle="dropdown" class="glyphicons notes"><i></i>Pages <span class="caret"></span></a>
        <ul class="dropdown-menu pull-left">

            <li><a href="timeline.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons history"><i></i>Timeline</a></li>
            <li><a href="employees.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons group"><i></i>Employees</a></li>


            <li><a href="invoice.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons credit_card"><i></i>Invoice</a></li>
            <li><a href="faq.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons circle_question_mark"><i></i>FAQ</a></li>
            <li><a href="search.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons search"><i></i>Search</a></li>
            <li><a href="ratings.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons star"><i></i>Ratings</a></li>

            <li class="dropdown submenu">
                <a data-toggle="dropdown" class="dropdown-toggle glyphicons user"><i></i>Account</a>
                <ul class="dropdown-menu submenu-show submenu-hide pull-right">
                    <li class=""><a
                            href="my_account_advanced.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Advanced profile</a>
                    </li>
                    <li class=""><a
                            href="my_account.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">My Account</a>
                    </li>
                    <li><a href="login.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"><i></i>Login
                    </a></li>
                    <li><a href="signup.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"><i></i>Register
                    </a></li>
                </ul>
            </li>
            <li class="dropdown submenu">
                <a data-toggle="dropdown" class="dropdown-toggle glyphicons google_maps"><i></i>Maps</a>
                <ul class="dropdown-menu submenu-show submenu-hide pull-right">
                    <li class=""><a class="no-ajaxify"
                                    href="maps_vector.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Vector maps</a>
                    </li>
                    <li class=""><a class="no-ajaxify"
                                    href="maps_google.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Google maps</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown submenu">
                <a data-toggle="dropdown" class="dropdown-toggle glyphicons shopping_cart"><i></i>Online Shop</a>
                <ul class="dropdown-menu submenu-show submenu-hide pull-right">
                    <li class=""><a
                            href="shop_products.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Products</a>
                    </li>
                    <li class=""><a
                            href="shop_edit_product.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Add product</a>
                    </li>
                    <li class=""><a
                            href="shop_orders_timeline.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Orders Timeline</a>
                    </li>
                </ul>
            </li>
            <li><a href="typography.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons font"><i></i>Typography</a></li>
            <li><a href="gallery.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons picture"><i></i>Photo Gallery</a></li>
            <li><a href="calendar.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons calendar"><i></i>Calendar</a></li>
            <li><a href="bookings.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons user_add"><i></i>Bookings</a></li>
            <li><a href="finances.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons coins"><i></i>Finances</a></li>
            <li><a href="error.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons warning_sign"><i></i>Error page</a></li>
            <li><a href="blank.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons magic"><i></i>Blank page</a></li>
        </ul>
    </li>
    <li class="mega-menu">
        <a href="#" class="glyphicons sheriffs_star"><i></i> Mega menu</a>

        <div class="mega-sub">
            <div class="mega-sub-inner">
                <div class="row-fluid">
                    <div class="span2">
                        <h4><i class="icon-book icon-fixed-width text-primary"></i> Learning</h4>
                        <ul class="icons-ul">
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Catch the Bullet</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Snoopydoo</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Fallen Angel</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Sui Maker</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Wave Master</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Golf Pro</a></li>
                        </ul>
                    </div>

                    <div class="span2">
                        <h4><i class="icon-wrench icon-fixed-width text-primary"></i> Utilities</h4>
                        <ul class="icons-ul">
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Gadget Finder</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Green Tree Express</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Green Tree Pro</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Wobbler 3.0</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Coolkid</a></li>
                        </ul>
                    </div>

                    <div class="span3">
                        <h4><i class="icon-android icon-fixed-width text-primary"></i> Education</h4>
                        <ul class="icons-ul">
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Learn Thai</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Math Genius</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Chemokid</a></li>
                        </ul>
                        <h4><i class="icon-apple icon-fixed-width text-primary"></i> Professionals</h4>
                        <ul class="icons-ul">
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Success 1.0</a></li>
                            <li><a href="#"><span class="icon-li icon-arrow-right"></span> Moneymaker</a></li>
                        </ul>
                    </div>

                    <div class="span5">
                        <div class="innerTB innerR">
                            <div class="glyphicons glyphicon-xlarge glyphicon-top sheriffs_star glyphicon-primary">
                                <i></i>
                                <h4>Support for any type of content</h4>

                                <p class="margin-none">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                                    <br> <a href="">learn more</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /cbp-hrsub-inner -->
        </div><!-- /cbp-hrsub -->
    </li>
</ul>
<!-- // Full Top Style END -->

<!-- // Not Blank Page END -->


<!-- Top Menu Right -->
<ul class="topnav pull-right hidden-phone">

    <!-- Themer -->
    <li><a href="#themer" data-toggle="collapse" class="glyphicons eyedropper single-icon"><i></i></a></li>
    <!-- // Themer END -->

    <!-- Language menu -->
    <li class="hidden-phone dropdown dd-1 dd-flags" id="lang_nav">
        <a href="#" data-toggle="dropdown"><img src="/common/theme/images/lang/en.png" alt="en"/></a>
        <ul class="dropdown-menu pull-right">
            <li class="active"><a
                    href="?module=admin&amp;page=index&amp;url_rewrite=&amp;layout_type=fluid&amp;sidebar=false&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;lang=en"
                    title="English"><img src="/common/theme/images/lang/en.png" alt="English"> English</a></li>
            <li><a href="?module=admin&amp;page=index&amp;url_rewrite=&amp;layout_type=fluid&amp;sidebar=false&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;lang=ro"
                   title="Romanian"><img src="/common/theme/images/lang/ro.png" alt="Romanian"> Romanian</a></li>
            <li><a href="?module=admin&amp;page=index&amp;url_rewrite=&amp;layout_type=fluid&amp;sidebar=false&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;lang=it"
                   title="Italian"><img src="/common/theme/images/lang/it.png" alt="Italian"> Italian</a></li>
            <li><a href="?module=admin&amp;page=index&amp;url_rewrite=&amp;layout_type=fluid&amp;sidebar=false&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;lang=fr"
                   title="French"><img src="/common/theme/images/lang/fr.png" alt="French"> French</a></li>
            <li><a href="?module=admin&amp;page=index&amp;url_rewrite=&amp;layout_type=fluid&amp;sidebar=false&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;lang=pl"
                   title="Polish"><img src="/common/theme/images/lang/pl.png" alt="Polish"> Polish</a></li>
        </ul>
    </li>
    <!-- // Language menu END -->

    <!-- Profile / Logout menu -->
    <li class="account dropdown dd-1">
        <a data-toggle="dropdown"
           href="my_account_advanced.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
           class="glyphicons logout lock"><span
                class="hidden-tablet hidden-phone hidden-desktop-1">mosaicpro</span><i></i></a>
        <ul class="dropdown-menu pull-right">
            <li><a href="my_account_advanced.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons cogwheel">Settings<i></i></a></li>
            <li><a href="my_account_advanced.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                   class="glyphicons camera">My Photos<i></i></a></li>
            <li class="profile">
                <span>
                    <span class="heading">Profile <a
                            href="my_account_advanced.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                            class="pull-right text-primary text-weight-regular">edit</a></span>
                    <a href="my_account_advanced.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                       class="img thumb">
                        <img data-src="holder.js/51x51/dark" alt="Avatar"/>
                    </a>
                    <span class="details">
                        <a href="my_account_advanced.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
                           class="strong text-regular">Mosaic Pro</a>
                        contact@mosaicpro.biz
                    </span>
                    <span class="clearfix"></span>
                </span>
            </li>
            <li>
                <span>
                    <a class="btn btn-default btn-mini pull-right"
                       href="login.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false">Sign Out</a>
                </span>
            </li>
        </ul>
    </li>
    <!-- // Profile / Logout menu END -->

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

<div class="innerLR innerT">
    <div class="widget-search form-inline">
        <button type="button" class="btn btn-primary pull-right">Search <i class="icon-search"></i></button>

        <div class="overflow-hidden">
            <input type="text" value="" placeholder="Type your keywords ..">
        </div>
    </div>
</div>

<h1>Dashboard</h1>

<!-- Stats Widgets -->
<div class="row-fluid row-merge border-top">

    <div class="span3">
        <div class="innerAll padding-bottom-none-phone">
            <a href="" class="widget-stats widget-stats-default widget-stats-4">
                <span class="txt">Ratings</span>
                <span class="count">4.3</span>
                <span class="glyphicons cup"><i></i></span>

                <div class="clearfix"></div>
                <i class="icon-play-circle"></i>
            </a>
        </div>
    </div>

    <div class="span3">
        <div class="innerAll padding-bottom-none-phone">
            <a href="" class="widget-stats widget-stats-primary widget-stats-4">
                <span class="txt">Progress</span>
                <span class="count">58%</span>
                <span class="glyphicons refresh"><i></i></span>

                <div class="clearfix"></div>
                <i class="icon-play-circle"></i>
            </a>
        </div>
    </div>

    <div class="span3">
        <div class="innerAll padding-bottom-none-phone">
            <a href="" class="widget-stats widget-stats-gray widget-stats-4">
                <span class="txt">Signups</span>
                <span class="count">3<span>Today</span></span>
                <span class="glyphicons user"><i></i></span>

                <div class="clearfix"></div>
                <i class="icon-play-circle"></i>
            </a>
        </div>
    </div>

    <div class="span3">
        <div class="innerAll padding-bottom-none-phone">
            <a href="" class="widget-stats widget-stats-2">
                <span class="count">30</span>
                <span class="txt">Bookings</span>
            </a>
        </div>
    </div>
</div>
<!-- // Stats Widgets END -->

<div class="row-fluid row-merge border-bottom">
    <div class="span4">
        <div class="widget widget-heading-simple widget-body-white widget-flat">
            <div class="widget-body">
                <div class="glyphicons glyphicon-top display">
                    <i></i>
                    <h4>Large Top Icons</h4>

                    <p class="margin-none">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                        <br> <a href=""><span class="text-underline">learn more</span> <span
                            class="icon-circle-arrow-right"></span></a></p>
                </div>
            </div>
        </div>
    </div>

    <div class="span4 fill-column">
        <div class="widget widget-heading-simple widget-body-gray margin-none widget-flat">
            <div class="widget-body">
                <h4 class="strong"><i class="icon-user text-primary icon-fixed-width"></i> Uber Friendly</h4>

                <div class="separator bottom"></div>

                <div class="glyphicons glyphicon-xlarge user hidden-tablet-partial">
                    <i class="hidden-tablet"></i>
                    <h4>Gray Background</h4>

                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.
                        <br> <a href=""><span class="text-underline">learn more</span> <span
                            class="icon-circle-arrow-right"></span></a></p>
                </div>
            </div>
        </div>
    </div>

    <div class="span4">
        <div class="innerAll">
            <h4 class="strong separator bottom"><i class="icon-bolt text-primary icon-fixed-width"></i> Spectacular</h4>
            <table class="table table-striped table-condensed table-borderless">
                <tbody>
                <tr>
                    <td>5 Orders</td>
                    <td>3 Bookings</td>
                    <td>7 Signups</td>
                </tr>
                <tr>
                    <td>5 Orders</td>
                    <td>3 Bookings</td>
                    <td>7 Signups</td>
                </tr>
                <tr>
                    <td>5 Orders</td>
                    <td>3 Bookings</td>
                    <td>7 Signups</td>
                </tr>
                </tbody>
            </table>
            <a href=""><span class="text-underline">view all</span> <i class="icon-circle-arrow-right"></i></a>
        </div>
    </div>
</div>

<div class="heading-buttons">
    <h2 class="heading pull-left"><i class="icon-bar-chart icon-fixed-width text-primary"></i> Website Traffic</h2>

    <div class="buttons">
        <a href="google_analytics.html?lang=en&amp;layout_type=fluid&amp;style=style-default-menus-dark&amp;top-sticky=false&amp;sidebar=false"
           class="btn btn-primary">Google Analytics API</a>
    </div>

    <div class="clearfix"></div>
</div>

<div class="innerLR innerT">

    <!-- Website Traffic Chart -->
    <div class="widget widget-body-gray">
        <div class="widget-body">
            <div id="chart_simple" style="height: 253px;"></div>
        </div>
    </div>
    <!-- // Website Traffic Chart END -->

</div>

<p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

<div class="innerLR innerB">

<div class="row-fluid">
<div class="span9 tablet-column-reset">

<h2 class="margin-none separator bottom"><i class="icon-sitemap text-primary icon-fixed-width"></i> Timeline</h2>

<div class="relativeWrap overflow-hidden">
    <div class="row-fluid row-merge border-bottom border-top layout-timeline layout-timeline-mirror">
        <div class="span6"></div>

        <div class="span6">
            <div class="innerAll">

                <ul class="timeline">
                    <li class="active">
                        <div class="separator bottom">
                            <span class="date box-generic">Now</span>
                            <span class="type glyphicons suitcase">Task <i></i><span class="time">08:00</span></span>
                            <button type="button"
                                    class="glyphicons circle_plus btn btn-primary btn-icon btn-small"><i></i>Add event
                            </button>
                        </div>

                        <div class="widget widget-heading-simple widget-body-white margin-none">
                            <div class="widget-body">
                                <div class="media">
                                    <div class="media-object pull-left thumb"><img data-src="holder.js/51x51/dark"
                                                                                   alt="Image"/></div>

                                    <div class="media-body">
                                        <a class="author">Adrian Demian</a><br/>
                                        <span class="muted">adrian@ennovation.ie</span>
                                    </div>
                                </div>

                                <div class="alert alert-gray">
                                    <p class="glyphicons circle_info margin-none"><i></i> Added a new milestone named <a
                                            href="">MosaicPro</a></p>
                                </div>
                                <a class="glyphicons single pencil"><i></i></a>
                            </div>
                        </div>
                    </li>
                    <li class="active">
                        <span class="type glyphicons comments">Comment <i></i><span class="time">11:00</span></span>

                        <div class="widget widget-heading-simple widget-body-white margin-none">
                            <div class="widget-body">
                                <p class="glyphicons user margin-none"><i></i> <strong><a href="">MosaicPro</a> said
                                </strong>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an ...
                                </p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="separator">
                            <span class="date box-generic"><strong>27</strong>may</span>
                            <span class="type glyphicons picture">Photo <i></i><span class="time">08:00</span></span>
                        </div>

                        <div class="widget widget-heading-simple widget-body-white margin-none">
                            <div class="widget-body">
                                <div class="media">
                                    <div class="media-object pull-left thumb"><img data-src="holder.js/51x51/dark"
                                                                                   alt="Image"/></div>

                                    <div class="media-body">
                                        <a class="author">Adrian Demian</a><br/>
                                        <span class="muted">adrian@ennovation.ie</span>
                                    </div>
                                </div>

                                <div class="alert alert-gray">
                                    <p class="glyphicons circle_info"><i></i> Added photos to the album <a
                                            href="">MosaicPro</a></p>

                                    <!-- Gallery Layout -->
                                    <div class="gallery gallery-2">
                                        <ul class="row-fluid" data-toggle="modal-gallery" data-target="#modal-gallery"
                                            id="gallery-4" data-delegate="#gallery-4">
                                            <li class="span2 hidden-phone"><a class="thumb"
                                                                              href="/common/theme/images/gallery-2/6.jpg"
                                                                              data-gallery="gallery"><img
                                                        src="/common/theme/images/gallery-2/6.jpg" alt="photo"/></a>
                                            </li>
                                            <li class="span2 hidden-phone"><a class="thumb"
                                                                              href="/common/theme/images/gallery-2/5.jpg"
                                                                              data-gallery="gallery"><img
                                                        src="/common/theme/images/gallery-2/5.jpg" alt="photo"/></a>
                                            </li>
                                            <li class="span2 hidden-phone"><a class="thumb"
                                                                              href="/common/theme/images/gallery-2/4.jpg"
                                                                              data-gallery="gallery"><img
                                                        src="/common/theme/images/gallery-2/4.jpg" alt="photo"/></a>
                                            </li>
                                            <li class="span2"><a class="thumb"
                                                                 href="/common/theme/images/gallery-2/3.jpg"
                                                                 data-gallery="gallery"><img
                                                        src="/common/theme/images/gallery-2/3.jpg" alt="photo"/></a>
                                            </li>
                                            <li class="span2"><a class="thumb"
                                                                 href="/common/theme/images/gallery-2/2.jpg"
                                                                 data-gallery="gallery"><img
                                                        src="/common/theme/images/gallery-2/2.jpg" alt="photo"/></a>
                                            </li>
                                            <li class="span2"><a class="thumb"
                                                                 href="/common/theme/images/gallery-2/1.jpg"
                                                                 data-gallery="gallery"><img
                                                        src="/common/theme/images/gallery-2/1.jpg" alt="photo"/></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- // Gallery Layout END -->

                                </div>
                                <a class="glyphicons single pencil"><i></i></a>
                            </div>
                        </div>
                    </li>
                </ul>

            </div>
        </div>
    </div>
</div>

<div class="separator bottom"></div>

<p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

<!-- Widget -->
<h2 class="margin-none separator bottom"><i class="icon-group text-primary icon-fixed-width"></i> Employee Directory
</h2>

<div class="widget widget-heading-simple widget-body-gray widget-employees">
<div class="widget-body padding-none">

<div class="row-fluid row-merge">
<div class="span4 listWrapper">
    <div class="innerAll">
        <form autocomplete="off" class="form-inline">
            <div class="widget-search separator bottom">
                <button type="button" class="btn btn-default pull-right"><i class="icon-search"></i></button>

                <div class="overflow-hidden">
                    <input type="text" value="" placeholder="Find someone ..">
                </div>
            </div>
            <select style="width: 100%;">
                <optgroup label="Department">
                    <option value="design">Design</option>
                    <option value="development">Development</option>
                </optgroup>
            </select>
        </form>
    </div>
    <span class="results">1490 Employees Found <i class="icon-circle-arrow-down"></i></span>
    <ul class="list unstyled">
        <li>
            <div class="media innerAll">
                <div class="media-object pull-left thumb hidden-phone"><img data-src="holder.js/51x51/dark"
                                                                            alt="Image"/></div>

                <div class="media-body">
                    <span class="strong">Adrian Demian</span>
                    <span class="muted">contact@mosaicpro.biz</span>
                    <i class="icon-envelope"></i>
                    <i class="icon-phone"></i>
                    <i class="icon-skype"></i>
                </div>
            </div>
        </li>
        <li class="active">
            <div class="media innerAll">
                <div class="media-object pull-left thumb hidden-phone"><img data-src="holder.js/51x51/dark"
                                                                            alt="Image"/></div>

                <div class="media-body">
                    <span class="strong">Adrian Demian</span>
                    <span class="muted">contact@mosaicpro.biz</span>
                    <i class="icon-envelope"></i>
                    <i class="icon-phone"></i>
                    <i class="icon-skype"></i>
                </div>
            </div>
        </li>
        <li>
            <div class="media innerAll">
                <div class="media-object pull-left thumb hidden-phone"><img data-src="holder.js/51x51/dark"
                                                                            alt="Image"/></div>

                <div class="media-body">
                    <span class="strong">Adrian Demian</span>
                    <span class="muted">contact@mosaicpro.biz</span>
                    <i class="icon-envelope"></i>
                    <i class="icon-phone"></i>
                    <i class="icon-skype"></i>
                </div>
            </div>
        </li>
        <li>
            <div class="media innerAll">
                <div class="media-object pull-left thumb hidden-phone"><img data-src="holder.js/51x51/dark"
                                                                            alt="Image"/></div>

                <div class="media-body">
                    <span class="strong">Adrian Demian</span>
                    <span class="muted">contact@mosaicpro.biz</span>
                    <i class="icon-envelope"></i>
                    <i class="icon-phone"></i>
                    <i class="icon-skype"></i>
                </div>
            </div>
        </li>
        <li>
            <div class="media innerAll">
                <div class="media-object pull-left thumb hidden-phone"><img data-src="holder.js/51x51/dark"
                                                                            alt="Image"/></div>

                <div class="media-body">
                    <span class="strong">Adrian Demian</span>
                    <span class="muted">contact@mosaicpro.biz</span>
                    <i class="icon-envelope"></i>
                    <i class="icon-phone"></i>
                    <i class="icon-skype"></i>
                </div>
            </div>
        </li>
        <li>
            <div class="media innerAll">
                <div class="media-object pull-left thumb hidden-phone"><img data-src="holder.js/51x51/dark"
                                                                            alt="Image"/></div>

                <div class="media-body">
                    <span class="strong">Adrian Demian</span>
                    <span class="muted">contact@mosaicpro.biz</span>
                    <i class="icon-envelope"></i>
                    <i class="icon-phone"></i>
                    <i class="icon-skype"></i>
                </div>
            </div>
        </li>
        <li>
            <div class="media innerAll">
                <div class="media-object pull-left thumb hidden-phone"><img data-src="holder.js/51x51/dark"
                                                                            alt="Image"/></div>

                <div class="media-body">
                    <span class="strong">Adrian Demian</span>
                    <span class="muted">contact@mosaicpro.biz</span>
                    <i class="icon-envelope"></i>
                    <i class="icon-phone"></i>
                    <i class="icon-skype"></i>
                </div>
            </div>
        </li>
        <li>
            <div class="media innerAll">
                <div class="media-object pull-left thumb hidden-phone"><img data-src="holder.js/51x51/dark"
                                                                            alt="Image"/></div>

                <div class="media-body">
                    <span class="strong">Adrian Demian</span>
                    <span class="muted">contact@mosaicpro.biz</span>
                    <i class="icon-envelope"></i>
                    <i class="icon-phone"></i>
                    <i class="icon-skype"></i>
                </div>
            </div>
        </li>
        <li>
            <div class="media innerAll">
                <div class="media-object pull-left thumb hidden-phone"><img data-src="holder.js/51x51/dark"
                                                                            alt="Image"/></div>

                <div class="media-body">
                    <span class="strong">Adrian Demian</span>
                    <span class="muted">contact@mosaicpro.biz</span>
                    <i class="icon-envelope"></i>
                    <i class="icon-phone"></i>
                    <i class="icon-skype"></i>
                </div>
            </div>
        </li>
        <li>
            <div class="media innerAll">
                <div class="media-object pull-left thumb hidden-phone"><img data-src="holder.js/51x51/dark"
                                                                            alt="Image"/></div>

                <div class="media-body">
                    <span class="strong">Adrian Demian</span>
                    <span class="muted">contact@mosaicpro.biz</span>
                    <i class="icon-envelope"></i>
                    <i class="icon-phone"></i>
                    <i class="icon-skype"></i>
                </div>
            </div>
        </li>
    </ul>
</div>

<div class="span8 detailsWrapper">
    <div class="ajax-loading hide">
        <i class="icon-spinner icon-spin icon-4x"></i>
    </div>

    <div class="innerAll">
        <div class="title">
            <div class="row-fluid">
                <div class="span8">
                    <h3 class="text-primary">Adrian Demian</h3>
                    <span class="muted">Senior Designer</span>
                </div>

                <div class="span4 text-right">
                    <p class="muted">4 projects <a href=""><i class="icon-circle-arrow-right"></i></a></p>

                    <div class="margin-bottom-none progress progress-small progress-inverse count-outside"><div
                            class="count">30%</div>

                        <div class="bar" style="width: 30%;"></div></div>
                </div>
            </div>
        </div>
        <hr/>

        <div class="body">
            <div class="row-fluid">
                <div class="span4 overflow-hidden">
                    <!-- Profile Photo -->
                    <div><a href="" class="thumb inline-block"><img data-src="holder.js/300x200" alt="Profile"/></a>
                    </div>

                    <div class="separator bottom"></div>
                    <!-- // Profile Photo END -->
                    <ul class="icons-ul separator bottom">
                        <li><i class="icon-envelope icon-li icon-fixed-width"></i> contac@mosaicpro.biz</li>
                        <li><i class="icon-phone icon-li icon-fixed-width"></i> 00353 9191238101</li>
                        <li><i class="icon-skype icon-li icon-fixed-width"></i> mosaicpro</li>
                    </ul>
                </div>

                <div class="span8">
                    <h5 class="strong">About</h5>

                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>

                    <div class="row-fluid">
                        <div class="span4">
                            <h5 class="strong">Reports</h5>
                            <a href="" class="btn btn-primary btn-small btn-block"><i
                                    class="icon-download-alt icon-fixed-width"></i> June</a>
                            <a href="" class="btn btn-inverse btn-small btn-block"><i
                                    class="icon-download-alt icon-fixed-width"></i> May</a>
                            <a href="" class="btn btn-inverse btn-small btn-block"><i
                                    class="icon-download-alt icon-fixed-width"></i> April</a>

                            <div class="separator bottom"></div>
                        </div>

                        <div class="span7 offset1">
                            <h5 class="strong">Skills</h5>

                            <div class="progress progress-mini progress-primary count-outside add-outside"><div
                                    class="count">100%</div>

                                <div class="bar" style="width: 100%;"></div>

                                <div class="add">HTML</div></div>

                            <div class="progress progress-mini progress-primary count-outside add-outside"><div
                                    class="count">90%</div>

                                <div class="bar" style="width: 90%;"></div>

                                <div class="add">CSS</div></div>

                            <div class="progress progress-mini progress-primary count-outside add-outside"><div
                                    class="count">93%</div>

                                <div class="bar" style="width: 93%;"></div>

                                <div class="add">jQuery</div></div>

                            <div class="progress progress-mini progress-primary count-outside add-outside"><div
                                    class="count">79%</div>

                                <div class="bar" style="width: 79%;"></div>

                                <div class="add">PHP</div></div>

                            <div class="progress progress-mini progress-inverse count-outside add-outside"><div
                                    class="count">20%</div>

                                <div class="bar" style="width: 20%;"></div>

                                <div class="add">WP</div></div>

                            <div class="separator bottom"></div>
                        </div>
                    </div>
                    <h5 class="text-uppercase strong text-primary"><i
                            class="icon-group text-regular icon-fixed-width"></i> MosaicPro <span
                            class="text-lowercase strong padding-none">Team</span> <span
                            class="text-lowercase padding-none">(2 people)</span></h5>
                    <ul class="team">
                        <li><span class="crt">1</span><span class="strong">Adrian Demian</span><span
                                class="muted">Senior Designer</span></li>
                        <li><span class="crt">2</span><span class="strong">Laza Bogdan</span><span
                                class="muted">Senior Developer</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</div>
</div>
<!-- // Widget END -->

<p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

<!-- Widget -->
<h2 class="margin-none separator bottom"><i class="icon-time text-primary icon-fixed-width"></i> Recent Activity</h2>

<!-- Stats Widgets -->
<div class="row-fluid">
    <div class="span3">
        <a href="" class="widget-stats widget-stats-default widget-stats-5">
            <span class="glyphicons cart_in"><i></i></span>
            <span class="txt">Latest<span>Orders</span></span>

            <div class="clearfix"></div>
        </a>
    </div>

    <div class="span3">
        <a href="" class="widget-stats widget-stats-info widget-stats-5">
            <span class="glyphicons envelope"><i></i></span>
            <span class="txt">New<span>Emails</span></span>

            <div class="clearfix"></div>
        </a>
    </div>

    <div class="span3">
        <a href="" class="widget-stats widget-stats-inverse widget-stats-5">
            <span class="glyphicons parents"><i></i></span>
            <span class="txt">Recent<span>Signups</span></span>

            <div class="clearfix"></div>
        </a>
    </div>

    <div class="span3">
        <a href="" class="widget-stats widget-stats-primary widget-stats-5">
            <span class="glyphicons wifi_alt"><i></i></span>
            <span class="txt">User<span>Activity</span></span>

            <div class="clearfix"></div>
        </a>
    </div>

</div>

<div class="separator bottom"></div>
<!-- // Stats Widgets END -->

<div class="widget widget-heading-simple widget-body-simple">
<div class="widget-body">

<div class="widget widget-tabs widget-tabs-icons-only-2 widget-activity margin-none widget-tabs-gray">

<!-- Tabs Heading -->
<div class="widget-head">
    <ul>
        <li><a class="glyphicons user_add" data-toggle="tab" href="#filterUsersTab"><i></i>Users</a></li>
        <li><a class="glyphicons shopping_cart" data-toggle="tab" href="#filterOrdersTab"><i></i>Orders</a></li>
        <li class="active"><a class="glyphicons envelope" data-toggle="tab" href="#filterMessagesTab"><i></i></a></li>
        <li><a class="glyphicons link" data-toggle="tab" href="#filterLinksTab"><i></i></a></li>
        <li><a class="glyphicons camera" data-toggle="tab" href="#filterPhotosTab"><i></i></a></li>
    </ul>
</div>
<!-- // Tabs Heading END -->

<div class="widget-body">
<div class="tab-content">

<!-- Filter Users Tab -->
<div class="tab-pane" id="filterUsersTab">
    <ul class="list">

        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon user_add"><i></i></span>
            <span class="ellipsis"><a href="">Martin Glades</a> registered at <a href="">Melisa Ragae's</a> suggestion.
            </span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon user_add"><i></i></span>
            <span class="ellipsis"><a href="">Martin Glades</a> registered at <a href="">Melisa Ragae's</a> suggestion.
            </span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon user_add"><i></i></span>
            <span class="ellipsis"><a href="">Jane Doe</a> registered at <a href="">Jane Doe's</a> suggestion.</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon user_add"><i></i></span>
            <span class="ellipsis"><a href="">Melisa Ragae</a> registered at <a href="">John Doe's</a> suggestion.
            </span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon user_add"><i></i></span>
            <span class="ellipsis"><a href="">Melisa Ragae</a> registered at <a href="">Darius Jackson's</a> suggestion.
            </span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->

    </ul>
</div>
<!-- // Filter Users Tab END -->

<!-- Filter Orders Tab -->
<div class="tab-pane" id="filterOrdersTab">
    <ul class="list">

        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon shopping_cart"><i></i></span>
            <span class="ellipsis"><a href="">Darius Jackson</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2301</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon shopping_cart"><i></i></span>
            <span class="ellipsis"><a href="">Martin Glades</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2302</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon shopping_cart"><i></i></span>
            <span class="ellipsis"><a href="">Jane Doe</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2303</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon shopping_cart"><i></i></span>
            <span class="ellipsis"><a href="">John Doe</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2304</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon shopping_cart"><i></i></span>
            <span class="ellipsis"><a href="">Jane Doe</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2305</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->

    </ul>
</div>
<!-- // Filter Orders Tab END -->

<!-- Filter Messages Tab -->
<div class="tab-pane active" id="filterMessagesTab">
    <ul class="list">

        <!-- Activity item -->
        <li class="double">
            <span class="glyphicons activity-icon envelope"><i></i></span>
            <span class="ellipsis">
                You have received an email from <a href="">John Doe</a> (john.doe@fake-email.net)
                <span class="meta">on 29 March, 2013 <span>1 hour ago</span></span>
            </span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li class="double highlight">
            <span class="glyphicons activity-icon envelope"><i></i></span>
            <span class="ellipsis">
                You have received an email from <a href="">Jane Doe</a> (jane.doe@lovely-email.net)
                <span class="meta">on 29 March, 2013 <span>1 hour ago</span></span>
            </span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li class="double highlight">
            <span class="glyphicons activity-icon envelope"><i></i></span>
            <span class="ellipsis">
                You have received an email from <a href="">John Doe</a> (john.doe@fake-email.net)
                <span class="meta">on 29 March, 2013 <span>1 hour ago</span></span>
            </span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li class="double">
            <span class="glyphicons activity-icon envelope"><i></i></span>
            <span class="ellipsis">
                You have received an email from <a href="">Jane Doe</a> (jane.doe@lovely-email.net)
                <span class="meta">on 29 March, 2013 <span>1 hour ago</span></span>
            </span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li class="double">
            <span class="glyphicons activity-icon envelope"><i></i></span>
            <span class="ellipsis">
                You have received an email from <a href="">Martin Glades</a> (martin.glades@wee-email.com)
                <span class="meta">on 29 March, 2013 <span>1 hour ago</span></span>
            </span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->

    </ul>
</div>
<!-- // Filter Messages Tab END -->

<!-- Filter Links Tab -->
<div class="tab-pane" id="filterLinksTab">
    <ul class="list">

        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon link"><i></i></span>
            <span class="ellipsis"><a href="">Jane Doe</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2301</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon link"><i></i></span>
            <span class="ellipsis"><a href="">Jane Doe</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2302</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon link"><i></i></span>
            <span class="ellipsis"><a href="">John Doe</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2303</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon link"><i></i></span>
            <span class="ellipsis"><a href="">Jane Doe</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2304</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon link"><i></i></span>
            <span class="ellipsis"><a href="">Melisa Ragae</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2305</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->

    </ul>
</div>
<!-- // Filter Links Tab END -->

<!-- Filter Photos Tab -->
<div class="tab-pane" id="filterPhotosTab">
    <ul class="list">

        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon camera"><i></i></span>
            <span class="ellipsis"><a href="">John Doe</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2301</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon camera"><i></i></span>
            <span class="ellipsis"><a href="">Darius Jackson</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2302</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon camera"><i></i></span>
            <span class="ellipsis"><a href="">Jane Doe</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2303</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->
        <!-- Activity item -->
        <li>
            <span class="date">21/03</span>
            <span class="glyphicons activity-icon camera"><i></i></span>
            <span class="ellipsis"><a href="">Jane Doe</a> bought 10 items worth of &euro;50 (<a
                    href="">order #2304</a>)</span>

            <div class="clearfix"></div>
        </li>
        <!-- // Activity item END -->

    </ul>
</div>
<!-- // Filter Photos Tab END -->

</div>
</div>
</div>

</div>
</div>

<p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

<!-- Carousel -->
<h2 class="margin-none separator bottom"><i class="icon-picture text-primary icon-fixed-width"></i> Carousel</h2>

<div class="widget widget-heading-simple widget-body-simple">
    <div class="widget-body">
        <div class="carousel carousel-1 slide" id="myCarousel">
            <div class="carousel-inner">
                <!-- Item -->
                <div class="item active">
                    <div class="row-fluid">
                        <div class="span5 relativeWrap">
                            <div class="carousel-caption">
                                <h4>Get this item now!</h4>

                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut.<br/> <a
                                        href="" class="separator top" target="_blank">Buy QuickAdmin</a></p>
                            </div>
                        </div>

                        <div class="span7">
                            <img src="/common/theme/images/gallery-2/8.jpg" alt=""/>
                        </div>
                    </div>
                </div>
                <!-- // Item END -->
                <!-- Item -->
                <div class="item">
                    <div class="row-fluid">
                        <div class="span5 relativeWrap">
                            <div class="carousel-caption">
                                <h4>Get this item now!</h4>

                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut.<br/> <a
                                        href="" class="separator top" target="_blank">Buy QuickAdmin</a></p>
                            </div>
                        </div>

                        <div class="span7">
                            <img src="/common/theme/images/gallery-2/9.jpg" alt=""/>
                        </div>
                    </div>
                </div>
                <!-- // Item END -->
                <!-- Item -->
                <div class="item">
                    <div class="row-fluid">
                        <div class="span5 relativeWrap">
                            <div class="carousel-caption">
                                <h4>Get this item now!</h4>

                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut.<br/> <a
                                        href="" class="separator top" target="_blank">Buy QuickAdmin</a></p>
                            </div>
                        </div>

                        <div class="span7">
                            <img src="/common/theme/images/gallery-2/10.jpg" alt=""/>
                        </div>
                    </div>
                </div>
                <!-- // Item END -->
            </div>
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
        </div>
    </div>
</div>
<!-- // Carousel END -->

<h2 class="margin-none separator bottom"><i class="icon-gift text-primary icon-fixed-width"></i> Special Offers</h2>

<div class="row-fluid">
    <div class="span6">

        <!-- Widget -->
        <div class="widget widget-heading-simple widget-body-gray widget-body-multiple widget-offers">
            <div class="widget-body">

                <!-- Media item -->
                <div class="media">
                    <img class="media-object pull-left thumb hidden-tablet hidden-phone"
                         data-src="holder.js/100x100/dark" alt="Image"/>

                    <div class="media-body">
                        <h5><a href="">Product or Service Name</a></h5>

                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae accumsan mauris. Donec vitae nibh</p>

                        <div class="row-fluid">
                            <div class="span6 tablet-column-reset">
                                <span class="price">Price: <strong>&dollar;29.90</strong></span>
                            </div>

                            <div class="span6 text-right tablet-column-reset">
                                <button type="button"
                                        class="btn btn-inverse btn-icon glyphicons shopping_cart btn-small"><i></i>Purchase
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- // Media item END -->

            </div>
        </div>
        <!-- // Widget END -->

    </div>

    <div class="span6">

        <!-- Widget -->
        <div class="widget widget-heading-simple widget-body-gray widget-body-multiple widget-offers">
            <div class="widget-body">

                <!-- Media item -->
                <div class="media">
                    <img class="media-object pull-left thumb hidden-tablet hidden-phone"
                         data-src="holder.js/100x100/dark" alt="Image"/>

                    <div class="media-body">
                        <h5><a href="">Product or Service Name</a></h5>

                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae accumsan mauris. Donec vitae nibh</p>

                        <div class="row-fluid">
                            <div class="span6 tablet-column-reset">
                                <span class="price">Price: <strong>&dollar;29.90</strong></span>
                            </div>

                            <div class="span6 text-right tablet-column-reset">
                                <button type="button"
                                        class="btn btn-inverse btn-icon glyphicons shopping_cart btn-small"><i></i>Purchase
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- // Media item END -->

            </div>
        </div>
        <!-- // Widget END -->

    </div>
</div>

<p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

<!-- Chat -->
<h2 class="margin-none separator bottom"><i class="icon-comments text-primary icon-fixed-width"></i> Chat</h2>

<div class="widget widget-heading-simple widget-body-white widget-chat">
    <div class="widget-body">

        <!-- Slim Scroll -->
        <div class="slim-scroll chat-items" data-scroll-height="190px" data-scroll-size="0">

            <!-- Media item -->
            <div class="media">
                <small class="author"><a href="#" title="" class="strong">Martin</a></small>

                <div class="media-object pull-left thumb"><img data-src="holder.js/51x51/dark" alt="Image"/></div>

                <div class="media-body">
                    <blockquote>
                        <small class="date"><cite>just now</cite></small>

                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae accumsan mauris. Donec vitae nibh felis, facilisis bibendum sapien.</p>
                    </blockquote>
                </div>
            </div>
            <!-- // Media item END -->

            <!-- Media item -->
            <div class="media right">
                <small class="author"><a href="#" title="" class="strong">John Doe</a></small>

                <div class="media-object pull-right thumb"><img data-src="holder.js/51x51/dark" alt="Image"/></div>

                <div class="media-body">
                    <blockquote class="pull-right">
                        <small class="date"><cite>15 seconds ago</cite></small>

                        <p>In ultricies ante eget tortor euismod vitae molestie eros hendrerit. Cras tristique, orci ac lacinia aliquet, velit risus laoreet lectus, eget sollicitudin metus orci non nulla.</p>
                    </blockquote>
                </div>
            </div>
            <!-- // Media item END -->

            <!-- Media item -->
            <div class="media">
                <small class="author"><a href="#" title="" class="strong">Ricky</a></small>

                <div class="media-object pull-left thumb"><img data-src="holder.js/51x51/dark" alt="Image"/></div>

                <div class="media-body">
                    <blockquote>
                        <small class="date"><cite>5 minutes ago</cite></small>

                        <p>Pellentesque ac turpis turpis. Aliquam erat volutpat. Proin semper auctor mauris vel tempor. Ut eget turpis neque. Nam ultricies tortor eu odio ultricies euismod.</p>
                    </blockquote>
                </div>
            </div>
            <!-- // Media item END -->

        </div>
        <!-- // Slim Scroll END -->

    </div>

    <div class="chat-controls">
        <div class="innerLR">
            <form class="margin-none">
                <div class="row-fluid">
                    <div class="span10">
                        <input type="text" name="message" class="input-block-level margin-none"
                               placeholder="Type your message .."/>
                    </div>

                    <div class="span2">
                        <button type="submit" class="btn btn-block btn-primary">Send</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<!-- // Chat END -->

</div>

<div class="span3 tablet-column-reset">

    <h2 class="margin-none separator bottom"><i
            class="icon-external-link-sign icon-fixed-width text-primary"></i>Statistics</h2>
    <a href="" class="widget-stats widget-stats-2 widget-stats-easy-pie widget-stats-primary">
        <div data-percent="23" class="easy-pie primary easyPieChart"><span class="value">23</span>%</div>
        <span class="txt"><span class="count text-large inline-block">130</span> ROI</span>

        <div class="clearfix"></div>
    </a>

    <div class="separator bottom"></div>
    <a href="" class="widget-stats widget-stats-2 widget-stats-gray widget-stats-easy-pie txt-single">
        <div data-percent="35" class="easy-pie primary easyPieChart"><span class="value">35</span>%</div>
        <span class="txt">Server workload</span>

        <div class="clearfix"></div>
    </a>

    <div class="separator bottom"></div>
    <a href="" class="widget-stats widget-stats-2">
        <div class="sparkline"></div>
        <span class="txt"><span class="count text-large text-primary inline-block">566</span> Visits</span>

        <div class="clearfix"></div>
    </a>

    <p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

    <!-- Activity/List Widget -->
    <h2 class="margin-none separator bottom"><i class="icon-signal text-primary icon-fixed-width"></i> Activity</h2>

    <div class="widget widget-heading-simple widget-body-gray" data-toggle="collapse-widget">
        <div class="widget-body list">
            <ul>

                <!-- List item -->
                <li>
                    <span>Sales today</span>
                    <span class="count">&euro;5,900</span>
                </li>
                <!-- // List item END -->

                <!-- List item -->
                <li>
                    <span>Some other stats</span>
                    <span class="count">36,900</span>
                </li>
                <!-- // List item END -->

                <!-- List item -->
                <li>
                    <span>Some stunning stats</span>
                    <span class="count">26,999</span>
                </li>
                <!-- // List item END -->

                <!-- List item -->
                <li>
                    <span>Awesome stats</span>
                    <span class="count">4,900</span>
                </li>
                <!-- // List item END -->

            </ul>
        </div>
    </div>
    <!-- // Activity/List Widget END -->

    <!-- Latest Orders/List Widget -->
    <h2 class="margin-none separator bottom"><i class="icon-shopping-cart icon-fixed-width text-primary"></i>Last orders
    </h2>

    <div class="widget widget-heading-simple widget-body-gray">
        <div class="widget-body list products">
            <ul>

                <!-- List item -->
                <li>
                    <span class="img"><img data-src="holder.js/40x40/dark" class="thumb"/></span>
                    <span class="title">10 items<br/><strong>&euro;5,900.00</strong></span>
                    <span class="count"></span>
                </li>
                <!-- // List item END -->

                <!-- List item -->
                <li>
                    <span class="img"><img data-src="holder.js/40x40/dark" class="thumb"/></span>
                    <span class="title">Product name<br/><strong>&euro;2,900</strong></span>
                    <span class="count"></span>
                </li>
                <!-- // List item END -->

            </ul>
        </div>
    </div>
    <!-- // Latest Orders/List Widget END -->

    <!-- Widget -->
    <h2 class="margin-none separator bottom"><i class="icon-file-text icon-fixed-width text-primary"></i>Notes</h2>

    <div class="widget widget-heading-simple widget-body-gray">
        <div class="widget-body">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eu diam eros. Etiam consequat, quam eu molestie tempus, dui elit volutpat massa, at consectetur ligula nunc ac massa. Phasellus quis ante libero, quis accumsan purus. Pellentesque rhoncus accumsan interdu
        </div>
    </div>
    <!-- // Widget END -->

    <div class="alert alert-primary">
        <a class="close" data-dismiss="alert">&times;</a>

        <p>Integer quis tempor mi. Donec venenatis dui in neque fringilla at iaculis libero ullamcorper. In velit sem, sodales id hendrerit ac, fringilla et est.</p>
    </div>

    <!-- Widget -->
    <h2 class="margin-none separator bottom"><i class="icon-twitter icon-fixed-width text-primary"></i>Twitter Feed</h2>

    <div class="widget widget-heading-simple widget-body-white">
        <div class="widget-body">
            <div class="jstwitter" data-gridalicious="false" data-type="slide" data-images="false"><span
                    class="label">Loading ..</span></div>
        </div>
    </div>
    <!-- // Widget END -->

</div>
</div>

</div>

</div>
<!-- // Content END -->


<div id="footer" class="hidden-print">

    <!--  Copyright Line -->
    <div class="copy">&copy; 2012 - 2013 - <a href="http://www.mosaicpro.biz">MosaicPro</a> - All Rights Reserved. <a
            href="http://themeforest.net/?ref=mosaicpro"
            target="_blank">Purchase FLAT KIT on ThemeForest</a> - Current version: v1.2.0 / <a target="_blank"
                                                                                                href="http://demo.mosaicpro.biz/flatkit/CHANGELOG">changelog</a>
    </div>
    <!--  End Copyright Line -->

</div>
<!-- // Footer END -->

</div>
<!-- // Main Container Fluid END -->




<g:render template="/shared/flat/themer"/>
<g:render template="/shared/flat/modal-gallery"/>
<g:render template="/shared/flat/javaScipts"/>
</body>
</html>