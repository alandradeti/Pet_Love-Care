var modal = document.getElementById("modal_login");

var btn = document.getElementById("abrir_modal_login");

var span = document.getElementsByClassName("close_modal_login")[0];

btn.onclick = () => {
  modal.style.display = "block";
}

span.onclick = () => {
  modal.style.display = "none";
}

window.onclick = (event) => {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

var modal_cadastro = document.getElementById("modal_cadastro");

var btn = document.getElementById("abrir_modal_cadastro");

var span = document.getElementsByClassName("close_modal_cadastro")[0];

btn.onclick = () => {
  modal_cadastro.style.display = "block";
}

span.onclick = () => {
  modal_cadastro.style.display = "none";
}

window.onclick = (event) => {
  if (event.target == modal) {
    modal_cadastro.style.display = "none";
  }
}

