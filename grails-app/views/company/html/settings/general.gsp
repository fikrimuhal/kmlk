
<div class="pull-right">Current route: <span ng-bind="$routeSegment.name"></span></div>

<div class="row">
    <div class="col-sm-6">
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
                    <span class="help-block">Yasal olarak kullanılabilecek en kısa adı. genelde 2 kelime sonuna LTD. ŞTİ eklemeyiniz. </span>

                </div>
            </div>

            <div class="form-group">
                <label for="inputPassword1" class="col-lg-3 control-label">Sayfa adi</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="inputPassword12" placeholder="Fikrimuhal">
                    <span class="help-block">Http://kimlik.io/[SAYFA_ADI] şeklinde kullanicak ad. Şirket unvaninin Ilk parcasini kullaniniz. Boşluk Kullanmayiniz</span>
                </div>
            </div>

            <div class="form-group">
                <label for="inputPassword1" class="col-lg-3 control-label">Şirket Türu</label>

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
                <label for="inputPassword1" class="col-lg-3 control-label">Yetkili kişi</label>

                <div class="col-lg-9">
                    <p class="form-control-static">Ilgaz Şumnulu</p>
                    <span class="help-block">Daha sonra başka kişiler ekleye bilirsiniz, yada yonetici haklarini düzenleye bilirsiniz.</span>
                </div>
            </div>
        </form>
    </div>




</div>

