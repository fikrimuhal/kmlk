<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Şirket Listesi
            </header>

            <div class="panel-body">
                <div class="row text-small">
                    <div class="col-sm-4 m-b-mini">
                        <select class="input-sm inline form-control" style="width:130px">
                            <option value="0">Bulk action</option>
                            <option value="1">Delete selected</option>
                            <option value="2">Bulk edit</option>
                            <option value="3">Export</option>
                        </select>
                        <button class="btn btn-sm btn-white">Apply</button>
                    </div>

                    <div class="col-sm-4 m-b-mini">

                    </div>

                    <div class="col-sm-4">
                        <div class="input-group">
                            <input type="text" class="input-sm form-control" placeholder="Search">
                            <span class="input-group-btn">
                                <button class="btn btn-sm btn-white" type="button">Go!</button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-striped b-t text-small">
                    <thead>
                    <tr>
                        <th width="20"><input type="checkbox"></th>
                        <th class="th-sortable" data-toggle="class">Şirket
                        %{--<span class="th-sort">--}%
                        %{--<i class="fa fa-sort-down text"></i>--}%
                        %{--<i class="fa fa-sort-up text-active"></i>--}%
                        %{--<i class="fa fa-sort"></i>--}%
                        %{--</span>--}%
                        %{--</th>--}%
                        <th>Owner</th>
                        <th>Email</th>
                        <th>Web</th>
                        <th width="30"></th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr ng-repeat="company in companies" title="{{company.name.fullLegal}}">
                        <td><input type="checkbox" name="post[]" value="2"></td>
                        <td><a target="_self" href="/company/profile/{{company.name.pageName}}">{{company.name.significantPart}} {{company.last_name}}</a></td>
                        <td><a href="/kimlik/profile/{{company.owner}}">{{company.owner}}</a></td>
                        <td>{{company.email}}</td>
                        <td>{{company.www}}</td>
                        <td>
                            <a href="#" class="active" data-toggle="class"><i
                                    class="fa fa-ok icon-large text-success text-active"></i><i
                                    class="fa fa-remove icon-large text-danger text"></i></a>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <footer class="panel-footer">
                <div class="row">
                    <div class="col-sm-4 hidden-xs">
                        <select class="input-sm inline form-control" style="width:130px">
                            <option value="0">Bulk action</option>
                            <option value="1">Delete selected</option>
                            <option value="2">Bulk edit</option>
                            <option value="3">Export</option>
                        </select>
                        <button class="btn btn-sm btn-white">Apply</button>
                    </div>

                    <div class="col-sm-3 text-center">
                        <small class="text-muted inline m-t-small m-b-small">Toplam {{table.totalItems}} şirket</small>
                    </div>

                    <div class="col-sm-5 text-right text-center-sm">
                        <pagination total-items="table.totalItems"
                                    page="table.currentPage"
                                    on-select-page="selectPage(page)"
                                    max-size="table.maxSize"
                                    class="pagination pagination-small m-t-none m-b-none"
                                    boundary-links="true"
                                    rotate="true"
                                    items-per-page="table.itemsPerPage"
                                    num-pages="table.numberOfPages"
                                    previous-text="&lsaquo;"
                                    next-text="&rsaquo;"
                                    first-text="&laquo;"
                                    last-text="&raquo;"></pagination>
                    </div>
                </div>
            </footer>
        </section>
    </div>
</div>