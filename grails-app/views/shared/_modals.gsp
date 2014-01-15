
<!-- Modal -->
<div class="modal fade" id="AddEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" ng-controller="addEmployeeModalController">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">Lutfent Şirket seçiniz</h4>
            </div>
            <div class="modal-body">

                    <ul class="list-group">
                        <li class="list-group-item {{isActive(c)}}"  ng-repeat="c in companies" ng-click="selectCompany(c)">
                            <div class="media">
                                <span class="pull-left thumb-small m-t-mini">
                                    <i class="fa fa-leaf fa-lg text-default"></i>
                                </span>
                                <div id="todo-1" class="pull-right text-primary m-t-small">
                                    <i class="fa fa-circle fa-lg text text-muted"></i>
                                    <i class="fa fa-refresh fa-spin fa-lg text-active text-primary"></i>
                                </div>
                                <div class="media-body">
                                    <div><a href="#"  class="h5">{{c.name.significantPart}}</a></div>
                                    <small class="text-muted">{{c.name.fullLegal}}</small>
                                </div>
                            </div>
                        </li>



                    </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">İptal</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- .modal -->
<div id="modal" class="modal fade">
    <form class="m-b-none">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-remove"></i></button>
                    <h4 class="modal-title" id="myModalLabel">Geri bildirim ve İstekler</h4>
                </div>

                <div class="modal-body">

                    <div class="container text-center">
                        <h2 class="font-thin">Tekrar merhaba ve teşekkürler,</h2>

                        <div class="row">

                            <div class="col-lg-offset-3 col-lg-6 font-thin">

                                <i class="fa fa-quote-left fa-2x pull-left"></i>
                                <i class="fa fa-quote-right fa-2x pull-right"></i>

                                Kimlik.Io şu anda test asamasindadır.
                                Üye olduktan sonra facebook grubumuza katılıp,
                                bizim ile olmasını istediğiniz özellikler yada karşılaştığınız hatalar hakkında sohbet edebilirsiniz,
                                yada herhangi başka bir konu hakkında.

                                <br/>

                            </div>
                        </div>

                        <p>&nbsp;</p>
                        <a href="https://www.facebook.com/groups/kimlik.io/" target="_blank" class="text-primary"><i class="fa fa-users"></i><br>Sorularınız için Facebook grubu</a>

                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Kapat</button>
                    <a target="_blank"  href="https://www.facebook.com/groups/kimlik.io/" class="btn btn-sm btn-primary">Destek Sayfası</a>
                </div>
            </div><!-- /.modal-content -->
        </div>
    </form>
</div>
<!-- / .modal -->
