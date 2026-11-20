<?php
require_once "config.php";

$metode = $_SERVER['REQUEST_METHOD'];
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

switch ($metode) {

    case 'GET':
        if ($id > 0) {
            $stmt = $pdo->prepare("SELECT * FROM informasi WHERE id = ?");
            $stmt->execute([$id]);
            $data = $stmt->fetch();
            if (!$data) {
                kirim(404, ["success" => false, "message" => "Informasi tidak ditemukan"]);
            }
            kirim(200, ["success" => true, "data" => $data]);
        }
        $data = $pdo->query("SELECT * FROM informasi ORDER BY id")->fetchAll();
        kirim(200, ["success" => true, "data" => $data]);
        break;

    case 'POST':
        $body = ambilBody();
        $judul = trim($body['judul'] ?? '');
        $ringkasan = trim($body['ringkasan'] ?? '');
        $isi = trim($body['isi'] ?? '');

        if ($judul === '' || $ringkasan === '' || $isi === '') {
            kirim(400, ["success" => false, "message" => "Judul, ringkasan, dan isi wajib diisi"]);
        }

        $stmt = $pdo->prepare("INSERT INTO informasi (judul, ringkasan, isi) VALUES (?, ?, ?)");
        $stmt->execute([$judul, $ringkasan, $isi]);
        $idBaru = (int) $pdo->lastInsertId();

        kirim(201, [
            "success" => true,
            "message" => "Informasi berhasil ditambahkan",
            "data" => ["id" => $idBaru, "judul" => $judul, "ringkasan" => $ringkasan, "isi" => $isi],
        ]);
        break;

    case 'PUT':
        if ($id <= 0) {
            kirim(400, ["success" => false, "message" => "Parameter id wajib diisi"]);
        }

        $cek = $pdo->prepare("SELECT id FROM informasi WHERE id = ?");
        $cek->execute([$id]);
        if (!$cek->fetch()) {
            kirim(404, ["success" => false, "message" => "Informasi tidak ditemukan"]);
        }

        $body = ambilBody();
        $judul = trim($body['judul'] ?? '');
        $ringkasan = trim($body['ringkasan'] ?? '');
        $isi = trim($body['isi'] ?? '');

        if ($judul === '' || $ringkasan === '' || $isi === '') {
            kirim(400, ["success" => false, "message" => "Judul, ringkasan, dan isi wajib diisi"]);
        }

        $stmt = $pdo->prepare("UPDATE informasi SET judul = ?, ringkasan = ?, isi = ? WHERE id = ?");
        $stmt->execute([$judul, $ringkasan, $isi, $id]);

        kirim(200, ["success" => true, "message" => "Informasi berhasil diubah"]);
        break;

    case 'DELETE':
        if ($id <= 0) {
            kirim(400, ["success" => false, "message" => "Parameter id wajib diisi"]);
        }

        $cek = $pdo->prepare("SELECT id FROM informasi WHERE id = ?");
        $cek->execute([$id]);
        if (!$cek->fetch()) {
            kirim(404, ["success" => false, "message" => "Informasi tidak ditemukan"]);
        }

        $stmt = $pdo->prepare("DELETE FROM informasi WHERE id = ?");
        $stmt->execute([$id]);

        kirim(200, ["success" => true, "message" => "Informasi berhasil dihapus"]);
        break;

    default:
        kirim(405, ["success" => false, "message" => "Method tidak diizinkan"]);
}