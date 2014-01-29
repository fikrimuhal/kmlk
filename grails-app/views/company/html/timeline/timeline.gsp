<!-- hr -->
<style type="text/css">
.animationTest {
    -webkit-transition: all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;
    transition: all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;
}
</style>

<div class="row">
    <div class="col-lg-12">

        <section class="content-sidebar  panel">
            <!-- .main -->
            <section class="main">
                <div class="padder m-t m-b">
                    <button class="btn btn-sm btn-primary pull-right" ng-click="new()">Yeni</button>

                    <div ng-if="entities" class="timeline ">

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
                    <label>Başlık</label>
                    <input type="text" placeholder="Günce başlıği" class="input-sm form-control"
                           ng-model="selected.title">
                    <label class="m-t-mini">Tarih</label>
                    <input type="date" placeholder="1/2/2013" class=" input-sm form-control" ng-model="selected.sDate">
                    <label class="m-t-mini">İçerik</label>
                    <textarea type="text" class="input-sm form-control" placeholder="Kisaca açıklama"
                              ng-model="selected.content"></textarea>
                    <label class="m-t-mini">Tür</label>

                    <div>
                        <div class="btn-group">
                            <button class="btn btn-sm btn-white dropdown-toggle">
                                <span class="dropdown-label"><i
                                        class="fa {{selected.type.icon}}"></i> {{selected.type.friendly || 'Günce Türünü seçiniz'}}
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
                %{--<pre>--}%
                    %{--{{selected | json}}--}%
                %{--</pre>--}%
            </aside>
            <!-- /.sidebar -->
        </section>

    </div>
</div>
<!-- / hr -->


