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
                window.location.href = "../Home/Home.jsp";
            }
        });
        return false;
    });
});

/****************************************************************/
/********************                   *************************/
/******************** TRATAMENTO PET 	*************************/
/********************                   *************************/
/****************************************************************/

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

//Envio do formulário de Alteração Pet  
$(function () {
    $('#formAlterarDadosPet').submit(function () {
        $.ajax({
            url: '../Pet/AlterarPet.jsp',
            type: 'POST',
            data: $('#formAlterarDadosPet').serialize(),
            
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});

//Envio do formulário de Exclusão Pet  
$(function () {
    $('#formExcluirDadosPet').submit(function () {
        $.ajax({
            url: '../Pet/ExcluirPet.jsp',
            type: 'POST',
            data: $('#formExcluirDadosPet').serialize(),
            
            success: function (data) {
                alert("Funcionou");
                window.location.href = "../Home/Home.jsp";
            }
        });
        return false;
    });
});


/****************************************************************/
/********************                   	 ********************/
/******************** TRATAMENTO VETERINARIO ********************/
/********************                   	 ********************/
/****************************************************************/

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

//Envio do formulário de Alteração Veterinario ;
$(function () {
    $('#formAlterarDadosVeterinario').submit(function () {
        $.ajax({
            url: '../Veterinario/AlterarVeterinario.jsp',
            type: 'POST',
            data: $('#formAlterarDadosVeterinario').serialize(),
            
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});

//Envio do formulário de Exclusão Veterinario  
$(function () {
    $('#formExcluirDadosVeterinario').submit(function () {
        $.ajax({
            url: '../Veterinario/ExcluirVeterinario.jsp',
            type: 'POST',
            data: $('#formExcluirDadosVeterinario').serialize(),
            
            success: function (data) {
                alert("Funcionou");
                window.location.href = "../Home/Home.jsp";
            }
        });
        return false;
    });
});

/****************************************************************/
/********************                   *************************/
/******************** TRATAMENTO PRODUTO ************************/
/********************                   *************************/
/****************************************************************/


//Envio do formulário de Incluir Produto  
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



//Envio do formulário de Alterar Produto
$(function () {
    $('#formAlterarDadosProduto').submit(function () {
        $.ajax({
            url: '../Produtos/AlterarProduto.jsp',
            type: 'POST',
            data: $('#formAlterarDadosProduto').serialize(),
            
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});

//Envio do formulário de Exclusão Produto
$(function () {
    $('#formExcluirDadosProduto').submit(function () {
        $.ajax({
            url: '../Produtos/ExcluirProduto.jsp',
            type: 'POST',
            data: $('#formExcluirDadosProduto').serialize(),
            
            success: function (data) {
                alert("Funcionou");
                window.location.href = "../Home/Home.jsp";
            }
        });
        return false;
    });
});


/****************************************************************/
/********************                   *************************/
/******************** TRATAMENTO CLIENTE ************************/
/********************                   *************************/
/****************************************************************/

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


//Envio do formulário de Alteração Cliente ;
$(function () {
    $('#formAlterarDadosCliente').submit(function () {
        $.ajax({
            url: '../Cliente/AlterarCliente.jsp',
            type: 'POST',
            data: $('#formAlterarDadosCliente').serialize(),
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});

//Envio do formulário de Exclusão Cliente 
$(function () {
    $('#formExcluirDadosCliente').submit(function () {
        $.ajax({
            url: '../Cliente/ExcluirCliente.jsp',
            type: 'POST',
            data: $('#formExcluirDadosCliente').serialize(),
			success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});


