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
  gambar VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO informasi (judul, ringkasan, isi, gambar) VALUES
(
  'Tentang Fath Mine',
  'Perusahaan pertambangan emas dan nikel yang mengutamakan keselamatan dan tanggung jawab pada lingkungan.',
  'Fath Mine adalah perusahaan pertambangan yang bergerak di komoditas emas dan nikel. Kami bekerja dengan satu prinsip sederhana: hasil tambang yang baik harus diperoleh dengan cara yang aman bagi pekerja dan bertanggung jawab pada lingkungan sekitar.\n\nDi lapangan, kegiatan kami mencakup eksplorasi, penambangan, hingga pengolahan awal bijih. Setiap tahap dijalankan oleh tim yang terlatih, dengan prosedur kerja yang jelas dan peralatan yang rutin diperiksa.\n\nSelain mengejar hasil produksi, kami ingin kehadiran tambang ini ikut memberi manfaat bagi masyarakat di sekitarnya, mulai dari membuka kesempatan kerja hingga mendukung program pendidikan dan pelatihan.',
  'tentang-fath-mine.jpg'
),
(
  'Visi dan Misi',
  'Arah dan nilai yang kami pegang dalam menjalankan kegiatan pertambangan.',
  'Visi\nMenjadi perusahaan pertambangan yang dipercaya karena bekerja dengan aman, efisien, dan berkelanjutan.\n\nMisi\n1. Menjalankan kegiatan tambang yang efisien dan sesuai peraturan yang berlaku.\n2. Menempatkan keselamatan dan kesehatan seluruh pekerja sebagai prioritas utama.\n3. Mengelola dampak lingkungan dan memulihkan lahan bekas tambang secara bertahap.\n4. Memberi manfaat nyata bagi masyarakat di sekitar wilayah operasi.\n5. Mengembangkan kemampuan dan karier para pekerja secara berkelanjutan.',
  'visi-dan-misi.jpg'
),
(
  'Tambang Emas',
  'Dari eksplorasi hingga pengolahan, emas dihasilkan lewat tahapan yang dikontrol ketat.',
  'Emas adalah logam mulia yang dimanfaatkan untuk perhiasan, investasi, dan juga industri elektronik. Karena jumlahnya di dalam batuan biasanya sangat kecil, penambangannya membutuhkan perencanaan yang matang.\n\nProsesnya dimulai dari eksplorasi untuk memastikan letak dan kadar bijih. Setelah itu bijih digali, diangkut, lalu dihancurkan menjadi ukuran yang lebih halus agar emasnya mudah dipisahkan. Tahap pengolahan kemudian memisahkan emas dari material lain sebelum dimurnikan.\n\nDi setiap tahap, kami memantau pengelolaan air dan limbah agar tidak mencemari lingkungan sekitar tambang.',
  'tambang-emas.jpg'
),
(
  'Tambang Nikel',
  'Nikel untuk kebutuhan baja tahan karat dan baterai kendaraan listrik.',
  'Nikel adalah logam yang banyak dipakai untuk membuat baja tahan karat. Dalam beberapa tahun terakhir, kebutuhannya juga meningkat karena nikel menjadi salah satu bahan penting baterai kendaraan listrik.\n\nDi Indonesia, nikel umumnya ditemukan pada endapan laterit yang letaknya dekat permukaan tanah, sehingga banyak ditambang dengan sistem tambang terbuka. Tanah penutup dikupas, bijih diambil, lalu dipilah berdasarkan kadarnya sebelum dikirim ke fasilitas pengolahan.\n\nKarena penambangan terbuka mengubah bentang lahan, rencana reklamasi perlu disiapkan sejak awal agar lahan dapat dipulihkan setelah penambangan selesai.',
  'tambang-nikel.jpg'
),
(
  'Wilayah Operasi',
  'Area kegiatan tambang emas dan nikel beserta fasilitas pendukungnya.',
  'Kegiatan Fath Mine berlangsung di dua area kerja, yaitu area tambang emas dan area tambang nikel. Keduanya memiliki karakter lahan dan kebutuhan yang berbeda, sehingga dikelola dengan pendekatan masing-masing.\n\nSetiap area didukung fasilitas dasar agar kegiatan berjalan lancar, seperti kantor lapangan, jalan tambang dan jalur angkut, bengkel peralatan, serta pos kesehatan untuk kebutuhan medis pekerja.\n\nBatas wilayah kerja, jalur kendaraan, dan area berbahaya ditandai dengan jelas. Hanya orang yang berkepentingan dan sudah mendapat pengarahan keselamatan yang boleh memasukinya.',
  'wilayah-operasi.jpg'
),
(
  'Keselamatan Kerja dan Lingkungan',
  'Komitmen menjaga keselamatan pekerja dan memulihkan lingkungan di sekitar tambang.',
  'Pertambangan adalah pekerjaan yang berisiko, jadi keselamatan tidak boleh dianggap urusan belakangan. Setiap pekerja wajib mengikuti pengarahan keselamatan sebelum bekerja, memakai alat pelindung diri seperti helm, sepatu pengaman, rompi, dan kacamata, serta mengikuti prosedur kerja yang berlaku.\n\nKami juga membiasakan pelaporan kejadian hampir celaka (near miss), supaya potensi bahaya bisa diperbaiki sebelum menimbulkan korban.\n\nUntuk lingkungan, kegiatan tambang diikuti dengan pemantauan kualitas air dan udara, pengelolaan limbah, serta reklamasi lahan yang sudah selesai ditambang. Di luar itu, kami menjalankan program bagi masyarakat sekitar, misalnya pelatihan kerja dan dukungan pendidikan.',
  'k3.jpg'
);

INSERT INTO users (nama, email, password) VALUES
('Admin Fath Mine', 'admin@fathmine.test', '$2y$10$K57x0pGsf8YrL1Tn2P7BfOSvyq.r60m2bU4dNZE6r2kkAyrtcsw..');