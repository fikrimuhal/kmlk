<%--
  Created by IntelliJ IDEA.
  User: sumnulu
  Date: 10/14/13
  Time: 5:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<ol class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="#">Library</a></li>
    <li class="active">Data</li>
</ol>


<div class="page-header">

    <h2>Yeni Şirket</h2>
</div>

<div class="row">
    <div class="col-md-12">
        <p>
            Sayfa açıklaması
        </p>
    </div>
</div>

<div class="row">
    <div class="col-lg-offset-2 col-sm-7">
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="fullName" class="col-lg-3 control-label">Şirketin tam ünvanı</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="fullName"
                           placeholder="Fikrimuhal Teknoloji Araştırma Geliştirme LTD. ŞTİ.">
                    <span class="help-block">Şirketinizin yasal tam adı</span>

                </div>
            </div>

            <div class="form-group">
                <label for="sortName" class="col-lg-3 control-label">Kisa ad</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="sortName" placeholder="Fikrimuhal">
                    <span class="help-block">Yasal olarak kullanılabilecek en kısa adı. genelde 2 kelime sonuna LTD. ŞTİ eklemeyiniz.</span>

                </div>
            </div>

            <div class="form-group">
                <label for="inputPassword12" class="col-lg-3 control-label">Sayfa adi</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="inputPassword12" placeholder="Fikrimuhal">
                    <span class="help-block">Http://kimlik.io/[SAYFA_ADI] şeklinde kullanicak ad. Şirket unvaninin Ilk parcasini kullaniniz. Boşluk Kullanmayiniz</span>
                </div>
            </div>

            <div class="form-group">
                <label for="inputPassword12" class="col-lg-3 control-label">Şirket Türu</label>

                <div class="col-lg-9">
                    <select id="disabledSelect" class="form-control">
                        <option>Lütfen seçiniz...</option>
                        <option>LTD. ŞTİ.</option>
                        <option>A.Ş.</option>
                        <option>Şahıs Şirketi</option>
                        <option>Henüz resmi olarak kurulmadı</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="inputPassword12" class="col-lg-3 control-label">Yetkili kişi</label>

                <div class="col-lg-9">
                    <p class="form-control-static">Ilgaz Şumnulu</p>
                    <span class="help-block">Daha sonra başka kişiler ekleye bilirsiniz, yada yonetici haklarini düzenleye bilirsiniz.</span>
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-offset-3 col-lg-9">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Sözleşmeyi okudum ve anladım
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-offset-3 col-lg-9">
                    <button type="submit" class="btn btn-primary">Şirket Sayfamı Oluştur</button>
                </div>
            </div>
        </form>
    </div>


</div>

</body>
</html>