$(document).ready(function() {

    const URL_SEARCH = new URL(location.href);

    $("from-airport").val( URL_SEARCH.searchParams.get("Origem") );
    $("to-airport").val( URL_SEARCH.searchParams.get("Destino") );

    $('#from-airport').blur(function() {
        let partida = $(this).val();
        let palavras = partida.split(' ');
        let origem = [palavras.pop()];
        sigla = origem.toString().replace(/"/g, "").replace(/'/g, "").replace(/\(|\)/g, "");

        console.log(sigla);
    })
    $('#to-airport').blur(function() {
        let destino = $(this).val();
        let saida = destino.split(' ');
        let origem = [saida.pop()];
        siglaDestino = origem.toString().replace(/"/g, "").replace(/'/g, "").replace(/\(|\)/g, "");

        console.log(siglaDestino);
    })

    $('#buscarVoos').on('click', function(e) {

        history.pushState(null, null, "?" + $("form[name=\"formularioBusca\"]").serialize())

        $.ajax({
            url: 'api.php',
            type: 'GET',
            dataType: 'html',
            data: $("form[name=\"formularioBusca\"]").serialize()
        })
        .done(function(data) {
            console.log(data);
            $('#dynamic-content').html('');
            $('#exibeVoos').html(data);
            $('#modal-loader').hide();
        })
        .fail(function() {
            $('#dynamic-content').html('<i class="glyphicon glyphicon-info-sign"></i> Aguarde...');
            $('#modal-loader').hide();
        });
    })
})