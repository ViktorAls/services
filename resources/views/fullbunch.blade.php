@extends('layouts.authorization')

@section('content')

<div class="container">
    <table class="table table-sm table-inverse" id="my-table">
        <thead>
        <tr>
            <th>#</th>
            <th>Домен</th>
            <th>Ключ</th>
            <th>Создан</th>
            <th>Обновлён</th>
            <th><div id="addBunch" class="btn btn-adn">Добавить</div></th>
        </tr>
        </thead>
        <tbody>
       @foreach ($connections as $key=>$connection)
        <tr>
            <th scope="row">{{$key}}</th>
            <td class="domains" data-id="{{$connection->id}}" >{{$connection->domains}}</td>
            <td>{{$connection->key}}</td>
            <td>{{$connection->created_at}}</td>
            <td>{{$connection->updated_at}}</td>
            <td>
                <a class="dropdown-item" href="{{ route('deletebunch',$connection->id) }}"
                   onclick="event.preventDefault();
                   document.getElementById('deleted').submit();">
                    <i class="fas fa-trash-alt"></i>
                </a>

                <form id="deleted" action="{{ route('deletebunch',$connection->id) }}" method="get" style="display: none;">
                    @csrf
                </form>
                <a href="{{route('bunch',['id'=>$connection->id])}}"><i class="fas fa-pen-alt"></i></a>
            </td>
        </tr>
       @endforeach
        </tbody>
    </table>
</div>

@endsection

@section('script')

    <script>
        $(document).ready(function() {

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                method: 'post',
            });
            $('.domains').editable({
                model: 'inline',
                type:  'text',
                pk:    function(){
                    return $(this).data('id')
                },
                name:  'domains',
                url:   '/editing',
                title: 'Введите доменное имя'
            });

        });
        $('#addBunch').on('click', function (e) {
                let domains = prompt('Введите доменное имя сайта, для создания, оно необходимо только для проверки.', '');
                if (domains !== null) {
                    $.ajax({
                        url: '/connection',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        method: 'post',
                        dataType: 'json',
                        data: {'domains':domains},
                        success: function () {
                            location.reload()
                        },
                        error: function (data) {
                            alert('При добавлении произошла ошибка, возможно, нет доступа к сайту.');
                        }
                    })
                }
            }
        )
    </script>
@endsection


