CREATE DATABASE IF NOT EXISTS fath_mine
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE fath_mine;

DROP TABLE IF EXISTS informasi;
DROP TABLE IF EXISTS users;

CREATE TABLE informasi (
  id INT AUTO_INCREMENT PRIMARY KEY,
  judul VARCHAR(150) NOT NULL,
  ringkasan VARCHAR(255) NOT NULL,
  isi TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO informasi (judul, ringkasan, isi) VALUES
(
  'Tentang Fath Mine',
  'Perusahaan tambang emas dan nikel yang mengutamakan keselamatan dan keberlanjutan.',
  'Fath Mine adalah perusahaan pertambangan fiktif yang bergerak di bidang emas dan nikel. Berdiri dengan semangat menambang secara bertanggung jawab, Fath Mine mengelola dua wilayah operasi dengan tenaga kerja yang terlatih dan peralatan yang terus diperbarui. Kami percaya bahwa hasil tambang yang baik harus sejalan dengan keselamatan pekerja dan kelestarian lingkungan sekitar.'
),
(
  'Visi dan Misi',
  'Menjadi perusahaan tambang yang unggul, aman, dan berkelanjutan.',
  'Visi kami adalah menjadi perusahaan tambang yang unggul dan dipercaya, dengan tata kelola yang aman dan berkelanjutan. Untuk mewujudkannya, misi kami meliputi: menjalankan operasi tambang yang efisien, menjaga keselamatan setiap pekerja, memberi manfaat nyata bagi masyarakat sekitar, serta memulihkan lahan bekas tambang secara bertahap.'
),
(
  'Tambang Emas',
  'Penambangan dan pengolahan emas di Blok Aurum.',
  'Tambang emas Fath Mine berada di Blok Aurum, sebuah wilayah operasi fiktif di pegunungan. Bijih emas digali, dihancurkan, lalu diolah melalui tahap pemisahan untuk menghasilkan emas dengan kemurnian tinggi. Seluruh proses diawasi ketat agar air limbah tetap aman sebelum kembali ke lingkungan.'
),
(
  'Tambang Nikel',
  'Penambangan nikel untuk kebutuhan baja tahan karat dan baterai.',
  'Tambang nikel Fath Mine berada di Blok Ferron, wilayah operasi fiktif di kawasan pesisir. Nikel dari wilayah ini dibutuhkan untuk membuat baja tahan karat dan menjadi bahan penting baterai kendaraan listrik. Bijih nikel ditambang secara terbuka, lalu dikirim ke fasilitas pengolahan untuk dijadikan produk setengah jadi.'
),
(
  'Wilayah Operasi',
  'Dua wilayah operasi: Blok Aurum untuk emas dan Blok Ferron untuk nikel.',
  'Fath Mine mengoperasikan dua wilayah fiktif. Blok Aurum berada di dataran tinggi dan berfokus pada emas, sedangkan Blok Ferron berada di daerah pesisir dan berfokus pada nikel. Setiap blok memiliki kantor lapangan, pos kesehatan, dan jalur logistik masing-masing untuk mendukung kegiatan harian.'
),
(
  'Keselamatan Kerja dan Lingkungan',
  'Komitmen pada K3, reklamasi lahan, dan program untuk masyarakat sekitar.',
  'Keselamatan adalah prioritas utama. Setiap pekerja wajib memakai alat pelindung diri dan mengikuti pelatihan keselamatan sebelum masuk area tambang. Untuk lingkungan, Fath Mine melakukan reklamasi pada lahan yang sudah selesai ditambang dan memantau kualitas air secara berkala. Kami juga menjalankan program pemberdayaan bagi warga sekitar, seperti pelatihan kerja dan dukungan pendidikan.'
);

INSERT INTO users (nama, email, password) VALUES
('Admin Fath Mine', 'admin@fathmine.test', '$2y$10$K57x0pGsf8YrL1Tn2P7BfOSvyq.r60m2bU4dNZE6r2kkAyrtcsw..');