/*********************************************************************/
/********************                        *************************/
/******************** TRATAMENTO AGENDAMENTO *************************/
/********************                        *************************/
/*********************************************************************/

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

//Envio do formulário de cadastramento Agendamento
$(function () {
    $('#formAlterarDadosAgendamento').submit(function () {
        $.ajax({
            url: '../Agendar/AlterarAgendamento.jsp',
            type: 'POST',
            data: $('#formAlterarDadosAgendamento').serialize(),
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});

//Envio do formulário de Exclusão Agendamento  
$(function () {
    $('#formExcluirDadosAgendamento').submit(function () {
        $.ajax({
            url: '../Agendar/ExcluirAgendamento.jsp',
            type: 'POST',
            data: $('#formExcluirDadosAgendamento').serialize(),
            
            success: function (data) {
                alert("Funcionou");
                window.location.href = "../Agendar/Consultar_Agendamento.jsp";
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
                window.location.href = "../Pet/PetConsultar.jsp";
            }
        });
        return false;
    });
});


/****************************************************************/
/********************                        ********************/
/******************** TRATAMENTO VETERINARIO ********************/
/********************                        ********************/
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
                window.location.href = "../Veterinario/VeterinarioConsultar.jsp";
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
/********************                    ************************/
/******************** TRATAMENTO CLIENTE ************************/
/********************                    ************************/
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
                window.location.href = "../Cliente/ClienteConsultar.jsp";
            }
        });
        return false;
    });
});

/********************************************************************************/
/********************                                   *************************/
/******************** TRATAMENTO CARTEIRA DE VACINACAO  *************************/
/********************                                   *************************/
/********************************************************************************/

//Envio do formulário de cadastramento Carteira de Vacinacao
$(function () {
    $('#formCadastrarDadosCarteiraVacinacao').submit(function () {
        $.ajax({
            url: '../CarteiraVacinacao/IncluirCarteiraVacinacao.jsp',
            type: 'POST',
            data: $('#formCadastrarDadosCarteiraVacinacao').serialize(),
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});

//Envio do formulário de cadastramento Carteira de Vacinacao
$(function () {
    $('#formAlterarDadosCarteiraVacinacao').submit(function () {
        $.ajax({
            url: '../CarteiraVacinacao/AlterarCarteiraVacinacao.jsp',
            type: 'POST',
            data: $('#formAlterarDadosCarteiraVacinacao').serialize(),
            success: function (data) {
                alert("Funcionou");
            }
        });
        return false;
    });
});

//Envio do formulário de Exclusão Carteira de Vacinacao
$(function () {
    $('#formExcluirDadosCarteiraVacinacao').submit(function () {
        $.ajax({
            url: '../CarteiraVacinacao/ExcluirCarteiraVacinacao.jsp',
            type: 'POST',
            data: $('#formExcluirDadosCarteiraVacinacao').serialize(),
            
            success: function (data) {
                alert("Funcionou");
                window.location.href = "../CarteiraVacinacao/Consultar_CarteiraVacinacao.jsp";
            }
        });
        return false;
    });
});



/****************************************************************************/
/********************                                 ***********************/
/******************** TRATAMENTO CARRINHO DE COMPRAS  ***********************/
/********************                                 ***********************/
/****************************************************************************/

//Envio do formulário de cadastramento Carteira de Vacinacao
/*$(function () {
    $('#formAdicionarCarrinho').submit(function () {
        $.ajax({
            url: '../Compras/CarrinhoCompras.jsp',
            type: 'POST',
            dataType: 'html',
            data: $('#formAdicionarCarrinho').serialize(),
            success: function (data) {
                alert("Funcionou");
            }
        })
        return false;
    });
});*/

//Envio do formulário de cadastramento Carteira de Vacinacao
/*$(function () {
    $('#formExcluirProdutoCarrinho').submit(function () {
        $.ajax({
            url: '../Compras/ExcluirCarrinho.jsp',
            type: 'POST',
            data: $('#formExcluirProdutoCarrinho').serialize(),
            success: function (data) {
                alert("Funcionou");
                window.location.href = "../Compras/Compras.jsp";
            }
        });
        return false;
    });
});*/

//Envio do formulário de Pagamento
$(function () {
    $('#formRealizarPagamento').submit(function () {
        $.ajax({
            url: '../Compras/IncluirCompra.jsp',
            type: 'POST',
            data: $('#formRealizarPagamento').serialize(),
            success: function (data) {
                alert("Pagamento Realizado");
                window.location.href = "../Relatorio/Relatorio.jsp";
            }
        });
        return false;
    });
});


