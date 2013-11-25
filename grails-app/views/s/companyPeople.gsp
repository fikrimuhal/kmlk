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
    <li><a href="/company" class="glyphicons home"><i></i> Fikrimuhal</a></li>
    <li class="divider"><i class="fa fa-caret-right"></i></li>
    <li><a href="/company/people">Çalışanlar</a></li>
</ul>

<h3>Kişiler</h3>
<p>Sirket calisanlari, eski calisnalar, yetenek havuzu</p>

<!-- Row -->
<div class="row-fluid">

    <!-- Thumbnails -->
    <ul class="thumbnails">

        <!-- Column -->
        <li class="span4">

            <!-- Thumbnail -->
    <div class="thumbnail widget-thumbnail" onclick="document.location.href = '/company/people/ilgaz'" style="cursor: hand;">
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

                    <p>Bilkent İşletme mezunu. Bir süre finans sektöründe çalıştı. Rakamları pek bir seviyor.                    </p>

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




<div class="innerLR widget widget-heading-simple widget-body-white">
    <div class="widget-head">
        <h4 class="heading">TODO:</h4>
    </div>
    <div class="widget-body">
        <div class="row-fluid">
            <div class="span9">
                <ul>
                    <li>Sirket calisan listesi</li>
                    <li>Eski calisanlarin listesi</li>
                    <li>Yeni calisan ekle</li>
                    <li>Calisani eski olarak isaretle</li>
                    <li>Calisanlar sisteme kayitli profili olan kisiler</li>
                    <li>Yeni calisan ekle: Email adresi ile davetiye gondrilip kayit edilebilinecek.</li>
                    <li>Freelance calisan listesi</li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>