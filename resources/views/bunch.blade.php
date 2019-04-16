@extends('layouts.authorization')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div id="pol1" class="row connectedSortable">
                    <?php foreach ($pictures as $picture):?>
                    <div class="col-md-6" data-id="{{$picture->id}}">
                        <img src="/upload/{{$picture->picture_url}}" alt="">
                        <a href="{{$picture->url}}">Ссылка</a>
                    </div>
                    <?php endforeach;?>
                </div>
            </div>
            <div class="col-md-5">
                <div id="pol2" class="row connectedSortable">
                    @if(!empty($userPicture))
                        <?php foreach ($userPicture as $item):?>
                        <div class="col-md-6" data-id="{{$item->id}}">
                            <img src="/upload/{{$item->picture_url}}" alt="">
                            <a href="{{$item->url}}">Ссылка</a>
                        </div>
                        <?php endforeach;?>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script>
        $(function () {
            $("#pol1").sortable({
                connectWith: ".connectedSortable",
            }).disableSelection();
        });
        $(function () {
            let json = [];
            $("#pol2").sortable({
                connectWith: ".connectedSortable",
                update: function (event, ui) {
                    var url = window.location.href;
                    var id = url.substr(url.lastIndexOf('/') + 1);
                    var elem = $('#pol2 .col-md-6.ui-sortable-handle');
                    $.ajax({
                        url: '/add',
                        method: 'post',
                        dataType: 'json',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                        },
                        data: {id:id, json:function(){
                                json.length = 0;
                                for(let i = 0; i < elem.length; i++){
                                    json.push({
                                        id: $(elem[i]).data('id'),
                                    });
                                }

                                return JSON.stringify(json);
                            }},
                        success: function () {
                            console.log('json изменёт успешно.');
                        },
                        error: function () {
                            alert('При изменении произошла ошибка');
                        }
                    })
                }
            }).disableSelection();
        });
    </script>
    @endsection
