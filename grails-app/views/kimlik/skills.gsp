<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="kimlik"/>

</head>

<body>
<g:render template="/kimlik/skillsEditable" model="[profile: profile]"></g:render>


<style type="text/css">
.rateLink {
    margin-right: 3px;
    margin-left: 3px;
}

.selected {
    color: #773317;
    font-size: 15px;
    font-weight: bold;
}

.rateLink:hover, .rateLink:focus, .selected {
    color: #b85026;
    font-size: 15px;
    font-weight: bold;
    outline: 0 !important;
}

.profiles img {
    margin-left: 1px;
    margin-right: 1px;
    margin-bottom: 4px;
}

.thumbnails>li {
    float: left;
    margin-bottom: 5px;
    margin-left: 5px;
}

ul.thumbnails a.remove {
    position: absolute;
    top: -10px;
    right: -5px;

    font-weight: bolder;
    font-size: 20px;
    cursor: alias;
}

.profiles .img {
    position: relative
}


</style>

<div class="separator "></div>

<h2>Yetenek puanlari</h2>


<h5>Bulundugunuz seviye</h5>

<p>Asağıda listelenen konularda bulunduğunuz seviyeyi işaretleyebilirsiniz. Tanıdığınız kişileri kendi bulunduğunuz seviyeye göre gruplayabilirsiniz.
</p>

<h5>Değerlendirme size özeldir</h5>

<p>Yaptiginiz degerlendirmeleri sadece siz gorursunuz. Sizin hakkinizda yapilan degerlendirmelerin kim tarafindan yapildigini goremezsiniz.

<h5>Puan hesaplama da kullanilir</h5>
Baskalarinin sizin hakkiniz da yaptigi degerlendirme sizin o konu
da ne kadar tecrube sahibi oldugunuzu hesaplamaya yardimci olur. <br><strong>Ornek:</strong>  <br>
Eger bir tanisiniz sizi <strong>TASARIM</strong> konusunda kendisinden daha bilgili olarak isaretler ise, ve sizde o kisi icin
kendinizin daha fazla deneyilim oldugunu soylerseniz, <strong>TASARIM</strong> konusunda <strong>puaniniz</strong> artacaktir.
<a href="">daha fazla bilgi icin tiklayin</a>
</p>

<div class="row-fluid" ng-controller="TypeaheadCtrl">
    <div class="span12">
        <g:render template="/kimlik/skill/individual" model="[skill: it]"></g:render>
    </div>
</div>


</body>
</html>
