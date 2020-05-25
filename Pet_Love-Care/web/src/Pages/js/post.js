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
                showMessage('Agendamento cadastrado!', 'success');
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
                showMessage('Agendamento atualizado!', 'success');
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
                showMessage('Agendamento deletado!', 'success');
                setTimeout(function(){
                    window.location.href = "../Agendar/Consultar_Agendamento.jsp";
                }, 3000);
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
                $('.close').click();
                showMessage('Vacina cadastrada!', 'success');
                setTimeout(function(){
                    window.location.reload();
                }, 3000);
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
                showMessage('Vacina atualizada!', 'success');
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
                showMessage('Vacina deletada!', 'success');
                setTimeout(function(){
                    window.location.href = "../Home/Home.jsp";
                }, 3000);
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
                $('.close').click();
                showMessage('Pet cadastrado!', 'success');
                setTimeout(function(){
                    window.location.reload();
                }, 3000);
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
                showMessage('Pet atualizado!', 'success');
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
                showMessage('Pet deletado!', 'success');
                setTimeout(function(){
                    window.location.href = "../Pet/PetConsultar.jsp";
                }, 3000);
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
                $('.close').click();
                showMessage('Veterinário cadastrado!', 'success');
                setTimeout(function(){
                    window.location.reload();
                }, 3000);
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
                showMessage('Veterinário atualizado!', 'success');
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
                showMessage('Veterinário deletado!', 'success');
                setTimeout(function(){
                    window.location.href = "../Veterinario/VeterinarioConsultar.jsp";
                }, 3000);
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
                showMessage('Produto cadastrado!', 'success');
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
                showMessage('Produto atualizado!', 'success');
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
                showMessage('Produto deletado!', 'success');
                setTimeout(function(){
                    window.location.href = "../Home/Home.jsp";
                }, 3000);
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
                $('.close').click();
                showMessage('Usuário cadastrado!', 'success');
                setTimeout(function(){
                    window.location.reload();
                }, 3000);
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
                showMessage('Usuário atualizado!', 'success');
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
                showMessage('Usuário deletado!', 'success');
                setTimeout(function(){
                    window.location.href = "../Cliente/ClienteConsultar.jsp";
                }, 3000);
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
                showMessage('Carteira de Vacinação cadastrada!', 'success');
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
                showMessage('Carteira de Vacinação atualizada!', 'success');
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
                showMessage('Carteira de Vacinação deletada!', 'success');
                setTimeout(function(){
                    window.location.href = "../CarteiraVacinacao/Consultar_CarteiraVacinacao.jsp";
                }, 3000);                
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


