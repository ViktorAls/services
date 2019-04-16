@extends('layouts.authorization')

@section('content')

    <div class="container">
        <table class="table table-sm table-inverse" id="my-table">
            <thead>
            <tr>
                <th>#</th>
                <th>Пользователь</th>
                <th>Email</th>
                <th>Создан</th>
                <th>Обновлён</th>
                <th>Текущие права</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($users as $key=>$user)
                <tr>
                    <th scope="row">{{$key}}</th>
                    <td> {{$user->name}}</td>
                    <td>{{$user->email}}</td>
                    <td>{{$user->created_at}}</td>
                    <td>{{$user->updated_at}}</td>
                    <td>
                        @foreach($user->roles as $role)
                       {{ $role->name }}
                        @endforeach
                    </td>

                    <td>
                        <a class="dropdown-item" href="{{ route('deleteUsers',$user->id) }}"
                           onclick="event.preventDefault();
                   document.getElementById('deleted').submit();">
                            <i class="fas fa-trash-alt"></i>
                        </a>

                        <form id="deleted" action="{{ route('deleteUsers',$user->id) }}" method="get" style="display: none;">
                            @csrf
                        </form>
                    </td>
                    <td>
                        <a class="roleUpdate" data-id="{{$user->id}}" href="#"><i class="fas fa-pen-alt"></i></a>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>

    <div id="myModalBox" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Заголовок модального окна -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Управление правами пользователя</h4>
                </div>
                <!-- Основное содержимое модального окна -->
                <div class="modal-body">

                </div>
                <!-- Футер модального окна -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Скрипт, вызывающий модальное окно после загрузки страницы -->
@endsection

@section('script')
    <script>
        $('.roleUpdate').on('click',function() {
            ids = $(this).data('id');
            $.ajax({
                url: '/admin/controlUser',
                method: 'post',
                dataType: 'html',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                },
                data: {id:ids},
                success: function (data) {
                    $('.modal-body').empty().append(data);
                    $("#myModalBox").modal('show');
                },
                error: function (data) {
                    alert('a');
                }
            });
        });
    </script>

@endsection



