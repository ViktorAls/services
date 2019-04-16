//Отображение загруженной картинки
function handleFileSelect(evt) {
    var file = evt.target.files; // FileList object
    var f = file[0];
    // Only process image files.
    if (!f.type.match('image.*')) {
        alert("Image only please....");
        $('#output').empty().append('Изображение');
        document.getElementById("data").reset();
        return false;
    }
    var reader = new FileReader();
    // Closure to capture the file information.
    reader.onload = (function (theFile) {
        return function (e) {
            // Render thumbnail.
            var span = document.createElement('span');
            span.innerHTML = ['<img class="thumb resize" title="', escape(theFile.name), '" src="', e.target.result, '" />'].join('');
            document.getElementById('output').innerHTML = '';
            document.getElementById('output').insertBefore(span, null);
        };
    })(f);
    // Read in the image file as a data URL.
    reader.readAsDataURL(f);
}

document.getElementById('file').addEventListener('change', handleFileSelect, false);

// установка url для загрузки ajax
let url = '/FileUpload';

// url если сбосили изменение
function fileUpload() {
    url = '/FileUpload';
    $('#image_update').remove();
    document.getElementById("data").reset();
    $('#output').html('Изображение');
    $('#close-button').remove();
    $('#btn-send').html('Добавить');
}

let global_id = null;

function blockDelete() {
    $('.block_delete').click(function () {
        let  ids = $(this).data('id');
        $.ajax({
            url: '/deleteBanner',
            method: 'post',
            dataType: 'json',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
            },
            data: {id:ids},
            success: function (data) {
                $('.block-banner-' +ids).stop().animate({
                        height: "0px", // высоту к нулю
                        width: "0px", // высоту к нулю
                        opacity: 0, // прозрачность к нулю
                    }, 600, function () {
                        $(this).remove(); // удаляем из DOM (если требуется, если же нет, то "закомментируйте" эту строку)
                    }
                );
            },
            error: function (data) {
               alert('При удалении произошла ошибка');
            }
        });
    });
}

// функция регистрации события для редактирования
function clicks() {
    $('.rewrite').click(function (e) {
        document.getElementById("data").reset();
        url = '/FileUpdate';
        closeButton();
        $('#inputSuccess1').val($(this).data('url'));
        $('#output').empty().append('<img id="image_update" src="/upload/' + $(this).data('picture') + '" alt="">');
        global_id = $(this).data('id');
    });
}

// добавить кнопку закрытия
function closeButton() {
    if ($("button").is("#close-button") === false) {
        $("#input-close").append('<button id="close-button" class="btn btn-primary btn-block" onclick="FileUpload();" >Сбросить</button>');
        $('#btn-send').html('Изменить');
    }
}

// при добавлении отображение блоков
function htmlUpload(data) {
    var html = [
        '<div class="col-md-3">',
        '<div class="blok_img">',
        '<div id="input">',
        '<img id="banner-id-' + data.id + '" src="/upload/' + data.picture_url + '" alt="">',
        '</div>',
        '<a id="link-id-' + data.id + '" href="' + data.url + '" class="link_block-img">Ссылка</a>',
        '<p id="p-id-' + data.id + '" data-url="' + data.url + '" data-picture=' + data.picture_url + ' data-id="' + data.id + '" class="rewrite"><i class="fas fa-pen-alt"></i></p>',
        '<p class="block_delete" data-id="' + data.id + '"><i class="fas fa-trash-alt"></i></p>',
        '</div>',
        '</div>'].join('');
    $('#output').empty().append('Изображение');
    document.getElementById("data").reset();
    $(".banner").append(html);
    blockDelete();
    clicks();
}

function deleteMessageError() {
    if ($("p").is("#banner-error")) {
        $("#banner-error").remove();
    }
}

//при изменении, изменить вид блока
function htmlUpdate(data) {
    $('#banner-id-' + data.id).attr('src', '/upload/' + data.picture_url);
    $('#link-id-' + data.id).attr('href', data.url);
    $('#p-id-' + data.id).data('url', data.url).attr('data-url', data.url);
    $('#p-id-' + data.id).data('picture_url', data.picture_url).attr('data-picture_url', data.picture_url)
    $('#output').empty().append('Изображение');
    document.getElementById("data").reset();
    fileUpload();
}


$(document).ready(function () {

    //регистрация делита
    blockDelete();
    // регистрация
    clicks();
    // AJAX для изменения и редактирования
    $('#data').on('submit', function (e) {
            deleteMessageError();
            e.preventDefault();
            let $that = $(this);
            let formData = new FormData($that.get(0));
            $.ajax({
                url: url,
                method: 'post',
                dataType: 'json',
                contentType: false,
                processData: false,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                    'id': global_id
                },
                beforeSend: function () {
                    $(".box_add").append('<div class="gif_load bg_gif"></div>');
                },
                data: formData,
                success: function (data) {
                    if (url === '/FileUpload') {
                        htmlUpload(data);
                    } else if (url === '/FileUpdate') {
                        htmlUpdate(data);
                    }
                    $(".gif_load ").remove();
                },
                error: function (data) {
                    alert(data.message);
                    if (data.message === undefined) {
                        data.message = 'При обработке произошла ошибка';
                    }
                    $(".gif_load ").remove();
                    $('.banner-error').empty().append('<b>' + data.message + '</b>');
                }
            })
        }
    )
});

