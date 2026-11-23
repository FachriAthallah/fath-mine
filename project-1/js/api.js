const API_URL = "../project-2";

async function panggilApi(endpoint, metode = "GET", data = null) {
  const opsi = { method: metode };

  if (data) {
    opsi.headers = { "Content-Type": "application/json" };
    opsi.body = JSON.stringify(data);
  }

  const respons = await fetch(API_URL + "/" + endpoint, opsi);
  return await respons.json();
}

function simpanLogin(user) {
  sessionStorage.setItem("userFathMine", JSON.stringify(user));
}

function ambilLogin() {
  const data = sessionStorage.getItem("userFathMine");
  return data ? JSON.parse(data) : null;
}

function hapusLogin() {
  sessionStorage.removeItem("userFathMine");
}
function escapeHtml(teks) {
  const el = document.createElement("div");
  el.textContent = teks;
  return el.innerHTML.replace(/"/g, "&quot;").replace(/'/g, "&#39;");
}
function pasangTombolLihat(idInput, idTombol) {
  const input = document.getElementById(idInput);
  const tombol = document.getElementById(idTombol);

  tombol.addEventListener("click", function () {
    const tersembunyi = input.type === "password";
    input.type = tersembunyi ? "text" : "password";
    tombol.innerHTML = tersembunyi
      ? '<i class="bi bi-eye-slash"></i>'
      : '<i class="bi bi-eye"></i>';
  });
}
