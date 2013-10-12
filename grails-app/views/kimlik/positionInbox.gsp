<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="kimlik"/>

</head>

<body>
<div ng-controller="positionInboxController">
    <div class="separator line"></div>


    <div class="heading-buttons">
        <h3 class="glyphicons settings"><i></i>İlgili Şirket & Pozisyonlar
        </h3>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <div ng-repeat="it in inbox" ng-cloak>
                <div class="separator line"></div>

                <div class="row-fluid main-position">
                    <div class="span8">
                        <h4>{{it.company.short_name}}</h4>
                        Position title: <span>{{it.position.title}}</span> <br/>
                        Yer: <span>Istanbul / Çekmeköy (4km)</span><br/>
                        sektor: <span class="label" style="margin-right: 3px;">{{it.company.industry}}</span>   <br/>
                        etiketler: <span ng-repeat="tag in it.company.tags" class="label"
                                         style="margin-right: 3px;">{{tag}}</span>  <br/>
                        skill match: <span>67 %</span> <br/>
                        Eğitim Tecrube: <span>+210 %</span> <br/>
                        Çalışma ortamı: <span><a href="#">7x</a></span> <br/>
                    </div>

                    <div class="span4">
                        <span class="">{{it.position.sallary}} TL /ay</span>  <br/>
                        <span class=""><b>Genel Puan</b> 65 %</span>  <br/>
                        <button>Burada çalışmak istiyorum</button>  <br/>
                        <button ng-click="notInterested(it._id)">İlgilenmiyorum</button>  <br/>
                        <button ng-click="toggleDetails(it._id)">Detaylar</button>  <br/>
                        <!-- Button to trigger modal -->

                    </div>
                </div>

                <div class="row-fluid details-position" ng-if="isDetailsVisible(it._id)">
                    <div class="span6">
                        <h5>Gereksimler</h5>

                        <div>
                            <table class="table table-condensed">
                                <tbody>
                                  <tr>
                                      <td class="right muted">skill</td>
                                      <td></td>
                                      <td>fark</td>
                                  </tr>
                                <tr>
                                    <td class="right muted">skillName</td>
                                    <td class="w-70">
                                        <progress percent="55" class="progress-info"></progress>
                                    </td>
                                    <td><span class="text-info">-10%</span></td>
                                </tr>
                                <tr>
                                    <td class="right muted">skillName</td>
                                    <td class="w-70">
                                        <progress percent="89" class="progress-info"></progress>

                                    </td>
                                    <td><span class="text-success">+5%</span></td>
                                </tr>

                                </tbody>
                            </table>
                        </div>

                    </div>

                    <div class="span6"></div>

                    <div class="row-fluid">
                        <div class="span12">
                            <pre>
                                {{it| json}}
                            </pre>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div> %{--row--}%


    <script type="text/ng-template" id="positionNotInterestedModal.html">
        <div class="modal-header">
            <h3>Bu ilanı beğenmedim çünkü,</h3>
            <span>Size daha dogru sonuc gostermek için sizce doğru olan seçenekleri işaretleyiniz.</span>
        </div>
        <div class="modal-body">
            <ul>
                <li><label class="checkbox"><input type="checkbox"> Şirketi beğenmedim</label></li>
                <li><label class="checkbox"><input type="checkbox"> Pozisyonu beğenmedim</label></li>
                <li><label class="checkbox"><input type="checkbox"> Düşük maaş</label></li>
                <li><label class="checkbox"><input type="checkbox"> Çalışma ortamı iyi değil</label></li>
                <li><label class="checkbox"><input type="checkbox"> Şirket yeri uygun değil</label></li>
                <li><label class="checkbox"><input type="checkbox"> Şirketin ürun/hizmetleri ilgimi çekmedi</label></li>
            </ul>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" ng-click="ok()">Kaydet</button>
            <button class="btn btn-warning" ng-click="cancel()">Vazgectim</button>
        </div>
    </script>
</div>

</body>
</html>
