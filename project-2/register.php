<?php
require_once "config.php";

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    kirim(405, ["success" => false, "message" => "Method tidak diizinkan"]);
}

$body = ambilBody();
$nama = trim($body['nama'] ?? '');
$email = trim($body['email'] ?? '');
$password = $body['password'] ?? '';

if ($nama === '' || $email === '' || $password === '') {
    kirim(400, ["success" => false, "message" => "Nama, email, dan password wajib diisi"]);
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    kirim(400, ["success" => false, "message" => "Format email tidak valid"]);
}

if (strlen($password) < 6) {
    kirim(400, ["success" => false, "message" => "Password minimal 6 karakter"]);
}

$cek = $pdo->prepare("SELECT id FROM users WHERE email = ?");
$cek->execute([$email]);
if ($cek->fetch()) {
    kirim(409, ["success" => false, "message" => "Email sudah terdaftar"]);
}

$hash = password_hash($password, PASSWORD_DEFAULT);
$stmt = $pdo->prepare("INSERT INTO users (nama, email, password) VALUES (?, ?, ?)");
$stmt->execute([$nama, $email, $hash]);

kirim(201, [
    "success" => true,
    "message" => "Registrasi berhasil",
    "data" => ["id" => (int) $pdo->lastInsertId(), "nama" => $nama, "email" => $email],
]);