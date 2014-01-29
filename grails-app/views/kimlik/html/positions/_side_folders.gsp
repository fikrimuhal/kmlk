
<aside class="sidebar bg-lighter sidebar-full">
    %{--<div class="text-center clearfix bg-white">--}%%{--<button class="btn btn-sm btn-danger m-t m-b"><i class="icon-edit"></i> Compose</button>--}%%{--</div>--}%
    <div class="list-group list-normal m-b-none">
        <a href="/kimlik/{{user_name}}/positions/inbox" ng-class="{active: $routeSegment.contains('inbox')}" class="list-group-item"><i class="fa fa-inbox"></i><span class="badge m-r">201</span> Yeni Gelen</a>
        <a href="#" class="list-group-item"><i class="fa fa-bookmark-o"></i><span class="badge m-r">201</span> Başvuru Yapıtığınız</a>
        <a href="#" class="list-group-item"><i class="fa fa-trash-o"></i><span class="badge m-r">3</span> Çöp kutusu</a>
        <a href="/kimlik/{{user_name}}/positions/settings"  ng-class="{active: $routeSegment.contains('settings')}" class="list-group-item"><i class="fa fa-cog"></i> Tercihler</a>
        %{--<a href="#" class="list-group-item"><i class="icon-bookmark-empty"></i><span class="badge m-r">4</span> Important</a>--}%
        %{--<a href="#" class="list-group-item"><i class="icon-pencil"></i>Draft</a>--}%
        %{--<a href="#" class="list-group-item"><i class="icon-trash"></i>Trash</a>--}%
        %{--<a href="#" class="list-group-item"><i class="icon-user"></i><span class="badge m-r">23</span> Contacts</a>--}%
    </div>
</aside>