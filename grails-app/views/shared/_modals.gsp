
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
                    <div class="block">
                        <label class="control-label">Kısaca...</label>
                        <input type="text" class="form-control" placeholder="Konu başlığı">
                    </div>

                    <div class="block">
                        <label class="control-label">Mesaj</label>
                        <textarea class="form-control"
                                  placeholder="Size çok daha iyi hizmet verebilmek için istek, önerileri ve şikayetlerinizi dinliyoruz."
                                  rows="5"></textarea>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Vazgeçtim</button>
                    <button type="button" class="btn btn-sm btn-primary"
                            data-loading-text="Publishing...">Gönder</button>
                </div>
            </div><!-- /.modal-content -->
        </div>
    </form>
</div>
<!-- / .modal -->
