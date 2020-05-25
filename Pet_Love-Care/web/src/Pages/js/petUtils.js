/**********************
 * MASKS 
 **********************/

// CPF
$('.cpf-mask').keyup(function(){
    var cpf = this.value;
        cpf = cpf.replace(/\D/g,"");
        cpf = cpf.replace(/(\d{3})(\d)/,"$1.$2");
        cpf = cpf.replace(/(\d{3})(\d)/,"$1.$2");
        cpf = cpf.replace(/(\d{3})(\d{1,2})$/,"$1-$2");
    this.value = cpf;
});

// RG
$('.rg-mask').keyup(function(){
    var rg = this.value;
        rg = rg.replace(/\D/g,"");
        rg = rg.replace(/(\d{1,2})(\d)/,"$1.$2");
        rg = rg.replace(/(\d{3})(\d)/,"$1.$2");
        rg = rg.replace(/(\d{3})(\d)/,"$1-$2");
    this.value = rg;
});

// TEL / CEL
$('.tel-mask').keyup(function(){
    var tel = this.value;
    this.value = myTel(tel);
});

// ONLY NUMBERS
$('.only-numbers').keyup(function(){
    var number = this.value;
    this.value = number.replace(/\D/g,"");
});

// PRICE
$('.price-mask').change(function(){
    // pode-se digitar os centavos com "." ou com ","
    var price = this.value.replace(",", ".");
    price = parseFloat(price);
    this.value = price;
});

// DATE
$('.date-mask').keyup(function(){
    var date = this.value;
        date = date.replace(/\D/g,"");
        date = date.replace(/(\d{1,2})(\d)/,"$1/$2");
        date = date.replace(/(\d{2})(\d)/,"$1/$2");
    this.value = date;
});

function customDateMask(obj){
    var date = obj.value;
        date = date.replace(/\D/g,"");
        date = date.replace(/(\d{1,2})(\d)/,"$1/$2");
        date = date.replace(/(\d{2})(\d)/,"$1/$2");
    obj.value = date;
}

/**********************
 * FUNCTIONS 
 **********************/

/**
 * @function showMessage
 * 
 * @param    {String} msg  - Mensagem a ser exibida no alert
 * @param    {String} type - Tipo do alert (baseado no Bootstrap)
 * @example  showMessage("Dados atualizados", "success");
 * @returns  {void}
 * 
 * @description - Cria um alert na tela exibindo a mensagem fornecida 
 * por parâmetro
 **/
function showMessage(msg, type){
    var div = $('<div class="alert alert_custom alert-' + type + ' alert-dismissible fade show" role="alert"></div>').text(msg);
    var button = $('<button type="button" class="close close_alert_custom" data-dismiss="alert" aria-label="Close"></button>');
    var span = '<span aria-hidden="true">&times;</span>';
    
    $("body").append(div);
    $(".alert_custom").append(button);
    $(".close_alert_custom").append(span);
}

/**
 * @function myTel
 * 
 * @param    {String} tel - Telefone ou Celular
 * @return   {String}     - Valor do número com máscara aplicada
 * 
 * @description - Aplica máscara ao número de telefone / celular fornecido
 * por parâmetro
 **/
function myTel(tel){
    tel=tel.replace(/\D/g,"");
    tel=tel.replace(/^(\d)/,"($1");
    tel=tel.replace(/(.{3})(\d)/,"$1) $2");

    if(tel.length == 9) {
            tel=tel.replace(/(.{1})$/,"-$1");
    } 
    else if (tel.length == 10) {
            tel=tel.replace(/(.{2})$/,"-$1");
    } 
    else if (tel.length == 11) {
            tel=tel.replace(/(.{3})$/,"-$1");
    } 
    else if (tel.length == 12) {
            tel=tel.replace(/(.{4})$/,"-$1");
    } 
    else if (tel.length > 12) {
            tel=tel.replace(/(.{4})$/,"-$1");
    }
    return tel;
}

function clearFields(){
    $('input').val('');
}

/**********************
 * POLICIES 
 **********************/

$("#tipo_cliente").change(function(){
    switch(this.value){
        case "0":
            $("#codigo_funcionario").attr("readonly", true);
            break;
        case "1":
            $("#codigo_funcionario").attr("readonly", false);
            break;
    }
});