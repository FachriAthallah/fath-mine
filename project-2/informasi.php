<?php
require_once "config.php";

$metode = $_SERVER['REQUEST_METHOD'];
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

// Hasil: nama file yang valid, null jika kosong, atau false jika formatnya tidak valid
function periksaGambar($nilai)
{
    $nilai = trim((string) $nilai);
    if ($nilai === '') {
        return null;
    }
    if (!preg_match('/^[A-Za-z0-9._-]+$/', $nilai)) {
        return false;
    }
    return $nilai;
}

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
        $gambar = periksaGambar($body['gambar'] ?? '');

        if ($judul === '' || $ringkasan === '' || $isi === '') {
            kirim(400, ["success" => false, "message" => "Judul, ringkasan, dan isi wajib diisi"]);
        }
        if ($gambar === false) {
            kirim(400, ["success" => false, "message" => "Nama file gambar tidak valid"]);
        }

        $stmt = $pdo->prepare("INSERT INTO informasi (judul, ringkasan, isi, gambar) VALUES (?, ?, ?, ?)");
        $stmt->execute([$judul, $ringkasan, $isi, $gambar]);
        $idBaru = (int) $pdo->lastInsertId();

        kirim(201, [
            "success" => true,
            "message" => "Informasi berhasil ditambahkan",
            "data" => [
                "id" => $idBaru,
                "judul" => $judul,
                "ringkasan" => $ringkasan,
                "isi" => $isi,
                "gambar" => $gambar,
            ],
        ]);
        break;

    case 'PUT':
        if ($id <= 0) {
            kirim(400, ["success" => false, "message" => "Parameter id wajib diisi"]);
        }

        $cek = $pdo->prepare("SELECT * FROM informasi WHERE id = ?");
        $cek->execute([$id]);
        $lama = $cek->fetch();
        if (!$lama) {
            kirim(404, ["success" => false, "message" => "Informasi tidak ditemukan"]);
        }

        $body = ambilBody();
        $judul = trim($body['judul'] ?? '');
        $ringkasan = trim($body['ringkasan'] ?? '');
        $isi = trim($body['isi'] ?? '');

        if ($judul === '' || $ringkasan === '' || $isi === '') {
            kirim(400, ["success" => false, "message" => "Judul, ringkasan, dan isi wajib diisi"]);
        }

        // Jika field gambar tidak dikirim, gambar lama dipertahankan
        if (array_key_exists('gambar', $body)) {
            $gambar = periksaGambar($body['gambar']);
            if ($gambar === false) {
                kirim(400, ["success" => false, "message" => "Nama file gambar tidak valid"]);
            }
        } else {
            $gambar = $lama['gambar'];
        }

        $stmt = $pdo->prepare("UPDATE informasi SET judul = ?, ringkasan = ?, isi = ?, gambar = ? WHERE id = ?");
        $stmt->execute([$judul, $ringkasan, $isi, $gambar, $id]);

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