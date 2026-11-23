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
function sesuaikanTampilanLogin() {
  const user = ambilLogin();
  if (!user) {
    return;
  }

  const navLogin = document.getElementById("navLogin");
  const navRegistrasi = document.getElementById("navRegistrasi");
  const aksiHero = document.getElementById("aksiHero");

  if (navLogin) {
    navLogin.innerHTML = '<a class="nav-link" href="menu.html">Menu Utama</a>';
  }

  if (navRegistrasi) {
    navRegistrasi.innerHTML =
      '<button type="button" class="btn btn-aksen btn-sm" id="btnLogoutNav">Logout</button>';
    document
      .getElementById("btnLogoutNav")
      .addEventListener("click", function () {
        hapusLogin();
        window.location.href = "login.html";
      });
  }

  if (aksiHero) {
    aksiHero.innerHTML =
      '<a href="menu.html" class="btn btn-aksen btn-lg mb-2">Buka Menu Utama</a>';
  }
}
