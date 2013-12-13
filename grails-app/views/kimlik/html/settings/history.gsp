<section class="content-sidebar m-t-n m-b-n">
    <!-- .main -->
    <section class="main">
        <div class="padder m-t m-b">
            <div class="pull-right">
                <button class="btn btn-sm btn-primary" ng-click="new()">Yeni</button>

            </div>
            <div class="pull-left">
                <button class="btn btn-sm btn-default ">Sosyal Hesaplarim ile Eşleştir</button>


            </div>

            <div class="timeline ">

                <article  class=" timeline-item" ng-repeat="e in entities %{--| orderBy:'1':false--}%"
                          ng-class-even="'alt'">
                    <div class="timeline-caption">
                        <div class="panel arrow animationTest" ng-class-odd="'arrow-left'" ng-class-even="'arrow-right'"
                             ng-class="isEntitySelected(e)" ng-click="edit(e)">
                            <span class="timeline-icon"><i
                                    class="fa time-icon {{getType(e).icon + ' ' + getType(e).color}}"></i>
                            </span>
                            <span class="timeline-date">{{e.sDate}} <br/>
                                <a ng-click="edit(e)" href="#" ><i
                                        class="fa fa-pencil-square-o"></i>düzenle</a>
                            </span>
                            <h5>
                                <span>{{getType(e).friendly}}</span>
                                {{e.title}}
                            </h5>

                            <p>{{e.content}}</p>
                        </div>
                    </div>
                </article>


                <div class="timeline-footer"><a href="#"><i
                        class="fa fa-plus time-icon inline-block bg-default"></i></a></div>
            </div>


        </div>
    </section>
    <!-- /.main -->



    <!-- .sidebar -->
    <aside class="sidebar sidebar-large bg-lighter padder clearfix">
        <h5>Günce</h5>

        <div class="line"></div>

    <form>
        <label>Kurum</label>
        <input type="text" placeholder="Şirket yada  Okul adı" class="input-sm form-control"
               ng-model="selected.data.entity">

        <label class="m-t-mini">Baslangıç Tarihi</label>
        <input type="date"  class=" input-sm form-control" ng-model="selected.data.startDate">

        <label class="m-t-mini">Pozisyon / Bölüm</label>
        <input type="text" placeholder="Pozisyon adı, yada bölüm" class="input-sm form-control"
               ng-model="selected.data.position">

        <label class="m-t-mini">Tür</label>

        <div>
            <div class="btn-group">
                <button class="btn btn-sm btn-white dropdown-toggle">
                    <span class="dropdown-label"><i
                            class="fa {{getType(selected).icon}}"></i> {{getType(selected).friendly || 'Günce Türünü seçiniz'}}
                    </span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu dropdown-select ">
                    <li ng-repeat="t in availableTypes"><a href="#" ng-click="doSelectType(t)"><input
                            type="radio" name="d-s-r"/><i class="fa {{t.icon}}"></i> {{t.friendly}}</a></li>
                </ul>
            </div>
        </div>
        <label class="m-t-mini">Görünürlük</label>
        <div class="checkbox">

            <label>
                <input type="checkbox" ng-model="selected.visible">
                Herkez tarafından görülebilinir
            </label>
        </div>

        <div class="m-t"><button class="btn btn-sm btn-info"
                                 ng-click="save(selected)">Kaydet</button> <button
                class="btn btn-sm btn-danger" ng-click="doDelete(selected)">Sil</button></div>
    </form>

</aside>
    <!-- /.sidebar -->
</section>

<pre>
    {{entities | json}}
</pre>