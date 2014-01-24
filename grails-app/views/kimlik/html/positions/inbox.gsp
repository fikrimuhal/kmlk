<!-- .sidebar -->
<g:render template="/kimlik/html/positions/side_folders"></g:render>
<!-- /.sidebar -->

    <!-- .sidebar -->
<g:render template="/kimlik/html/positions/side_positions"></g:render>
<!-- /.sidebar -->
<!-- .main -->
<section class="main">
<div class="bg-primary clearfix padder m-b">
    <h3 class="m-b">__Position Title__ + __Company_short_name__</h3>
</div>

<div class="text-small padder">
<div class="block clearfix">
    <a href="#" class="thumb-mini inline"><img src="images/avatar.jpg" class="img-circle">
    </a> Fikrimuhal Teknoloji Şti. Ltd.
&lt;<a href="#">profil sayfası</a>&gt;
    <div class="pull-right inline">May 12 (<em>4 days ago</em>)
        <a href="#" data-toggle="class"><i class="fa fa-star-o text-muted fa-lg text"></i><i
                class="fa fa-star text-warning fa-lg text-active"></i></a>

        <div class="btn-group">
            <button class="btn btn-white btn-xs" data-toggle="tooltip" data-title="Reply"
                    data-original-title="" title=""><i class="fa fa-reply"></i></button>
            <button class="btn btn-white btn-xs dropdown-toggle" data-toggle="dropdown"><span
                    class="caret"></span></button>
            <ul class="dropdown-menu pull-right">
                <li><a href="#"><i class="fa fa-reply"></i> Reply</a></li>
                <li><a href="#"><i class="fa fa-signout"></i> Forward</a></li>
                <li><a href="#">Add Mika Sokeil to contact list</a></li>
                <li><a href="#">Mark as unread</a></li>
                <li class="divider"></li>
                <li><a href="#">Delete this message</a></li>
                <li><a href="#">Report spam</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="row main-position">
    <div class="col-lg-8">
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

    <div class="col-lg-4">
        <span class="">{{it.position.sallary}} TL /ay</span>  <br/>
        <span class=""><b>Genel Puan</b> 65 %</span>  <br/>
        <button>Burada çalışmak istiyorum</button>  <br/>
        <button ng-click="notInterested(it)">İlgilenmiyorum</button>  <br/>
        <button ng-click="toggleDetails(it)">Detaylar</button>  <br/>
        <!-- Button to trigger modal -->

    </div>
</div>

<div class="row details-position">
    <div class="col-lg-12">
        <div class="positionDetails">
            <h5>Pozisyon hakkında</h5>
            <span>__ {{it.position.about}} __</span> <br/>

        </div>

        <div class="skills">
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

        <div class="employees">
            <h5>Çalışanlar <small>Toplam 6 çalışan</small></h5>
            <ul class="thumbnails">
                <li class="col-lg-4">
                    <div class="thumbnail">
                        <img data-src="holder.js/300x200" alt="300x200"
                             style="width: 300px; height: 200px;"
                             >

                        <div class="caption">
                            <h4>Ilgaz şumnulu</h4>
                        </div>
                    </div>
                </li>
                <li class="col-lg-4">
                    <div class="thumbnail">
                        <img data-src="holder.js/300x200" alt="300x200"
                             style="width: 300px; height: 200px;"
                             >

                        <div class="caption">
                            <h4>Thumbnail label</h4>
                        </div>
                    </div>
                </li>
                <li class="col-lg-4">
                    <div class="thumbnail">
                        <img data-src="holder.js/300x200" alt="300x200"
                             style="width: 300px; height: 200px;"
                             >

                        <div class="caption">
                            <h4>Thumbnail label</h4>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="companyPictures">
            <h5>Şirket Fotoğrafları</h5>

            <ul class="thumbnails">
                <li class="col-lg-4">
                    <div class="thumbnail">
                        <img data-src="holder.js/300x200" alt="300x200"
                             style="width: 300px; height: 200px;"
                             >

                        <div class="caption">
                            <h4>Ilgaz şumnulu</h4>
                        </div>
                    </div>
                </li>
                <li class="col-lg-4">
                    <div class="thumbnail">
                        <img data-src="holder.js/300x200" alt="300x200"
                             style="width: 300px; height: 200px;"
                             >

                        <div class="caption">
                            <h4>Thumbnail label</h4>
                        </div>
                    </div>
                </li>
                <li class="col-lg-4">
                    <div class="thumbnail">
                        <img data-src="holder.js/300x200" alt="300x200"
                             style="width: 300px; height: 200px;"
                             >

                        <div class="caption">
                            <h4>Thumbnail label</h4>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="sirketHakkında">
            <h5>Şirket hakkında</h5>
            <span>{{it.company.bio}}</span> <br/>

        </div>

        <div class="contact">
            <h5>İletişim</h5>
            email: <span>{{it.company.email}}</span> <br/>
            tel: <span>{{it.company.tel}}</span> <br/>
            www: <span><a href="{{it.company.www}}">{{it.company.www}}</a></span> <br/>
            <h6>social</h6>
            <a href="{{it.company.facebook.profileUrl}}">facebook</a><br/>
            <a href="{{it.company.twitter.profileUrl}}">twitter</a><br/>
            <a href="{{it.company.linkedin.profileUrl}}">linkedin</a><br/>
        </div>

        <div class="aboutOffice">
            <h5>Ofis Hakkında</h5>
            <ul>
                <li>Playstation</li>
                <li>HIFI</li>
                <li>Langırt</li>
            </ul>
        </div>

        <div class="location">
            <h5>Ofis Hakkında</h5>
            <ul>
                <li>Playstation</li>
                <li>HIFI</li>
                <li>Langırt</li>
            </ul>
        </div>
    </div>


    <!--{{it| json}} -->
</div>


<div class="padder">
    <form class="panel text-small">
        <div class="panel-body">Click here to <a href="#">Reply</a> or <a href="#">Forward</a></div>
    </form>
</div>
</section>

<!-- /.main -->

%{--






<div ng-controller="positionInboxController">
    <div class="separator line"></div>


    <div class="heading-buttons">
        <h3 class="glyphicons settings"><i></i>İlgili Şirket & Pozisyonlar
        </h3>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div ng-repeat="it in inbox" ng-cloak>
                <div class="separator line"></div>

                <div class="row main-position">
                    <div class="col-lg-8">
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

                    <div class="col-lg-4">
                        <span class="">{{it.position.sallary}} TL /ay</span>  <br/>
                        <span class=""><b>Genel Puan</b> 65 %</span>  <br/>
                        <button>Burada çalışmak istiyorum</button>  <br/>
                        <button ng-click="notInterested(it)">İlgilenmiyorum</button>  <br/>
                        <button ng-click="toggleDetails(it)">Detaylar</button>  <br/>
                        <!-- Button to trigger modal -->

                    </div>
                </div>

                <div class="row details-position" ng-if="isDetailsVisible(it)">
                    <div class="col-lg-12">
                        <div class="positionDetails">
                            <h5>Pozisyon hakkında</h5>
                            <span>{{it.position.about}}</span> <br/>

                        </div>

                        <div class="skills">
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

                        <div class="employees">
                            <h5>Çalışanlar <small>Toplam 6 çalışan</small></h5>
                            <ul class="thumbnails">
                                <li class="col-lg-4">
                                    <div class="thumbnail">
                                        <img data-src="holder.js/300x200" alt="300x200"
                                             style="width: 300px; height: 200px;"
                                             >

                                        <div class="caption">
                                            <h4>Ilgaz şumnulu</h4>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-lg-4">
                                    <div class="thumbnail">
                                        <img data-src="holder.js/300x200" alt="300x200"
                                             style="width: 300px; height: 200px;"
                                             >

                                        <div class="caption">
                                            <h4>Thumbnail label</h4>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-lg-4">
                                    <div class="thumbnail">
                                        <img data-src="holder.js/300x200" alt="300x200"
                                             style="width: 300px; height: 200px;"
                                             >

                                        <div class="caption">
                                            <h4>Thumbnail label</h4>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="sirketHakkında">
                            <h5>Şirket hakkında</h5>
                            <span>{{it.company.bio}}</span> <br/>

                        </div>

                        <div class="contact">
                            <h5>İletişim</h5>
                            email: <span>{{it.company.email}}</span> <br/>
                            tel: <span>{{it.company.tel}}</span> <br/>
                            www: <span><a href="{{it.company.www}}">{{it.company.www}}</a></span> <br/>
                            <h6>social</h6>
                            <a href="{{it.company.facebook.profileUrl}}">facebook</a><br/>
                            <a href="{{it.company.twitter.profileUrl}}">twitter</a><br/>
                            <a href="{{it.company.linkedin.profileUrl}}">linkedin</a><br/>
                        </div>

                        <div class="aboutOffice">
                            <h5>Ofis Hakkında</h5>
                            <ul>
                                <li>Playstation</li>
                                <li>HIFI</li>
                                <li>Langırt</li>
                            </ul>
                        </div>

                        <div class="location">
                            <h5>Ofis Hakkında</h5>
                            <ul>
                                <li>Playstation</li>
                                <li>HIFI</li>
                                <li>Langırt</li>
                            </ul>
                        </div>
                    </div>


                    <!--{{it| json}} -->
                </div>
            </div>
        </div>

    </div> --}%
%{--row--}%%{--


    <!--suppress CheckValidXmlInScriptTagBody -->
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
--}%
