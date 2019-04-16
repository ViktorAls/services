<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">Навигация</li>
            <li><a href="{{route('home')}}"><i class="fa fa-book"></i> <span>Свои банеры</span></a></li>
            <li><a href="{{route('fullBanner')}}"><i class="fa fa-book"></i> <span>Связка банеров</span></a></li>
            @can(['manager'])
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>Менеджер</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="{{route('managerBanner')}}"><i class="fa fa-circle-o"></i>Управлене банерами</a></li>
                </ul>
            </li>
            @endcan
            @can(['admin'])
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-laptop"></i>
                    <span>Администратор</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="{{route('fullUsers')}}"><i class="fa fa-circle-o"></i>Управление пользователями</a></li>
                    <li><a href="{{route('managerBanner')}}"><i class="fa fa-circle-o"></i>Управлене банерами</a></li>
                </ul>
            </li>
            @endcan

            <li class="header">Документация</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
