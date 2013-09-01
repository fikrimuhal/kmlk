<%--
  Created by IntelliJ IDEA.
  User: sumnulu
  Date: 8/20/13
  Time: 7:29 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>

<ul class="breadcrumb">
    <li>Bulunduğunuz sayfa</li>
    <li><a href="/dashboard" class="glyphicons dashboard"><i></i> Şirket</a></li>
    <li class="divider"><i class="icon-caret-right"></i></li>
    <li><a href="/">Projeler</a></li>
    <li class="divider"><i class="icon-caret-right"></i></li>
    <li><a href="/">Proje listesi</a></li>
</ul>

<h1>Şirket<span>Fikrimuhal Teknoloji LTD. STI.</span></h1>


<div class=" innerAll">


<!-- Google maps start -->
<div class="widget widget-heading-simple widget-body-gray">

    <h3 class="glyphicons circle_info margin-none"><i></i>Adress <span>Fikrimuhal Teknoloji ltd. sti.</span></h3>
    <div class="separator bottom"></div>
    <address>Fikrimuhal Teknoloji LTD. ŞTİ.
    Mimar Sinan Mah. Çavuşbaşı Cad. Ethem sk.
    Zin D iş mer. N.5/5
    34782 Istanbul, Turkey</address>

    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkrC_ONkbLtMeRKJ85Be62791uFpERjSI&sensor=true">
    </script>
    <script type="text/javascript">
        function initialize() {
            map_latlng = new google.maps.LatLng(41.0305073, 29.173157);

            var mapOptions = {
                zoom: 11,
                center: map_latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                panControl: false,
                zoomControl: false,
                draggable: false,
                disableDoubleClickZoom: true,
                scaleControl: false,
                mapTypeControl: false,
                disableDefaultUI: true,
                scrollwheel: false,
                styles: [
                    {
                        stylers: [
                            {
                                saturation: -20
                            },
                            {
                                hue: themerPrimaryColor
                            }
                        ]
                    },
                    {
                        elementType: "labels.text.fill",
                        stylers: [
                            { color: "#804444" }
                        ]

                    }
                ]
            };
            var map = new google.maps.Map(document.getElementById("map-canvas"),
                    mapOptions);
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>

    <div class="thumbnail"><div id="map-canvas" style='height: 500px;'/></div>

</div>
<!-- Google maps end -->
<p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>


<h3 class="glyphicons circle_info margin-none"><i></i>Kim? <span><a href="/company/people">Hepsini göster</a></span></h3>

<div class="separator bottom"></div>


<!-- Row -->
<div class="row-fluid">

    <!-- Thumbnails -->
    <ul class="thumbnails">

        <!-- Column -->
        <li class="span4" >

            <!-- Thumbnail -->
            <div class="thumbnail widget-thumbnail" onclick="document.location.href = '/company/people/ilgaz'"
                 style="cursor: hand;">
                <img src="/images/photos/ilgaz2.jpg" alt="100%x200 Image Holder" style="height: 200px;"/>

                <div class="caption">
                    <h4>Ilgaz Şumnulu</h4>

                    <p>Bilkent Fizik mezunu. Sheldon Cooper’ın 3. göbekten kuzeni, mucit, fikirlerin arkasındaki adam.</p>

                    <!-- Social Icons -->
                    <a href="" class="glyphicons standard primary facebook"><i></i></a>
                    <a href="" class="glyphicons standard twitter"><i></i></a>
                    <a href="" class="glyphicons standard linked_in"><i></i></a>

                    <div class="clearfix"></div>
                    <!-- // Social Icons END -->
                </div>
            </div>
            <!-- // Thumbnail END -->

        </li>
        <!-- // Column END -->

        <!-- Column -->
        <li class="span4">

            <!-- Thumbnail -->
            <div class="thumbnail widget-thumbnail" onclick="document.location.href = '/company/people/ilgaz'" style="cursor: hand;">
                <img src="/images/photos/ilgaz3.jpg" alt="100%x200 Image Holder" style="height: 200px;"/>

                <div class="caption">
                    <h4>Sami Can Tandoğdu</h4>

                    <p>Bilkent İşletme mezunu. Bir süre finans sektöründe çalıştı. Rakamları pek bir seviyor.</p>

                    <!-- Social Icons -->
                    <a href="" class="glyphicons standard primary facebook"><i></i></a>
                    <a href="" class="glyphicons standard twitter"><i></i></a>
                    <a href="" class="glyphicons standard linked_in"><i></i></a>

                    <div class="clearfix"></div>
                    <!-- // Social Icons END -->
                </div>
            </div>
            <!-- // Thumbnail END -->

        </li>
        <!-- // Column END -->

        <!-- Column -->
        <li class="span4">

            <!-- Thumbnail -->
            <div class="thumbnail widget-thumbnail" onclick="document.location.href = '/company/people/ilgaz'"
                 style="cursor: hand;">
                <img src="/images/photos/ilgaz4.jpg" alt="100%x200 Image Holder" style="height: 200px;"/>

                <div class="caption">
                    <h4>Jose Gonzales</h4>

                    <p>Hala öğrenci, hep korsan. 10 yıllık sistem yöneticisi, 2 yıldır açık kaynak uygulamalar yazıyor.

                    </p>

                    <!-- Social Icons -->
                    <a href="" class="glyphicons standard primary facebook"><i></i></a>
                    <a href="" class="glyphicons standard twitter"><i></i></a>
                    <a href="" class="glyphicons standard linked_in"><i></i></a>

                    <div class="clearfix"></div>
                    <!-- // Social Icons END -->
                </div>
            </div>
            <!-- // Thumbnail END -->

        </li>
        <!-- // Column END -->

    </ul>
    <!-- // Thumbnails END -->

</div>
<!-- // Row END -->

<p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

<div class="separator bottom"></div>

<h2 class="margin-none separator bottom"><i class="icon-group text-primary icon-fixed-width"></i> Ürünler / Projeler
</h2>
<div class="row-fluid">

    <div class="span6">

        <div class="widget widget-heading-simple widget-body-white">
            <div class="widget-body">
                <div class="innerL">
                    <div class="separator bottom"></div>

                    <div class="glyphicons glyphicon-large shield">
                        <i></i>
                        <h4>Sentel Medya cozumleme</h4>

                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an <br/> <a
                                href="/project/makalepazari">learn more</a></p>
                    </div>

                    <div class="separator bottom"></div>

                    <div class="glyphicons glyphicon-large group">
                        <i></i>
                        <h4>SirketGurusu</h4>

                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an <br/> <a
                                href="/project/makalepazari">learn more</a></p>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="span6">

        <div class="widget widget-heading-simple widget-body-white">
            <div class="widget-body">

                <div class="separator bottom"></div>

                <div class="glyphicons glyphicon-large iphone">
                    <i></i>
                    <h4>Acikdemokrasi</h4>

                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an <br/> <a
                            href="/project/makalepazari">learn more</a></p>
                </div>

                <div class="separator bottom"></div>

                <div class="glyphicons glyphicon-large magic group-column">
                    <i></i>
                    <h4>Makale pazari</h4>

                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an <br/> <a
                            href="/project/makalepazari">learn more</a></p>
                </div>

            </div>
        </div>

    </div>
</div>


</div>


<p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

<div class="innerLR innerB">

    <div class="row-fluid">
        <div class="span9 tablet-column-reset">

            <g:render template="/s/company/timeline"/>
            <p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

            <g:render template="/s/company/skills"/>
            <p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

            <g:render template="/shared/comps/span9/chat"/>



        </div>

        <div class="span3 tablet-column-reset">

            <h2 class="margin-none separator bottom"><i class="icon-external-link-sign icon-fixed-width text-primary"></i>İstatistikler</h2>

            <g:render template="/s/company/siralama"/>
            <div class="separator bottom"></div>

            <g:render template="/shared/comps/span3/visits"/>
            <p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

            <g:render template="/s/company/quickInfo"/>

            <g:render template="/s/company/faliyetAlanlari"/>

            <g:render template="/s/company/address"/>
        </div>

    </div>

</div>

<div class="innerAll">

    <p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

    <div class="row-fluid">
        <div class="span6">
            <h2 class="margin-none separator bottom"><i class="icon-group text-primary icon-fixed-width"></i>Resimler</h2>

            <!-- Carousel -->
            <div class="widget widget-heading-simple widget-body-simple">
                <div class="widget-body">
                    <div class="carousel carousel-1 slide" id="myCarousel2">
                        <div class="carousel-inner">

                            <!-- Item -->
                            <div class="item active">
                                <div class="row-fluid">
                                    <div class="span5 relativeWrap">
                                        <div class="carousel-caption">
                                            <h4>Fikrimuhal Teknoloji</h4>
                                                <p>
                                                    Şirket fotolari
                                                </p>
                                            %{--<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.<br/> <a--}%
                                            %{--href="" target="_blank">Buy QuickAdmin</a></p>--}%
                                        </div>
                                    </div>

                                    <div class="span7">
                                        <img src="/images/photos/fikrimuhal_logo_medium.png" alt=""/>
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

                                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.<br/> <a
                                                    href="" target="_blank">Buy QuickAdmin</a></p>
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

                                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.<br/> <a
                                                    href="" target="_blank">Buy QuickAdmin</a></p>
                                        </div>
                                    </div>

                                    <div class="span7">
                                        <img src="../../../common/theme/images/gallery-2/10.jpg" alt=""/>
                                    </div>
                                </div>
                            </div>
                            <!-- // Item END -->
                        </div>
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel2" data-slide-to="1"></li>
                            <li data-target="#myCarousel2" data-slide-to="2"></li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- // Carousel END -->

        </div>

        <div class="span6">
            <h2 class="margin-none separator bottom"><i class="icon-group text-primary icon-fixed-width"></i> Blog Yazilari</h2>

            <!-- Media item -->
            <div class="media">
                <img class="media-object pull-left thumb" data-src="holder.js/50x50/dark" alt="50x50" style="width: 50px; height: 50px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAE9ElEQVR4Xu2c2ystYRjG30XOUk4Jd0oRyiFyIUS4EKUcosTfJocoyYWcTxeUEsWVUxRJIopITnu/X3umsffamjXbGk/t5yuZNfOO75nnN893WBcCdXV178IG40CAQGBYGCEEgsWDQMB4EAiBoDkApodzCIGAOQAmhwkhEDAHwOQwIQQC5gCYHCaEQMAcAJPDhBAImANgcpgQAgFzAEwOE0IgYA6AyWFCCATMATA5TAiBgDkAJocJIRAwB8DkMCEEAuYAmBwmhEDAHACTw4QQCJgDYHKYEAIBcwBMDhNCIGAOgMlhQggEzAEwOUwIgYA5ACaHCSEQMAfA5DAh/yuQ9PR0KSoqkpeXlz8seH9/l/X1dXl9fTXXtLa2tlYSEhLM5/v7e1lZWZGrq6uQ7fuufkMW+usG3xJSVVUlhYWFQXW+vb3JyMiI3N3dSXZ2trS0tASFNjU1JWdnZyE963f1G5JIR7FvQOrr6yU3NzeoTk3G0NCQPD4+Sn9/v8TExJi66+tr8zs1NdX8fnp6koGBATtJbh76u/p1oy1YjW9AOjo6jLEnJycyMzMTVG9GRoa0tbWZa5qW4eFhc9ze3m7u1aFtcnJSMjMzJS0tzVx7eHiQtbU1c1xSUmKfv7m5kc3NTfnKfi8uLrz67Po+X4AEAgHp7e2V+Ph4OT8/l8PDQ3OsZu7v79vzSkVFhZSWlhrxGxsbsr29bY7Ly8ulrKzMHC8uLooOcQ0NDfZDzs3NiQLo6uqyz2md9vOV/R4cHLg21muhL0Cio6Olr69PIiMj/9Cp5qp5R0dHUllZKcXFxaZmYWHBGKrNeX5vb0+Wl5fNpJ+Xl2euPz8/mx+FrE0hLy0tSTj69Wq02/t8AaLDiw47VtOhR1NjNYUyOjoq+fn5NhCFZL2RWVlZ0traasoVksJyps75sJo6nY90XgpHv26N9VrnC5CUlBTR1U5UVJQcHx/L1taWeZt1fI+Li7OHIp0nrIQ4gejqTO/Xpkman583x/p3Ozs7P4AdHx+3FwPh6ter2W7u8wXI34Q454adnR3z1uteRZsTiHPI0gl8d3fX1CQmJkpPT49ERESYz5q0sbExub29/fTZ/7VfN8Z6rfEFiL71BQUFZg7RCdhardTU1JhhStvq6qoZZn7+y0Hz2bkac9ZpOjQlCq+7u1uSkpI+PLu1OtNhMRz9ejXa7X2+AHG+4WqYLnt1B11dXW3ebms5q9f0jVdwek7haWtqarITMDg4aFZnzhXZ7w+radOdfzj6dWus1zpfgOhXIJbRwYSenp6K7sK1fbaRsyZ0535F75menjabSStdwQB/Rb9eTQ7lPl+AqCBNRHNzs8TGxn7QpybrfKEmWq2xsVFycnI+1OkQNjs7a+qszZ4WXF5eysTEhKnVCT45Odkc6zyiKzddaX1Vv6EY67XWNyCWQF35WF8aqmk6TAVruuKy9hX65aJu/P6lfVe/oWr2HUioAv+3egIBI04gBALmAJgcJoRAwBwAk8OEEAiYA2BymBACAXMATA4TQiBgDoDJYUIIBMwBMDlMCIGAOQAmhwkhEDAHwOQwIQQC5gCYHCaEQMAcAJPDhBAImANgcpgQAgFzAEwOE0IgYA6AyWFCCATMATA5TAiBgDkAJocJIRAwB8DkMCEEAuYAmBwmhEDAHACTw4QQCJgDYHKYEAIBcwBMDhMCBuQHLStIhk1jjGcAAAAASUVORK5CYII=">
                <div class="media-body">
                    <h4 class="media-heading">Media heading</h4>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae accumsan mauris. Donec vitae nibh felis, facilisis bibendum sapien. Duis a odio id erat scelerisque fermentum in ut leo. Suspendisse potenti. Nunc semper cursus dui luctus porttitor.
                    Donec facilisis semper magna sit amet ullamcorper.
                </div>
            </div>
            <!-- // Media item END -->

            <!-- Media item -->
            <div class="media">
                <img class="media-object pull-left thumb" data-src="holder.js/50x50/dark" alt="50x50" style="width: 50px; height: 50px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAE9ElEQVR4Xu2c2ystYRjG30XOUk4Jd0oRyiFyIUS4EKUcosTfJocoyYWcTxeUEsWVUxRJIopITnu/X3umsffamjXbGk/t5yuZNfOO75nnN893WBcCdXV178IG40CAQGBYGCEEgsWDQMB4EAiBoDkApodzCIGAOQAmhwkhEDAHwOQwIQQC5gCYHCaEQMAcAJPDhBAImANgcpgQAgFzAEwOE0IgYA6AyWFCCATMATA5TAiBgDkAJocJIRAwB8DkMCEEAuYAmBwmhEDAHACTw4QQCJgDYHKYEAIBcwBMDhNCIGAOgMlhQggEzAEwOUwIgYA5ACaHCSEQMAfA5DAh/yuQ9PR0KSoqkpeXlz8seH9/l/X1dXl9fTXXtLa2tlYSEhLM5/v7e1lZWZGrq6uQ7fuufkMW+usG3xJSVVUlhYWFQXW+vb3JyMiI3N3dSXZ2trS0tASFNjU1JWdnZyE963f1G5JIR7FvQOrr6yU3NzeoTk3G0NCQPD4+Sn9/v8TExJi66+tr8zs1NdX8fnp6koGBATtJbh76u/p1oy1YjW9AOjo6jLEnJycyMzMTVG9GRoa0tbWZa5qW4eFhc9ze3m7u1aFtcnJSMjMzJS0tzVx7eHiQtbU1c1xSUmKfv7m5kc3NTfnKfi8uLrz67Po+X4AEAgHp7e2V+Ph4OT8/l8PDQ3OsZu7v79vzSkVFhZSWlhrxGxsbsr29bY7Ly8ulrKzMHC8uLooOcQ0NDfZDzs3NiQLo6uqyz2md9vOV/R4cHLg21muhL0Cio6Olr69PIiMj/9Cp5qp5R0dHUllZKcXFxaZmYWHBGKrNeX5vb0+Wl5fNpJ+Xl2euPz8/mx+FrE0hLy0tSTj69Wq02/t8AaLDiw47VtOhR1NjNYUyOjoq+fn5NhCFZL2RWVlZ0traasoVksJyps75sJo6nY90XgpHv26N9VrnC5CUlBTR1U5UVJQcHx/L1taWeZt1fI+Li7OHIp0nrIQ4gejqTO/Xpkman583x/p3Ozs7P4AdHx+3FwPh6ter2W7u8wXI34Q454adnR3z1uteRZsTiHPI0gl8d3fX1CQmJkpPT49ERESYz5q0sbExub29/fTZ/7VfN8Z6rfEFiL71BQUFZg7RCdhardTU1JhhStvq6qoZZn7+y0Hz2bkac9ZpOjQlCq+7u1uSkpI+PLu1OtNhMRz9ejXa7X2+AHG+4WqYLnt1B11dXW3ebms5q9f0jVdwek7haWtqarITMDg4aFZnzhXZ7w+radOdfzj6dWus1zpfgOhXIJbRwYSenp6K7sK1fbaRsyZ0535F75menjabSStdwQB/Rb9eTQ7lPl+AqCBNRHNzs8TGxn7QpybrfKEmWq2xsVFycnI+1OkQNjs7a+qszZ4WXF5eysTEhKnVCT45Odkc6zyiKzddaX1Vv6EY67XWNyCWQF35WF8aqmk6TAVruuKy9hX65aJu/P6lfVe/oWr2HUioAv+3egIBI04gBALmAJgcJoRAwBwAk8OEEAiYA2BymBACAXMATA4TQiBgDoDJYUIIBMwBMDlMCIGAOQAmhwkhEDAHwOQwIQQC5gCYHCaEQMAcAJPDhBAImANgcpgQAgFzAEwOE0IgYA6AyWFCCATMATA5TAiBgDkAJocJIRAwB8DkMCEEAuYAmBwmhEDAHACTw4QQCJgDYHKYEAIBcwBMDhMCBuQHLStIhk1jjGcAAAAASUVORK5CYII=">
                <div class="media-body">
                    <h4 class="media-heading">Media heading</h4>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae accumsan mauris. Donec vitae nibh felis, facilisis bibendum sapien. Duis a odio id erat scelerisque fermentum in ut leo. Suspendisse potenti. Nunc semper cursus dui luctus porttitor.
                    Donec facilisis semper magna sit amet ullamcorper.
                </div>
            </div>
            <!-- // Media item END -->

            <!-- Media item -->
            <div class="media">
                <img class="media-object pull-left thumb" data-src="holder.js/50x50/dark" alt="50x50" style="width: 50px; height: 50px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAE9ElEQVR4Xu2c2ystYRjG30XOUk4Jd0oRyiFyIUS4EKUcosTfJocoyYWcTxeUEsWVUxRJIopITnu/X3umsffamjXbGk/t5yuZNfOO75nnN893WBcCdXV178IG40CAQGBYGCEEgsWDQMB4EAiBoDkApodzCIGAOQAmhwkhEDAHwOQwIQQC5gCYHCaEQMAcAJPDhBAImANgcpgQAgFzAEwOE0IgYA6AyWFCCATMATA5TAiBgDkAJocJIRAwB8DkMCEEAuYAmBwmhEDAHACTw4QQCJgDYHKYEAIBcwBMDhNCIGAOgMlhQggEzAEwOUwIgYA5ACaHCSEQMAfA5DAh/yuQ9PR0KSoqkpeXlz8seH9/l/X1dXl9fTXXtLa2tlYSEhLM5/v7e1lZWZGrq6uQ7fuufkMW+usG3xJSVVUlhYWFQXW+vb3JyMiI3N3dSXZ2trS0tASFNjU1JWdnZyE963f1G5JIR7FvQOrr6yU3NzeoTk3G0NCQPD4+Sn9/v8TExJi66+tr8zs1NdX8fnp6koGBATtJbh76u/p1oy1YjW9AOjo6jLEnJycyMzMTVG9GRoa0tbWZa5qW4eFhc9ze3m7u1aFtcnJSMjMzJS0tzVx7eHiQtbU1c1xSUmKfv7m5kc3NTfnKfi8uLrz67Po+X4AEAgHp7e2V+Ph4OT8/l8PDQ3OsZu7v79vzSkVFhZSWlhrxGxsbsr29bY7Ly8ulrKzMHC8uLooOcQ0NDfZDzs3NiQLo6uqyz2md9vOV/R4cHLg21muhL0Cio6Olr69PIiMj/9Cp5qp5R0dHUllZKcXFxaZmYWHBGKrNeX5vb0+Wl5fNpJ+Xl2euPz8/mx+FrE0hLy0tSTj69Wq02/t8AaLDiw47VtOhR1NjNYUyOjoq+fn5NhCFZL2RWVlZ0traasoVksJyps75sJo6nY90XgpHv26N9VrnC5CUlBTR1U5UVJQcHx/L1taWeZt1fI+Li7OHIp0nrIQ4gejqTO/Xpkman583x/p3Ozs7P4AdHx+3FwPh6ter2W7u8wXI34Q454adnR3z1uteRZsTiHPI0gl8d3fX1CQmJkpPT49ERESYz5q0sbExub29/fTZ/7VfN8Z6rfEFiL71BQUFZg7RCdhardTU1JhhStvq6qoZZn7+y0Hz2bkac9ZpOjQlCq+7u1uSkpI+PLu1OtNhMRz9ejXa7X2+AHG+4WqYLnt1B11dXW3ebms5q9f0jVdwek7haWtqarITMDg4aFZnzhXZ7w+radOdfzj6dWus1zpfgOhXIJbRwYSenp6K7sK1fbaRsyZ0535F75menjabSStdwQB/Rb9eTQ7lPl+AqCBNRHNzs8TGxn7QpybrfKEmWq2xsVFycnI+1OkQNjs7a+qszZ4WXF5eysTEhKnVCT45Odkc6zyiKzddaX1Vv6EY67XWNyCWQF35WF8aqmk6TAVruuKy9hX65aJu/P6lfVe/oWr2HUioAv+3egIBI04gBALmAJgcJoRAwBwAk8OEEAiYA2BymBACAXMATA4TQiBgDoDJYUIIBMwBMDlMCIGAOQAmhwkhEDAHwOQwIQQC5gCYHCaEQMAcAJPDhBAImANgcpgQAgFzAEwOE0IgYA6AyWFCCATMATA5TAiBgDkAJocJIRAwB8DkMCEEAuYAmBwmhEDAHACTw4QQCJgDYHKYEAIBcwBMDhMCBuQHLStIhk1jjGcAAAAASUVORK5CYII=">
                <div class="media-body">
                    <h4 class="media-heading">Media heading</h4>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae accumsan mauris. Donec vitae nibh felis, facilisis bibendum sapien. Duis a odio id erat scelerisque fermentum in ut leo. Suspendisse potenti. Nunc semper cursus dui luctus porttitor.
                    Donec facilisis semper magna sit amet ullamcorper.
                </div>
            </div>
            <!-- // Media item END -->

        </div>
    </div>
</div>
<p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>


<div class="innerLR widget widget-heading-simple widget-body-white">
    <div class="widget-head">
        <h4 class="heading">TODO:</h4>
    </div>

    <div class="widget-body">
        <div class="row-fluid">
            <div class="span9">
                <ul>

                    <li>Is yaptigi sirketler / Referanslar </li>
                    <li>Insan kaynaklari / Staj / Fulltime basvuru </li>
                    <li>Gelir / Gider ?</li>
                    <li>Logo</li>
                    <li>Cover Picture?</li>
                    <li>Daha buyuk fontlar ile yukarida sirket adi yazacak.</li>
                    <li>Takip et / Star / address defterime ekle gibi bisey olacak. </li>
                    <li>Bu sayfa Sirketin public sayfasi</li>
                    <li>domain cname ile yonelendirile bilir olmali. sirketAdi.pano.io gibi ---> www.sirketadi.com, cname ile yonlendirildiginde top menu gozukmemeli yada daha kucuk olmali, branding az olmali, ama yinede olmali...</li>
                    <li>Is yapmak istiyorum, yatirim yapmak istiyorum, gibi actionlar olabilir</li>
                    <li>Facebook, google plus, etc linkleri</li>
                    <li>Verdigi hizmetler (Tasarim, muhendislik, danismanlik, creative , etc.)</li>
                    <li>Hakkimizda, vizyon, misyon yazilari</li>
                    <li>Bu sayfadan, gosterilen sirkete puan verilebilinecek.</li>
                    <li>Sayfayi goren kisi, bu sirketi calismak istedigi sirket ler listesine ekliye bilmeli.</li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>