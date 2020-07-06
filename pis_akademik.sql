-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jul 2020 pada 16.12
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pis_akademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_menu`
--

CREATE TABLE `tabel_menu` (
  `id` int(11) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(25) NOT NULL,
  `is_main_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tabel_menu`
--

INSERT INTO `tabel_menu` (`id`, `nama_menu`, `link`, `icon`, `is_main_menu`) VALUES
(1, 'Data Siswa', 'siswa', 'fa fa-users', 0),
(2, 'Data Guru', 'guru', 'fa fa-user-circle', 0),
(3, 'Data Master', '#', 'fa fa-bars', 0),
(4, 'Mata Pelajaran', 'mapel', 'fa fa-book', 3),
(5, 'Ruangan Kelas', 'ruangan', 'fa fa-building', 3),
(6, 'Tingkatan Kelas', 'tingkatan', 'fa fa-sitemap', 3),
(8, 'Tahun Akademik', 'tahunakademik', 'fa fa-calendar-check-o', 3),
(9, 'Kelas', 'kelas', 'fa fa-cubes', 3),
(10, 'Kurikulum', 'kurikulum', 'fa fa-list', 3),
(12, 'Peserta Didik', 'siswa/siswa_aktif', 'fa fa-users', 0),
(14, 'Pengguna Sistem', 'user', 'fa fa-id-badge', 0),
(15, 'Menu', 'menu', 'fa fa-list', 0),
(17, 'Nilai', 'nilai', 'fa fa-archive', 0),
(18, 'Laporan Nilai', 'laporan_nilai', 'fa fa-file-pdf-o', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_agama`
--

CREATE TABLE `tbl_agama` (
  `kd_agama` int(4) NOT NULL,
  `nama_agama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_agama`
--

INSERT INTO `tbl_agama` (`kd_agama`, `nama_agama`) VALUES
(1, 'ISLAM'),
(2, 'KRISTEN/ PROTESTAN'),
(3, 'KATHOLIK'),
(4, 'HINDU'),
(5, 'BUDHA'),
(6, 'KHONG HU CHU'),
(99, 'LAIN LAIN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_guru`
--

CREATE TABLE `tbl_guru` (
  `id_guru` int(5) NOT NULL,
  `nip` varchar(11) NOT NULL,
  `nama_guru` varchar(40) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_guru`
--

INSERT INTO `tbl_guru` (`id_guru`, `nip`, `nama_guru`, `jenis_kelamin`, `username`, `password`) VALUES
(5, '19288867254', 'Adam Malik ', 'Laki-Laki', 'adam', '14e1b600b1fd579f47433b88e8d85291'),
(7, '19998356243', 'Adam Levine', 'Laki-Laki', 'levine', 'c56d0e9a7ccec67b4ea131655038d604'),
(9, '19987653646', 'LULPA', '', 'lulpa', '14e1b600b1fd579f47433b88e8d85291');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `kd_jurusan` varchar(5) NOT NULL,
  `nama_jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`kd_jurusan`, `nama_jurusan`) VALUES
('IPA', 'IPA'),
('IPS', 'IPS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `kd_kelas` varchar(5) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL,
  `kd_tingkatan` varchar(5) NOT NULL,
  `kd_jurusan` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`kd_kelas`, `nama_kelas`, `kd_tingkatan`, `kd_jurusan`) VALUES
('1', 'Kelas I', '1', 'IPA'),
('2', 'kelas II', '2', 'IPA'),
('3', 'Kelas III', '3', 'IPA'),
('4', 'Kelas IV', '4', 'IPA'),
('5', 'Kelas V', '5', 'IPA'),
('6', 'Kelas VI', '6', 'IPA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kurikulum`
--

CREATE TABLE `tbl_kurikulum` (
  `id_kurikulum` int(5) NOT NULL,
  `nama_kurikulum` varchar(30) NOT NULL,
  `is_aktif` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kurikulum`
--

INSERT INTO `tbl_kurikulum` (`id_kurikulum`, `nama_kurikulum`, `is_aktif`) VALUES
(1, 'Kurikulum 2013 (K13)', 'Y'),
(2, 'Kurikulum 2006 (KTSP)', 'N'),
(3, 'Kurikulum 2004 (KBK)', 'N');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kurikulum_detail`
--

CREATE TABLE `tbl_kurikulum_detail` (
  `id_kurikulum_detail` int(5) NOT NULL,
  `id_kurikulum` int(5) NOT NULL,
  `kd_mapel` varchar(5) NOT NULL,
  `kd_jurusan` varchar(5) NOT NULL,
  `kd_tingkatan` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kurikulum_detail`
--

INSERT INTO `tbl_kurikulum_detail` (`id_kurikulum_detail`, `id_kurikulum`, `kd_mapel`, `kd_jurusan`, `kd_tingkatan`) VALUES
(1, 1, 'BID1', 'IPA', '7'),
(2, 1, 'BID2', 'IPA', '8'),
(3, 1, 'BID3', 'IPA', '9'),
(4, 1, 'BIO1', 'IPA', '7'),
(5, 1, 'BIO2', 'IPA', '8'),
(6, 1, 'BIO3', 'IPA', '9');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_level_user`
--

CREATE TABLE `tbl_level_user` (
  `id_level_user` int(5) NOT NULL,
  `nama_level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_level_user`
--

INSERT INTO `tbl_level_user` (`id_level_user`, `nama_level`) VALUES
(1, 'Admin'),
(2, 'Walikelas'),
(3, 'Guru'),
(4, 'Keuangan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mapel`
--

CREATE TABLE `tbl_mapel` (
  `kd_mapel` varchar(5) NOT NULL,
  `nama_mapel` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_mapel`
--

INSERT INTO `tbl_mapel` (`kd_mapel`, `nama_mapel`) VALUES
('BIDK', 'Bahasa Indonesia Keterampilan'),
('BIDP', 'Bahasa Indonesia Pengetahuan'),
('BINGK', 'Bahasa Inggris Keterampilan'),
('BINGP', 'Bahasa Inggris Pengetahuan'),
('BLAMK', 'Bahasa Lampung Keterampilan'),
('BLAMP', 'Bahasa Lampung Pengetahuan'),
('IPAK', 'Ilmu Pengetahuan Alam Keterampilan'),
('IPAP', 'Ilmu Pengetahuan Alam Pengetahuan'),
('IPSK', 'Ilmu Pengetahuan Sosial Keterampilan'),
('IPSP', 'Ilmu Pengetahuan Sosial Pengetahuan'),
('MTKK', 'Matematika Keterampilan'),
('MTKP', 'Matematika Pengatahuan'),
('PABPK', 'Pendidikan Agama Dan Budi Pekerti Keteraampilan'),
('PABPP', 'Pendidikan Agama Dan Budi Pekerti Pengetahuan'),
('PJOKK', 'Pendidikan Jasmani Dan Olahraga Kesehatan Keterampilan'),
('PJOKP', 'Pendidikan Jasmani Dan Olahraga Kesehatan Pengetahuan'),
('PKNK', 'Pendidikan Kewarganegaraan Keterampilan'),
('PKNP', 'Pendidikan Kewarganegaraan Pengetahuan'),
('SBK', 'Seni Budaya Keterampilan'),
('SBP', 'Seni Budaya Pengatahuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_nilai`
--

CREATE TABLE `tbl_nilai` (
  `id_nilai` int(5) NOT NULL,
  `nisn` varchar(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `kd_mapel` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_nilai`
--

INSERT INTO `tbl_nilai` (`id_nilai`, `nisn`, `nilai`, `kd_mapel`) VALUES
(12, '998464343', 75, 'IPAP'),
(13, '99846354', 75, 'IPSK'),
(14, '99846354', 90, 'PJOKK'),
(15, '9983635262', 88, 'BIDP'),
(16, '99837243', 89, 'MTKK'),
(17, '99837243', 98, 'BINGP'),
(18, '99837243', 93, 'BIDP'),
(19, '99837243', 77, 'BLAMP'),
(20, '998464343', 100, 'MTKK'),
(21, '99837243', 100, 'SBP'),
(22, '99837243', 88, 'BIDP'),
(23, '99837243', 96, 'MTKK'),
(24, '99837243', 93, 'PABPK'),
(25, '99837243', 88, 'IPSK'),
(26, '99837243', 99, 'PJOKK'),
(27, '99837243', 55, 'MTKK'),
(28, '99837243', 68, 'BINGP'),
(29, '998735433', 77, 'MTKK'),
(30, '9998765', 88, 'BIDP'),
(31, '9998765', 77, 'BINGP'),
(32, '9998765', 98, 'BINGP'),
(33, '998754326', 77, 'BIDP'),
(34, '998754326', 88, 'BINGP'),
(35, '998754326', 75, 'BLAMP'),
(36, '998754326', 98, 'PKNK'),
(37, '99883756255', 88, 'BIDP'),
(38, '99883756255', 98, 'BIDP'),
(41, '99837243', 66, 'BIDK'),
(42, '99883756255', 10000, 'BINGP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_riwayat_kelas`
--

CREATE TABLE `tbl_riwayat_kelas` (
  `id_riwayat` int(5) NOT NULL,
  `kd_kelas` varchar(5) NOT NULL,
  `nisn` varchar(11) NOT NULL,
  `id_tahun_akademik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_riwayat_kelas`
--

INSERT INTO `tbl_riwayat_kelas` (`id_riwayat`, `kd_kelas`, `nisn`, `id_tahun_akademik`) VALUES
(1, '7-A1', '18SI1000', 1),
(2, '7-A1', '18SI1001', 1),
(3, '7-A1', '18SI1002', 1),
(4, '7-A1', '18SI1003', 1),
(5, '7-A1', '18TI2000', 1),
(6, '7-A1', '18TI2001', 1),
(7, '7-A1', '18TI2002', 1),
(8, '7-A1', '18TI2003', 1),
(9, '7-A1', '', 1),
(10, '8-A1', '14.12.8199', 1),
(11, '8-B1', '14.12.8198', 1),
(12, '7-A1', '17029327862', 1),
(13, '7-A1', '99836634572', 1),
(14, '7-A1', '99875536733', 1),
(15, '7-A1', '9983635262', 1),
(16, '7-A1', '99837243', 1),
(17, '1', '998735433', 1),
(18, '7-A1', '9998765', 1),
(19, '7-A1', '998754326', 1),
(20, '1', '99883756255', 1),
(21, '2', '998864534', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_ruangan`
--

CREATE TABLE `tbl_ruangan` (
  `kd_ruangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_ruangan`
--

INSERT INTO `tbl_ruangan` (`kd_ruangan`, `nama_ruangan`) VALUES
('KELAS I', 'Ruangan Kelas I'),
('KELAS II', 'Ruangan Kelas II'),
('KELAS III', 'Ruangan Kelas III'),
('KELAS IV', 'Ruangan Kelas IV'),
('KELAS V', 'Ruangan Kelas V'),
('KELAS VI', 'Ruangan Kelas VI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `nisn` varchar(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `kd_agama` int(2) NOT NULL,
  `foto` text NOT NULL,
  `kd_kelas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`nisn`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `tempat_lahir`, `kd_agama`, `foto`, `kd_kelas`) VALUES
('20180000001', 'Muhammad Athallah Zhuhry', 'Laki-Laki', '1996-12-19', 'Banda Aceh', 1, 'PRIA18.jpg', '1'),
('20180000003', 'Nardin', 'Laki-Laki', '1996-05-01', 'Sinabang', 1, 'PRIA20.jpg', '1'),
('9983635262', 'Hawariyyun', 'Laki-Laki', '2020-05-19', 'Jakarta', 1, 'PRIA17.jpg', '1'),
('99837243', 'Adam Malik', 'Laki-Laki', '2020-05-13', 'Bandar Lampung', 1, 'PRIA13.jpg', '1'),
('998735433', 'Adam', 'Laki-Laki', '2020-05-21', 'Bandar Lampung', 1, 'PRIA14.jpg', '1'),
('998754326', 'Dimas Riyadi', 'Laki-Laki', '2019-10-27', 'Bandar Lampung', 1, 'PRIA15.jpg', '1'),
('99883756255', 'Aidil Fitra ', 'Laki-Laki', '2020-05-13', 'Bandar Lampung', 1, 'PRIA21.jpg', '1'),
('998864534', 'Lalu Kupa', 'Laki-Laki', '2020-05-05', 'Jember', 1, 'PRIA16.jpg', '2'),
('9998765', 'HANAN', '', '2020-05-28', 'Bandar Lampung', 1, 'PRIA12.jpg', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tahun_akademik`
--

CREATE TABLE `tbl_tahun_akademik` (
  `id_tahun_akademik` int(5) NOT NULL,
  `tahun_akademik` varchar(10) NOT NULL,
  `is_aktif` enum('Y','N') NOT NULL,
  `semester` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_tahun_akademik`
--

INSERT INTO `tbl_tahun_akademik` (`id_tahun_akademik`, `tahun_akademik`, `is_aktif`, `semester`) VALUES
(1, '2018/2019', 'N', 'ganjil'),
(2, '2017/2018', 'N', 'genap'),
(5, '2019/2020', 'Y', 'genap');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tingkatan_kelas`
--

CREATE TABLE `tbl_tingkatan_kelas` (
  `kd_tingkatan` varchar(5) NOT NULL,
  `nama_tingkatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_tingkatan_kelas`
--

INSERT INTO `tbl_tingkatan_kelas` (`kd_tingkatan`, `nama_tingkatan`) VALUES
('1', 'Tingkat Kelas 1 '),
('2', 'Tingkat Kelas 2 '),
('3', 'Tingkat Kelas 3'),
('4', 'Tingkat Kelas 4 '),
('5', 'Tingkat Kelas 5'),
('6', 'Tingkat Kelas 6 ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(5) NOT NULL,
  `nama_lengkap` varchar(40) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `id_level_user` int(11) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama_lengkap`, `username`, `password`, `id_level_user`, `foto`) VALUES
(4, 'Adam Malik', 'adam', 'a4f75ece079687a4960154ca4a02b82a', 1, 'PRIA2.jpg'),
(5, 'Adam Malik', 'adam', '14e1b600b1fd579f47433b88e8d85291', 2, 'PRIA3.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_rule`
--

CREATE TABLE `tbl_user_rule` (
  `id_rule` int(5) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_level_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user_rule`
--

INSERT INTO `tbl_user_rule` (`id_rule`, `id_menu`, `id_level_user`) VALUES
(1, 16, 4),
(2, 1, 1),
(3, 2, 1),
(4, 3, 1),
(5, 4, 1),
(6, 5, 1),
(7, 7, 1),
(8, 8, 1),
(9, 11, 1),
(10, 6, 1),
(11, 14, 1),
(12, 15, 1),
(13, 13, 1),
(14, 12, 1),
(15, 10, 1),
(16, 9, 1),
(17, 11, 3),
(19, 17, 3),
(20, 18, 3),
(21, 12, 3),
(23, 12, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_walikelas`
--

CREATE TABLE `tbl_walikelas` (
  `id_walikelas` int(5) NOT NULL,
  `id_guru` int(5) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `kd_kelas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_walikelas`
--

INSERT INTO `tbl_walikelas` (`id_walikelas`, `id_guru`, `id_tahun_akademik`, `kd_kelas`) VALUES
(1, 1, 1, '7-A1'),
(2, 0, 1, '7-A2'),
(3, 0, 1, '7-B1'),
(4, 0, 1, '7-B2'),
(5, 0, 1, '8-A1'),
(6, 0, 1, '8-A2'),
(7, 0, 1, '8-B1'),
(8, 0, 1, '8-B2'),
(9, 0, 1, '9-A1'),
(10, 0, 1, '9-A2'),
(11, 1, 1, '9-B1'),
(12, 0, 1, '9-B2');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_kelas`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_kelas` (
`kd_kelas` varchar(5)
,`nama_kelas` varchar(30)
,`kd_tingkatan` varchar(5)
,`kd_jurusan` varchar(5)
,`nama_tingkatan` varchar(30)
,`nama_jurusan` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_user`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_user` (
`id_user` int(5)
,`nama_lengkap` varchar(40)
,`username` varchar(30)
,`password` varchar(40)
,`id_level_user` int(11)
,`foto` text
,`nama_level` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_walikelas`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_walikelas` (
`nama_guru` varchar(40)
,`nama_kelas` varchar(30)
,`id_walikelas` int(5)
,`id_tahun_akademik` int(5)
,`nama_jurusan` varchar(30)
,`nama_tingkatan` varchar(30)
,`tahun_akademik` varchar(10)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_kelas`
--
DROP TABLE IF EXISTS `view_kelas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kelas`  AS  select `tk`.`kd_kelas` AS `kd_kelas`,`tk`.`nama_kelas` AS `nama_kelas`,`tk`.`kd_tingkatan` AS `kd_tingkatan`,`tk`.`kd_jurusan` AS `kd_jurusan`,`ttk`.`nama_tingkatan` AS `nama_tingkatan`,`tj`.`nama_jurusan` AS `nama_jurusan` from ((`tbl_kelas` `tk` join `tbl_tingkatan_kelas` `ttk`) join `tbl_jurusan` `tj`) where ((`tk`.`kd_tingkatan` = `ttk`.`kd_tingkatan`) and (`tk`.`kd_jurusan` = `tj`.`kd_jurusan`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS  select `tu`.`id_user` AS `id_user`,`tu`.`nama_lengkap` AS `nama_lengkap`,`tu`.`username` AS `username`,`tu`.`password` AS `password`,`tu`.`id_level_user` AS `id_level_user`,`tu`.`foto` AS `foto`,`tlu`.`nama_level` AS `nama_level` from (`tbl_user` `tu` join `tbl_level_user` `tlu`) where (`tu`.`id_level_user` = `tlu`.`id_level_user`) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_walikelas`
--
DROP TABLE IF EXISTS `view_walikelas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_walikelas`  AS  select `tg`.`nama_guru` AS `nama_guru`,`tk`.`nama_kelas` AS `nama_kelas`,`tw`.`id_walikelas` AS `id_walikelas`,`tw`.`id_tahun_akademik` AS `id_tahun_akademik`,`tj`.`nama_jurusan` AS `nama_jurusan`,`ttk`.`nama_tingkatan` AS `nama_tingkatan`,`tta`.`tahun_akademik` AS `tahun_akademik` from (((((`tbl_walikelas` `tw` join `tbl_kelas` `tk`) join `tbl_guru` `tg`) join `tbl_jurusan` `tj`) join `tbl_tingkatan_kelas` `ttk`) join `tbl_tahun_akademik` `tta`) where ((`tw`.`kd_kelas` = `tk`.`kd_kelas`) and (`tw`.`id_guru` = `tg`.`id_guru`) and (`tk`.`kd_jurusan` = `tj`.`kd_jurusan`) and (`tk`.`kd_tingkatan` = `ttk`.`kd_tingkatan`) and (`tw`.`id_tahun_akademik` = `tta`.`id_tahun_akademik`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tabel_menu`
--
ALTER TABLE `tabel_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_agama`
--
ALTER TABLE `tbl_agama`
  ADD PRIMARY KEY (`kd_agama`);

--
-- Indeks untuk tabel `tbl_guru`
--
ALTER TABLE `tbl_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`kd_jurusan`);

--
-- Indeks untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`kd_kelas`);

--
-- Indeks untuk tabel `tbl_kurikulum`
--
ALTER TABLE `tbl_kurikulum`
  ADD PRIMARY KEY (`id_kurikulum`);

--
-- Indeks untuk tabel `tbl_kurikulum_detail`
--
ALTER TABLE `tbl_kurikulum_detail`
  ADD PRIMARY KEY (`id_kurikulum_detail`);

--
-- Indeks untuk tabel `tbl_level_user`
--
ALTER TABLE `tbl_level_user`
  ADD PRIMARY KEY (`id_level_user`);

--
-- Indeks untuk tabel `tbl_mapel`
--
ALTER TABLE `tbl_mapel`
  ADD PRIMARY KEY (`kd_mapel`);

--
-- Indeks untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `fknilai` (`kd_mapel`),
  ADD KEY `fknisn` (`nisn`) USING BTREE;

--
-- Indeks untuk tabel `tbl_riwayat_kelas`
--
ALTER TABLE `tbl_riwayat_kelas`
  ADD PRIMARY KEY (`id_riwayat`);

--
-- Indeks untuk tabel `tbl_ruangan`
--
ALTER TABLE `tbl_ruangan`
  ADD PRIMARY KEY (`kd_ruangan`);

--
-- Indeks untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `kd_agama` (`kd_agama`),
  ADD KEY `kd_kelas` (`kd_kelas`);

--
-- Indeks untuk tabel `tbl_tahun_akademik`
--
ALTER TABLE `tbl_tahun_akademik`
  ADD PRIMARY KEY (`id_tahun_akademik`);

--
-- Indeks untuk tabel `tbl_tingkatan_kelas`
--
ALTER TABLE `tbl_tingkatan_kelas`
  ADD PRIMARY KEY (`kd_tingkatan`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `tbl_user_rule`
--
ALTER TABLE `tbl_user_rule`
  ADD PRIMARY KEY (`id_rule`);

--
-- Indeks untuk tabel `tbl_walikelas`
--
ALTER TABLE `tbl_walikelas`
  ADD PRIMARY KEY (`id_walikelas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tabel_menu`
--
ALTER TABLE `tabel_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tbl_guru`
--
ALTER TABLE `tbl_guru`
  MODIFY `id_guru` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_kurikulum`
--
ALTER TABLE `tbl_kurikulum`
  MODIFY `id_kurikulum` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_kurikulum_detail`
--
ALTER TABLE `tbl_kurikulum_detail`
  MODIFY `id_kurikulum_detail` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_level_user`
--
ALTER TABLE `tbl_level_user`
  MODIFY `id_level_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  MODIFY `id_nilai` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `tbl_riwayat_kelas`
--
ALTER TABLE `tbl_riwayat_kelas`
  MODIFY `id_riwayat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `tbl_tahun_akademik`
--
ALTER TABLE `tbl_tahun_akademik`
  MODIFY `id_tahun_akademik` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_user_rule`
--
ALTER TABLE `tbl_user_rule`
  MODIFY `id_rule` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tbl_walikelas`
--
ALTER TABLE `tbl_walikelas`
  MODIFY `id_walikelas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  ADD CONSTRAINT `fknilai` FOREIGN KEY (`kd_mapel`) REFERENCES `tbl_mapel` (`kd_mapel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD CONSTRAINT `tbl_siswa_ibfk_1` FOREIGN KEY (`kd_agama`) REFERENCES `tbl_agama` (`kd_agama`),
  ADD CONSTRAINT `tbl_siswa_ibfk_2` FOREIGN KEY (`kd_kelas`) REFERENCES `tbl_kelas` (`kd_kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
