<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pet Love Care</title>

  <link rel="stylesheet" href="../../../css//bootstrap.min.css" />
  <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png" />
  <link rel="stylesheet" href="../css/padrao.css" />
  <link rel="stylesheet" href="./home.css" />

  <script src="../../../js/jquery.slim.min.js"></script>
  <script src="../../../js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <script src="../../../js/jquery.min.js"></script>
  <script src="../js/padrao.js"></script>


  <script>
    $(function () {
      $("#headerDiv").load("../Menu/Menu.jsp");
    });
  </script>
</head>

<body>
  <!-- Menu -->
  <div id="headerDiv"></div>
  
  <% if ((String) request.getAttribute("errorMessage") != null) { %>
        <h3 style="color: red;"><%=(String) request.getAttribute("errorMessage")%></h3>
  <% } %>

  <!-- Carrosel -->
  <header>
      <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="4"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="../../img/Anuncios/Anuncio_1.jpg" class="d-block w-100 custom_img_anuncios" alt="...">
        </div>
        <div class="carousel-item">
          <img src="../../img/Anuncios/Anuncio_2.jpg" class="d-block w-100 custom_img_anuncios" alt="...">
        </div>
        <div class="carousel-item">
          <img src="../../img/Anuncios/Anuncio_3.jpg" class="d-block w-100 custom_img_anuncios" alt="...">
        </div>
        <div class="carousel-item">
          <img src="../../img/Anuncios/Anuncio_4.jpg" class="d-block w-100 custom_img_anuncios" alt="...">
        </div>
        <div class="carousel-item">
          <img src="../../img/Anuncios/Anuncio_5.jpg" class="d-block w-100 custom_img_anuncios" alt="...">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Produtos -->
  <section class="background">
    <h1 class="custom_titulo_produtos">Conheçam alguns de nossos produtos!</h1>
    <div class="row custom_body_produtos">
      <div class="card custom_card_produtos" style="width: 18rem;">
        <div class="aling_btn">
            <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
            <button class="btn btn-warning mt-2"><i class="fa fa-pen"></i></button>
        </div>
        <img src="../../img/Produtos/produto_1.png" class="card-img-top custom_img_produtos" alt="...">
        <div class="card-body">
          <h5 class="card-title">Ração Hills</h5>
          <p class="card-text">Ração Hills sabor carne, recomendada para cachorros de porte pequeno.</p>
          <p class="card-text">R$ 19,99</p>
          
          <div class="input-group mb-3 input_center">
            <div class="input-group-prepend">
              <button class="btn btn-dark" 
                      type="button">+</button>
            </div>
            <input type="text" class="form-control col-2" value="0" aria-label="Example text with button addon" aria-describedby="button-addon1">
            <div class="input-group-append">
              <button class="btn btn-dark"
                      type="button">-</button>
            </div>
          </div>
        </div>
      </div>

      <div class="card custom_card_produtos" style="width: 18rem;">
        <div class="aling_btn">
         <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
         <button class="btn btn-warning mt-2"><i class="fa fa-pen"></i></button>
        </div>
        <img src="../../img/Produtos/produto_2.png" class="card-img-top custom_img_produtos" alt="...">
        <div class="card-body">
          <h5 class="card-title">Royal Canin</h5>
          <p class="card-text">Royal Canin sabor carne, recomendada para cachorros de porte médio e grande.</p>
          <p class="card-text">R$ 19,99</p>
         <div class="input-group mb-3 input_center">
            <div class="input-group-prepend">
              <button class="btn btn-dark" 
                      type="button">+</button>
            </div>
            <input type="text" class="form-control col-2" value="0" aria-label="Example text with button addon" aria-describedby="button-addon1">
            <div class="input-group-append">
              <button class="btn btn-dark"
                      type="button">-</button>
            </div>
         </div>
        </div>
      </div>

      <div class="card custom_card_produtos" style="width: 18rem;">
        <div class="aling_btn">
         <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
         <button class="btn btn-warning mt-2"><i class="fa fa-pen"></i></button>
        </div>
        <img src="../../img/Produtos/produto_3.png" class="card-img-top custom_img_produtos" alt="...">
        <div class="card-body">
          <h5 class="card-title">Ração Golden</h5>
          <p class="card-text">Golden sabor carne defumada, recomendada para cachorros de porte médio.</p>
          <p class="card-text">R$ 19,99</p>
          <div class="input-group mb-3 input_center">
            <div class="input-group-prepend">
              <button class="btn btn-dark" 
                      type="button">+</button>
            </div>
            <input type="text" class="form-control col-2" value="0" aria-label="Example text with button addon" aria-describedby="button-addon1">
            <div class="input-group-append">
              <button class="btn btn-dark"
                      type="button">-</button>
            </div>
         </div>
        </div>
      </div>

      <div class="card custom_card_produtos" style="width: 18rem;">
        <div class="aling_btn">
         <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
         <button class="btn btn-warning mt-2"><i class="fa fa-pen"></i></button>
        </div>
        <img src="../../img/Produtos/produto_4.png" class="card-img-top custom_img_produtos" alt="...">
        <div class="card-body">
          <h5 class="card-title">Antipugas Bravecto</h5>
          <p class="card-text">Braveo antipugas, recomendado para cachorros de porte médio e pequeno.</p>
          <p class="card-text">R$ 19,99</p>
          <div class="input-group mb-3 input_center">
            <div class="input-group-prepend">
              <button class="btn btn-dark" 
                      type="button">+</button>
            </div>
            <input type="text" class="form-control col-2" value="0" aria-label="Example text with button addon" aria-describedby="button-addon1">
            <div class="input-group-append">
              <button class="btn btn-dark"
                      type="button">-</button>
            </div>
         </div>
        </div>
      </div>
    </div>

    <div class="row custom_body_produtos">
      <div class="card custom_card_produtos" style="width: 18rem;">
        <div class="aling_btn">
         <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
         <button class="btn btn-warning mt-2"><i class="fa fa-pen"></i></button>
        </div>
        <img src="../../img/Produtos/produto_5.png" class="card-img-top custom_img_produtos" alt="...">
        <div class="card-body">
          <h5 class="card-title">Super Secão</h5>
          <p class="card-text">Super Secão Citrus Tapete Higiênico Petix para Cães - 30 Unidades.</p>
          <p class="card-text">R$ 19,99</p>
        <div class="input-group mb-3 input_center">
            <div class="input-group-prepend">
              <button class="btn btn-dark" 
                      type="button">+</button>
            </div>
            <input type="text" class="form-control col-2" value="0" aria-label="Example text with button addon" aria-describedby="button-addon1">
            <div class="input-group-append">
              <button class="btn btn-dark"
                      type="button">-</button>
            </div>
         </div>
        </div>
      </div>

      <div class="card custom_card_produtos" style="width: 18rem;">
        <div class="aling_btn">
         <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
         <button class="btn btn-warning mt-2"><i class="fa fa-pen"></i></button>
        </div> 
        <img src="../../img/Produtos/produto_6.png" class="card-img-top custom_img_produtos" alt="...">
        <div class="card-body">
          <h5 class="card-title">Arranhadores</h5>
          <p class="card-text">Brinquedo Arranhador São Pet Maxball para Gatos de qualquer idade.</p>
          <p class="card-text">R$ 19,99</p>
         <div class="input-group mb-3 input_center">
            <div class="input-group-prepend">
              <button class="btn btn-dark" 
                      type="button">+</button>
            </div>
            <input type="text" class="form-control col-2" value="0" aria-label="Example text with button addon" aria-describedby="button-addon1">
            <div class="input-group-append">
              <button class="btn btn-dark"
                      type="button">-</button>
            </div>
         </div>
        </div>
      </div>

      <div class="card custom_card_produtos" style="width: 18rem;">
        <div class="aling_btn">
         <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
         <button class="btn btn-warning mt-2"><i class="fa fa-pen"></i></button>
        </div>
        <img src="../../img/Produtos/produto_7.png" class="card-img-top custom_img_produtos" alt="...">
        <div class="card-body">
          <h5 class="card-title">Areia</h5>
          <p class="card-text">Areia Higiênica Chalesco e Garfield com Cristais de Sílica para Gatos - 2kg.</p>
          <p class="card-text">R$ 19,99</p>
         <div class="input-group mb-3 input_center">
            <div class="input-group-prepend">
              <button class="btn btn-dark" 
                      type="button">+</button>
            </div>
            <input type="text" class="form-control col-2" value="0" aria-label="Example text with button addon" aria-describedby="button-addon1">
            <div class="input-group-append">
              <button class="btn btn-dark"
                      type="button">-</button>
            </div>
         </div>
        </div>
      </div>

      <div class="card custom_card_produtos" style="width: 18rem;">
        <div class="aling_btn">
         <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
         <button class="btn btn-warning mt-2"><i class="fa fa-pen"></i></button>
        </div>
        <img src="../../img/Produtos/produto_8.png" class="card-img-top custom_img_produtos" alt="...">
        <div class="card-body">
          <h5 class="card-title">Antipugas</h5>
          <p class="card-text">Antipugas para cães, recomendado para cachorros de porte médio e grande.</p>
          <p class="card-text">R$ 19,99</p>
         <div class="input-group mb-3 input_center">
            <div class="input-group-prepend">
              <button class="btn btn-dark" 
                      type="button">+</button>
            </div>
            <input type="text" class="form-control col-2" value="0" aria-label="Example text with button addon" aria-describedby="button-addon1">
            <div class="input-group-append">
              <button class="btn btn-dark"
                      type="button">-</button>
            </div>
         </div>
        </div>
      </div>
    </div>
  </section>
</body>

</html>