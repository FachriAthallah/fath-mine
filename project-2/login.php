<?php
require_once "config.php";

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    kirim(405, ["success" => false, "message" => "Method tidak diizinkan"]);
}

$body = ambilBody();
$email = trim($body['email'] ?? '');
$password = $body['password'] ?? '';

if ($email === '' || $password === '') {
    kirim(400, ["success" => false, "message" => "Email dan password wajib diisi"]);
}

$stmt = $pdo->prepare("SELECT id, nama, email, password FROM users WHERE email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch();

if (!$user || !password_verify($password, $user['password'])) {
    kirim(401, ["success" => false, "message" => "Email atau password salah"]);
}

kirim(200, [
    "success" => true,
    "message" => "Login berhasil",
    "data" => ["id" => (int) $user['id'], "nama" => $user['nama'], "email" => $user['email']],
]);