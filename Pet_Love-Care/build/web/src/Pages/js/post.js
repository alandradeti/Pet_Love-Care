//Envio do formulário de cadastramento Cliente
$(function () {
    $('#formCadastrarCliente').submit(function () {
        $.ajax({
            url: '../Cliente/IncluirCliente.jsp',
            type: 'POST',
            data: $('#formCadastrarCliente').serialize(),
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });

});

//Envio do formulário de cadastramento Veterinario
$(function () {
    $('#formCadastrarVeterinario').submit(function () {
        $.ajax({
            url: '../Veterinario/IncluirVeterinario.jsp',
            type: 'POST',
            data: $('#formCadastrarVeterinario').serialize(),
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});

//Envio do formulário de cadastramento Pet
$(function () {
    $('#formCadastrarPet').submit(function () {
        $.ajax({
            url: '../Pet/IncluirPet.jsp',
            type: 'POST',
            data: $('#formCadastrarPet').serialize(),
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });

});