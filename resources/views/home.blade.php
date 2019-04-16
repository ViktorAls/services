@extends('layouts.authorization')

@section('content')

    <style>
        #output {
            display: block;
            text-align: center;
            font-size: 25px;
            width: 260px;;
            color: #b5a9a9;
            border: 1px solid #b5a9a9 !important;;
            border-radius: 5px 5px 0 0;
            padding-top: 50px;
            margin-bottom: 10px;
        }

        .box_add, .blok_img {
            margin-top: 25px;
            position: relative;
        }

        #output img {
            width: 260px; /* you can use % */
            height: 150px;
            object-fit: cover;
            margin-top: -50px;
            border-radius: 5px 5px 0 0;
            object-fit: scale-down;
        }

        #input img {
            width: 100%; /* you can use % */
            height: 150px;
            object-fit: scale-down;
            border-radius: 5px 5px 0 0;

        }

        .text_add-box {
            width: 262px;
            margin-bottom: 12px;
        }

        .blok_img {
            position: relative;
            font-size: 16px;
            line-height: 35px;
            border-radius: 5px 5px 0 0;
        }

        .rewrite, .block_delete {
            font-size: 20px;
            position: absolute;
            color: #fff;
            text-shadow: 0px 0px 16px rgba(150, 101, 46, 0.63);
        }

        .rewrite {

            top: 5px;

            right: 20px;
        }

        .block_delete:hover {
            color: #fff;
            opacity: 0.8;
            cursor: pointer;
        }

        .rewrite:hover {
            opacity: 0.8;
            cursor: pointer;
        }

        .block_delete {

            top: 6px;
            right: 50px;

        }

        .link_block-img {
            display: block;
            width: 260px;
            line-height: 21px;
            word-break: break-all;
            padding-top: 15px;
        }

        .bg_gif {
            width: 100% !important;
            height: 100% !important;
            background-color: rgba(255, 255, 255, 0.66) !important;
            border-radius: 5px 5px 0 0;
        }

        .gif_load {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url("/loader-ajax.gif");
            background-size: 60%;
            background-repeat: no-repeat;
            background-position: center center;

        }

        .row_ilia {
            width: 100%;
            display: flex;
        }

        .col-ilia {
            width: 295px;
        }

        .banner {
            width: auto;
            margin-left: 200px;
        }

        .col-ilia_block {
            width: auto;
            float: left;
            margin-left: 15px;
            margin-bottom: 15px;
        }

        .position_fixed {
            position: fixed;
        }

    </style>
    <div class="container">
        <div class="row_ilia">
            <div class="col-ilia">
                <div class="position_fixed">
                    <div class="box_add">
                 <span id="output" style="height: 150px; border:#00a65a">
                     Изображение
                 </span>
                        <form id="data" enctype="multipart/form-data" method="post">
                            {{csrf_field()}}
                            <input type="file" id="file" class="btn btn-primary pb-2" name="picture_url"/>
                            <input type="text" required name="url" placeholder="Введите URL" style="margin-top: 10px"
                                   class="form-control text_add-box" id="inputSuccess1">
                            <div id="input-data">
                                <button id="btn-send" class="btn btn-primary btn-block">Добавить</button>
                            </div>
                        </form>
                        <div id="input-close" style="margin-top: 10px">
                        </div>
                    </div>
                    <p class="banner-error" style="color: red"><b></b></p>
                </div>
            </div>
            <div class="banner">
                @foreach($banners as $banner)

                    <div class="col-ilia_block block-banner-{{$banner->id}}">
                        <div class="blok_img">
                            <div id="input">
                                <img id="banner-id-{{$banner->id}}" src="/upload/{{$banner->picture_url}}" alt="">
                            </div>
                            <a href="{{$banner->url}}" id="link-id-{{$banner->id}}" class="link_block-img">Ссылка</a>
                            <p>Пользователь: {{ $banner->users->name}}</p>
                            <p data-url="{{$banner->url}}" id="p-id-{{$banner->id}}"
                               data-picture='{{$banner->picture_url}}' data-id="{{$banner->id}}"
                               class="rewrite"><i class="fas fa-pen-alt"></i></p>
                            <p class='block_delete' data-id="{{$banner->id}}"><i class="fas fa-trash-alt"></i></p>
                        </div>
                    </div>

                @endforeach
            </div>
        </div>
    </div>

@endsection
@section('script')
    <script src="/js/banner.js"></script>
@endsection
