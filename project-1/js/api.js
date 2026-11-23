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
