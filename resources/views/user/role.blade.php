<div class="row">
    <div class="col-md-5"><p><b>Права текущего пользователя:</b></p></div>
    <div class="col-md-4">
            <select class="js-role" name="states[]" multiple="multiple">
            </select>
    </div>
</div>
<script>

    $(document).ready(function () {
        var data = @json($json);
        var idUser = <?=$user->id?>;
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $('.js-role').on('select2:unselect', function (e) {
            $.post('/admin/deleteRole', {
                'idRole': e.params.data.id,
                'idUser': idUser,
            });
        });
        $('.js-role').trigger(':select2:unselect'); // Notify only Select2 of changes
        $('.js-role').on('select2:select', function (e) {
            $.post('/admin/addRole', {
                'idRole': e.params.data.id,
                'idUser': idUser,
            });
        });
        $('.js-role').trigger(':select2:select'); // Notify only Select2 of changes
        $('.js-role').select2(
            {
                placeholder: 'Задате правила пользователю',
                allowClear: true,
                maximumSelectionLength: 2,
                data: data,
                language: 'ru',
                width: '300px'
            });
    });
</script>

