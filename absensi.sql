/*
 Navicat Premium Data Transfer

 Source Server         : PRESENSIBDG
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : absensi

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 16/03/2025 13:50:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cabang
-- ----------------------------
DROP TABLE IF EXISTS `cabang`;
CREATE TABLE `cabang`  (
  `kode_cabang` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_cabang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi_cabang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `radius_cabang` int(0) NOT NULL,
  PRIMARY KEY (`kode_cabang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cabang
-- ----------------------------
INSERT INTO `cabang` VALUES ('C6', 'Ciharum Command Center', '-6.982892,107.5578283', 300);
INSERT INTO `cabang` VALUES ('EXA', 'Exaborn Bandung', '-6.9604663,107.5649853', 300);
INSERT INTO `cabang` VALUES ('K8', 'K8 Printing Bandung', '-6.9604663,107.5649853', 100);
INSERT INTO `cabang` VALUES ('KRE', 'Kreasi Textile', '-6.9604663,107.5649853', 100);

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen`  (
  `kode_dept` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_dept` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO `departemen` VALUES ('DSN', 'Design');
INSERT INTO `departemen` VALUES ('HRD', 'Human Resource Development ');
INSERT INTO `departemen` VALUES ('IT', 'Information Technology');
INSERT INTO `departemen` VALUES ('KEU', 'Keuangan');
INSERT INTO `departemen` VALUES ('KVS', 'Konveksi');
INSERT INTO `departemen` VALUES ('PRD', 'Produksi');

-- ----------------------------
-- Table structure for harilibur
-- ----------------------------
DROP TABLE IF EXISTS `harilibur`;
CREATE TABLE `harilibur`  (
  `kode_libur` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_libur` date NOT NULL,
  `kode_cabang` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keterangan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`kode_libur`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of harilibur
-- ----------------------------
INSERT INTO `harilibur` VALUES ('LB25001', '2025-03-29', 'EXA', 'Hari Suci Nyepi Tahun Baru Saka 1947');
INSERT INTO `harilibur` VALUES ('LB25004', '2025-03-31', 'EXA', 'Hari Raya Idul Fitri 1446 Hijriyah');
INSERT INTO `harilibur` VALUES ('LB25005', '2025-04-01', 'EXA', 'Hari Raya Idul Fitri 1446 H');

-- ----------------------------
-- Table structure for harilibur_detail
-- ----------------------------
DROP TABLE IF EXISTS `harilibur_detail`;
CREATE TABLE `harilibur_detail`  (
  `kode_libur` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nik` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of harilibur_detail
-- ----------------------------
INSERT INTO `harilibur_detail` VALUES ('LB24002', '3636');
INSERT INTO `harilibur_detail` VALUES ('LB24002', '22-01');
INSERT INTO `harilibur_detail` VALUES ('LB24002', '99-99');
INSERT INTO `harilibur_detail` VALUES ('LB24002', '12349');
INSERT INTO `harilibur_detail` VALUES ('LB24003', '12345');
INSERT INTO `harilibur_detail` VALUES ('LB24003', '3636');

-- ----------------------------
-- Table structure for jam_kerja
-- ----------------------------
DROP TABLE IF EXISTS `jam_kerja`;
CREATE TABLE `jam_kerja`  (
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_jam_kerja` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `awal_jam_masuk` time(0) NOT NULL,
  `jam_masuk` time(0) NOT NULL,
  `akhir_jam_masuk` time(0) NOT NULL,
  `awal_jam_istirahat` time(0) NULL DEFAULT NULL,
  `akhir_jam_istirahat` time(0) NULL DEFAULT NULL,
  `status_istirahat` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jam_pulang` time(0) NOT NULL,
  `total_jam` smallint(0) NOT NULL,
  `lintashari` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_jam_kerja`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jam_kerja
-- ----------------------------
INSERT INTO `jam_kerja` VALUES ('NON', 'Non Shift', '07:00:00', '07:30:00', '11:00:00', NULL, NULL, '0', '17:00:00', 7, '0');
INSERT INTO `jam_kerja` VALUES ('SH1', 'Shift Pagi', '06:30:00', '07:00:00', '07:30:00', '12:00:00', '13:00:00', '1', '15:00:00', 7, '0');
INSERT INTO `jam_kerja` VALUES ('SH2', 'Shift Siang', '14:30:00', '15:00:00', '15:30:00', '19:00:00', '20:00:00', '1', '23:00:00', 7, '0');
INSERT INTO `jam_kerja` VALUES ('SH3', 'Shift Malam', '22:30:00', '23:00:00', '23:30:00', '03:00:00', '04:00:00', '1', '07:00:00', 7, '1');

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan`  (
  `nik` char(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `nama_lengkap` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jabatan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_hp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `foto` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_dept` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_cabang` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_location` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  `status_jam_kerja` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nik`) USING BTREE,
  INDEX `fk_karyawan_cabang`(`kode_cabang`) USING BTREE,
  INDEX `fk_karyawan_dept`(`kode_dept`) USING BTREE,
  CONSTRAINT `fk_karyawan_cabang` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang` (`kode_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_karyawan_dept` FOREIGN KEY (`kode_dept`) REFERENCES `departemen` (`kode_dept`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
INSERT INTO `karyawan` VALUES ('2503001', 'Johny Darmawan', 'Manager IT', '085156528218', '2503001.png', 'IT', 'C6', '0', '0', '$2y$10$g8nhPbF31O0SXUO0VGaUiueALlOTW.SeE3TO3fSp.rrb7QveLju.2', NULL);
INSERT INTO `karyawan` VALUES ('2503002', 'Dian Wahyu Hidayat', 'Manager IT', '085156528218', '2503002.png', 'DSN', 'C6', '0', '0', '$2y$10$85VIBytNzJWgn5a1VihwX.KvmELR0P0zIHPuZuaDortaECOkypAC6', NULL);

-- ----------------------------
-- Table structure for konfigurasi_jamkerja
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi_jamkerja`;
CREATE TABLE `konfigurasi_jamkerja`  (
  `nik` char(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hari` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `fk_kj_jk`(`kode_jam_kerja`) USING BTREE,
  INDEX `fk_kj_karyawan`(`nik`) USING BTREE,
  CONSTRAINT `fk_kj_jk` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `jam_kerja` (`kode_jam_kerja`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kj_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of konfigurasi_jamkerja
-- ----------------------------
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503001', 'Senin', 'NON');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503001', 'Selasa', 'NON');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503001', 'Rabu', 'NON');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503001', 'Kamis', 'NON');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503001', 'Jumat', 'NON');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503001', 'Sabtu', 'NON');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503001', 'Minggu', 'NON');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503002', 'Senin', 'SH1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503002', 'Selasa', 'SH1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503002', 'Rabu', 'SH1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503002', 'Kamis', 'SH1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503002', 'Jumat', 'SH1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503002', 'Sabtu', 'SH1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('2503002', 'Minggu', NULL);

-- ----------------------------
-- Table structure for konfigurasi_jamkerja_by_date
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi_jamkerja_by_date`;
CREATE TABLE `konfigurasi_jamkerja_by_date`  (
  `nik` char(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `fk_kjbydate_karyawan`(`nik`) USING BTREE,
  CONSTRAINT `fk_kjbydate_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for konfigurasi_jk_dept
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi_jk_dept`;
CREATE TABLE `konfigurasi_jk_dept`  (
  `kode_jk_dept` char(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_cabang` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_dept` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_jk_dept`) USING BTREE,
  INDEX `fk_kjd_cabang`(`kode_cabang`) USING BTREE,
  INDEX `fk_kjd_dept`(`kode_dept`) USING BTREE,
  CONSTRAINT `fk_kjd_cabang` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang` (`kode_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kjd_dept` FOREIGN KEY (`kode_dept`) REFERENCES `departemen` (`kode_dept`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of konfigurasi_jk_dept
-- ----------------------------
INSERT INTO `konfigurasi_jk_dept` VALUES ('JK8PRD', 'K8', 'PRD');

-- ----------------------------
-- Table structure for konfigurasi_jk_dept_detail
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi_jk_dept_detail`;
CREATE TABLE `konfigurasi_jk_dept_detail`  (
  `kode_jk_dept` char(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hari` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `fk_jkdept`(`kode_jk_dept`) USING BTREE,
  CONSTRAINT `fk_jkdept` FOREIGN KEY (`kode_jk_dept`) REFERENCES `konfigurasi_jk_dept` (`kode_jk_dept`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of konfigurasi_jk_dept_detail
-- ----------------------------
INSERT INTO `konfigurasi_jk_dept_detail` VALUES ('JK8PRD', 'Senin', 'SH1');
INSERT INTO `konfigurasi_jk_dept_detail` VALUES ('JK8PRD', 'Selasa', 'SH1');
INSERT INTO `konfigurasi_jk_dept_detail` VALUES ('JK8PRD', 'Rabu', 'SH1');
INSERT INTO `konfigurasi_jk_dept_detail` VALUES ('JK8PRD', 'Kamis', 'SH1');
INSERT INTO `konfigurasi_jk_dept_detail` VALUES ('JK8PRD', 'Jumat', 'SH1');
INSERT INTO `konfigurasi_jk_dept_detail` VALUES ('JK8PRD', 'Sabtu', NULL);

-- ----------------------------
-- Table structure for master_cuti
-- ----------------------------
DROP TABLE IF EXISTS `master_cuti`;
CREATE TABLE `master_cuti`  (
  `kode_cuti` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_cuti` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jml_hari` smallint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`kode_cuti`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_cuti
-- ----------------------------
INSERT INTO `master_cuti` VALUES ('C01', 'Tahunan', 12);
INSERT INTO `master_cuti` VALUES ('C02', 'Cuti Melahirkan', 90);
INSERT INTO `master_cuti` VALUES ('C04', 'Cuti Menikah', 2);
INSERT INTO `master_cuti` VALUES ('UMR', 'Cuti Umroh', 15);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (2, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (4, '2023_12_14_233749_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (5, '2023_12_15_002819_create_permission_tables', 2);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint(0) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint(0) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `fk_users` FOREIGN KEY (`model_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 8);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 9);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 10);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 12);

-- ----------------------------
-- Table structure for pengajuan_izin
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan_izin`;
CREATE TABLE `pengajuan_izin`  (
  `kode_izin` char(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik` char(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_izin_dari` date NULL DEFAULT NULL,
  `tgl_izin_sampai` date NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'i : izin s : sakit',
  `kode_cuti` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `doc_sid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_approved` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0' COMMENT '0 : Pending 1: Disetuji 2: Ditolak',
  PRIMARY KEY (`kode_izin`) USING BTREE,
  INDEX `fk_pengajuan_cuti`(`kode_cuti`) USING BTREE,
  INDEX `fk_pengajuan_karyawan`(`nik`) USING BTREE,
  CONSTRAINT `fk_pengajuan_cuti` FOREIGN KEY (`kode_cuti`) REFERENCES `master_cuti` (`kode_cuti`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pengajuan_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengajuan_izin
-- ----------------------------
INSERT INTO `pengajuan_izin` VALUES ('IZ0325001', '2503001', '2025-03-19', '2025-03-21', 'i', NULL, 'Mau Liburan', NULL, '2');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_guard_name_unique`(`name`, `guard_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'view-karyawan', 'web', '2023-12-15 00:36:28', '2023-12-15 00:36:28');
INSERT INTO `permissions` VALUES (2, 'view-departemen', 'web', '2023-12-15 00:36:28', '2023-12-15 00:36:28');

-- ----------------------------
-- Table structure for presensi
-- ----------------------------
DROP TABLE IF EXISTS `presensi`;
CREATE TABLE `presensi`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `nik` char(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_presensi` date NOT NULL,
  `jam_in` time(0) NULL DEFAULT NULL,
  `jam_out` time(0) NULL DEFAULT NULL,
  `foto_in` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto_out` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lokasi_in` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `lokasi_out` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_izin` char(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_prensesi_pengajuan_izin`(`kode_izin`) USING BTREE,
  INDEX `fk_presensi_jk`(`kode_jam_kerja`) USING BTREE,
  INDEX `fk_presensi_karyawan`(`nik`) USING BTREE,
  CONSTRAINT `fk_prensesi_pengajuan_izin` FOREIGN KEY (`kode_izin`) REFERENCES `pengajuan_izin` (`kode_izin`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_presensi_jk` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `jam_kerja` (`kode_jam_kerja`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_presensi_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presensi
-- ----------------------------
INSERT INTO `presensi` VALUES (42, '2503001', '2025-03-16', '05:51:57', '06:23:42', '2503001-2025-03-16-in.png', '2503001-2025-03-16-out.png', '-6.9369856,107.6166656', '-6.9369856,107.6166656', 'NON', 'h', NULL);
INSERT INTO `presensi` VALUES (46, '2503002', '2025-03-16', '10:22:29', NULL, '2503002-2025-03-16-in.png', NULL, '-6.9173248,107.6133888', NULL, 'NON', 'h', NULL);

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint(0) UNSIGNED NOT NULL,
  `role_id` bigint(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name`, `guard_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'administrator', 'web', '2023-12-15 00:36:28', '2023-12-15 00:36:28');
INSERT INTO `roles` VALUES (2, 'admin departemen', 'web', '2023-12-18 00:22:14', '2023-12-18 00:22:14');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_dept` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kode_cabang` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (8, 'Maman', 'maman@gmail.com', NULL, '$2y$10$5KAJ9bbfApiggsMxCjEHTOq8qTxlIeGCgttEf.sf3O2bNuhMW25.G', 'IT', 'PST', NULL, '2023-12-18 22:43:16', '2023-12-18 22:43:16');
INSERT INTO `users` VALUES (9, 'Adam Adifa', 'adam@gmail.com', NULL, '$2y$10$QyRg7XiipzUiFQjwLD/aFOYqimZNNwi65yH76hRybocmt0N0Cjbye', 'IT', 'PST', NULL, '2023-12-18 22:45:36', '2023-12-18 22:45:36');
INSERT INTO `users` VALUES (10, 'Fitriani', 'fitriani@gmail.com', NULL, '$2y$10$Sf3Gb.hSt54gj3pflkf1dufGXmBC3GGz0Up4LTywaZOhsKorpUzuS', 'KEU', 'TSM', NULL, '2023-12-22 10:48:45', '2023-12-22 10:48:45');
INSERT INTO `users` VALUES (12, 'Qiana', 'qiana@gmail.com', NULL, '$2y$10$7WKBW.2e7L4p1lyKnELAeOjsemSQa1Oib8GGpZhmkWe9rKACXZUl6', 'IT', 'BDG', NULL, '2023-12-22 10:53:17', '2023-12-22 10:53:17');

-- ----------------------------
-- View structure for q_rekappresensi
-- ----------------------------
DROP VIEW IF EXISTS `q_rekappresensi`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `q_rekappresensi` AS select `karyawan`.`nik` AS `nik`,`karyawan`.`nama_lengkap` AS `nama_lengkap`,`karyawan`.`jabatan` AS `jabatan`,`presensi`.`tgl_1` AS `tgl_1`,`presensi`.`tgl_2` AS `tgl_2`,`presensi`.`tgl_3` AS `tgl_3`,`presensi`.`tgl_4` AS `tgl_4`,`presensi`.`tgl_5` AS `tgl_5`,`presensi`.`tgl_6` AS `tgl_6`,`presensi`.`tgl_7` AS `tgl_7`,`presensi`.`tgl_8` AS `tgl_8`,`presensi`.`tgl_9` AS `tgl_9`,`presensi`.`tgl_10` AS `tgl_10`,`presensi`.`tgl_11` AS `tgl_11`,`presensi`.`tgl_12` AS `tgl_12`,`presensi`.`tgl_13` AS `tgl_13`,`presensi`.`tgl_14` AS `tgl_14`,`presensi`.`tgl_15` AS `tgl_15`,`presensi`.`tgl_16` AS `tgl_16`,`presensi`.`tgl_17` AS `tgl_17`,`presensi`.`tgl_18` AS `tgl_18`,`presensi`.`tgl_19` AS `tgl_19`,`presensi`.`tgl_20` AS `tgl_20`,`presensi`.`tgl_21` AS `tgl_21`,`presensi`.`tgl_22` AS `tgl_22`,`presensi`.`tgl_23` AS `tgl_23`,`presensi`.`tgl_24` AS `tgl_24`,`presensi`.`tgl_25` AS `tgl_25`,`presensi`.`tgl_26` AS `tgl_26`,`presensi`.`tgl_27` AS `tgl_27`,`presensi`.`tgl_28` AS `tgl_28`,`presensi`.`tgl_29` AS `tgl_29`,`presensi`.`tgl_30` AS `tgl_30`,`presensi`.`tgl_31` AS `tgl_31` from (`karyawan` left join (select `presensi`.`nik` AS `nik`,max(if((`presensi`.`tgl_presensi` = '2023-11-01'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_1`,max(if((`presensi`.`tgl_presensi` = '2023-11-02'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_2`,max(if((`presensi`.`tgl_presensi` = '2023-11-03'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_3`,max(if((`presensi`.`tgl_presensi` = '2023-11-04'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_4`,max(if((`presensi`.`tgl_presensi` = '2023-11-05'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_5`,max(if((`presensi`.`tgl_presensi` = '2023-11-06'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_6`,max(if((`presensi`.`tgl_presensi` = '2023-11-07'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_7`,max(if((`presensi`.`tgl_presensi` = '2023-11-08'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_8`,max(if((`presensi`.`tgl_presensi` = '2023-11-09'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_9`,max(if((`presensi`.`tgl_presensi` = '2023-11-10'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_10`,max(if((`presensi`.`tgl_presensi` = '2023-11-11'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_11`,max(if((`presensi`.`tgl_presensi` = '2023-11-12'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_12`,max(if((`presensi`.`tgl_presensi` = '2023-11-13'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_13`,max(if((`presensi`.`tgl_presensi` = '2023-11-14'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_14`,max(if((`presensi`.`tgl_presensi` = '2023-11-15'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_15`,max(if((`presensi`.`tgl_presensi` = '2023-11-16'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_16`,max(if((`presensi`.`tgl_presensi` = '2023-11-17'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_17`,max(if((`presensi`.`tgl_presensi` = '2023-11-18'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_18`,max(if((`presensi`.`tgl_presensi` = '2023-11-19'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_19`,max(if((`presensi`.`tgl_presensi` = '2023-11-20'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_20`,max(if((`presensi`.`tgl_presensi` = '2023-11-21'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_21`,max(if((`presensi`.`tgl_presensi` = '2023-11-22'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_22`,max(if((`presensi`.`tgl_presensi` = '2023-11-23'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_23`,max(if((`presensi`.`tgl_presensi` = '2023-11-24'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_24`,max(if((`presensi`.`tgl_presensi` = '2023-11-25'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_25`,max(if((`presensi`.`tgl_presensi` = '2023-11-26'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_26`,max(if((`presensi`.`tgl_presensi` = '2023-11-27'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_27`,max(if((`presensi`.`tgl_presensi` = '2023-11-28'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_28`,max(if((`presensi`.`tgl_presensi` = '2023-11-29'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_29`,max(if((`presensi`.`tgl_presensi` = '2023-11-30'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_30`,max(if((`presensi`.`tgl_presensi` = '2023-11-31'),concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_31` from ((`presensi` left join `jam_kerja` on((`presensi`.`kode_jam_kerja` = `jam_kerja`.`kode_jam_kerja`))) left join `pengajuan_izin` on((`presensi`.`kode_izin` = `pengajuan_izin`.`kode_izin`))) group by `presensi`.`nik`) `presensi` on((`karyawan`.`nik` = `presensi`.`nik`)));

SET FOREIGN_KEY_CHECKS = 1;
