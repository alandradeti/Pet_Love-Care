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

//Envio do formulário de cadastramento Agendamento
$(function () {
    $('#formCadastrarAgendamento').submit(function () {
        $.ajax({
            url: '../Agendar/IncluirAgendamento.jsp',
            type: 'POST',
            data: $('#formCadastrarAgendamento').serialize(),
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});





/****************************************************************/
/********************                   *************************/
/******************** TRATAMENTO VACINA *************************/
/********************                   *************************/
/****************************************************************/

//Envio do formulário de Cadastramento Vacina
$(function () {
    $('#formCadastrarVacina').submit(function () {
        $.ajax({
            url: '../Vacina/IncluirVacina.jsp',
            type: 'POST',
            data: $('#formCadastrarVacina').serialize(),
            
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});

//Envio do formulário de Alteração Vacina   
$(function () {
    $('#formAlterarDadosVacina').submit(function () {
        $.ajax({
            url: '../Vacina/AlterarVacina.jsp',
            type: 'POST',
            data: $('#formAlterarDadosVacina').serialize(),
            
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});

//Envio do formulário de Exclusão Vacina   
$(function () {
    $('#formExcluirDadosVacina').submit(function () {
        $.ajax({
            url: '../Vacina/ExcluirVacina.jsp',
            type: 'POST',
            data: $('#formExcluirDadosVacina').serialize(),
            
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});


/****************************************************************/
/********************                   *************************/
/******************** TRATAMENTO PRODUTO *************************/
/********************                   *************************/
/****************************************************************/


//Envio do formulário de Exclusão Vacina   
$(function () {
    $('#formCadastrarProduto').submit(function () {
        $.ajax({
            url: '../Produtos/IncluirProduto.jsp',
            type: 'POST',
            data: $('#formCadastrarProduto').serialize(),
            
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});




