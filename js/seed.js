// ALK System - Mock Seed Data Initializer

(function initSeedData() {
  if (localStorage.getItem('ALK_initialized')) {
    return; // Already seeded
  }

  // 1. Initial Users
  const defaultUsers = [
    { id: 1, nama: 'Pentadbir Sistem (Admin)', username: 'admin', role: 'admin', bahagian: 'MARKAS', password: '123', first_login: 0, created_at: new Date().toISOString() },
    { id: 2, nama: 'Pengguna Tadbir (User)', username: 'user1', role: 'user', bahagian: 'TADBIR', password: '123', first_login: 0, created_at: new Date().toISOString() },
    { id: 3, nama: 'Pegawai Pemerhati (Viewer)', username: 'viewer1', role: 'viewer', bahagian: 'MARKAS', password: '123', first_login: 0, created_at: new Date().toISOString() }
  ];

  // 2. Initial Anggota
  const defaultAnggota = [
    { id: 1, pangkat: 'Kolonel', no_anggota: '3001234', nama: 'Zulkifli bin Ahmad', bahagian: 'MARKAS', jawatan: 'KOMANDAN', no_ic: '800101-14-5543', no_telefon: '012-3456789', status: 'aktif', gambar: null, tahap_pangkat: 5 },
    { id: 2, pangkat: 'Leftenan Kolonel', no_anggota: '3001235', nama: 'Mohd Razak bin Hashim', bahagian: 'MARKAS', jawatan: 'TIMBALAN KOMANDAN', no_ic: '820315-08-6123', no_telefon: '013-9876543', status: 'aktif', gambar: null, tahap_pangkat: 6 },
    { id: 3, pangkat: 'Mejar', no_anggota: '3002100', nama: 'Syed Hamzah bin Syed Ali', bahagian: 'TADBIR', jawatan: 'Pegawai Memerintah', no_ic: '850520-01-5211', no_telefon: '019-1122334', status: 'aktif', gambar: null, tahap_pangkat: 7 },
    { id: 4, pangkat: 'Kapten', no_anggota: '3003411', nama: 'Ahmad Faiz bin Ibrahim', bahagian: 'TADBIR', jawatan: 'Pegawai Tadbir', no_ic: '900812-10-5887', no_telefon: '017-4455667', status: 'aktif', gambar: null, tahap_pangkat: 8 },
    { id: 5, pangkat: 'Leftenan', no_anggota: '3004899', nama: 'Khairul Anuar bin Osman', bahagian: 'BLK', jawatan: 'Jurulatih Utama', no_ic: '931105-03-6789', no_telefon: '014-5566778', status: 'aktif', gambar: null, tahap_pangkat: 9 },
    { id: 6, pangkat: 'Pegawai Waran I', no_anggota: '1098234', nama: 'Baharudin bin Yassin', bahagian: 'BLK', jawatan: 'PW Makanan', no_ic: '780402-05-5123', no_telefon: '016-7788990', status: 'aktif', gambar: null, tahap_pangkat: 11 },
    { id: 7, pangkat: 'Staf Sarjan', no_anggota: '1123456', nama: 'Azman bin Mansor', bahagian: 'BBK', jawatan: 'Staf Logistik', no_ic: '840719-06-5431', no_telefon: '011-22334455', status: 'aktif', gambar: null, tahap_pangkat: 13 },
    { id: 8, pangkat: 'Sarjan', no_anggota: '1145678', nama: 'Mohd Shafiq bin Ramli', bahagian: 'BBK', jawatan: 'Sarjan Komunikasi', no_ic: '881230-12-6543', no_telefon: '018-9900112', status: 'aktif', gambar: null, tahap_pangkat: 14 },
    { id: 9, pangkat: 'Koperal', no_anggota: '1167890', nama: 'Nizam bin Abdullah', bahagian: 'PNPL', jawatan: 'Koperal Penyelenggara', no_ic: '920228-08-5991', no_telefon: '013-3344556', status: 'aktif', gambar: null, tahap_pangkat: 15 },
    { id: 10, pangkat: 'Awam', no_anggota: 'N04829', nama: 'Siti Sarah binti Ismail', bahagian: 'AWAM', jawatan: 'Pembantu Tadbir (P/O)', no_ic: '950614-14-5002', no_telefon: '012-6677889', status: 'aktif', gambar: null, tahap_pangkat: 99 }
  ];

  // 3. Initial Penyata Columns
  const defaultColumns = [
    { id: 1, nama_column: 'MARKAS' },
    { id: 2, nama_column: 'TADBIR' },
    { id: 3, nama_column: 'BLK' },
    { id: 4, nama_column: 'BBK' },
    { id: 5, nama_column: 'PNPL' },
    { id: 6, nama_column: 'AWAM' }
  ];

  // 4. Initial Penyata Rows
  const defaultRows = [
    { id: 1, kategori: 'dalam_pasukan', nama_row: 'Pegawai Bertugas' },
    { id: 2, kategori: 'dalam_pasukan', nama_row: 'Attend C' },
    { id: 3, kategori: 'dalam_pasukan', nama_row: 'Lain-lain' },
    { id: 4, kategori: 'luar_pasukan', nama_row: 'Cuti' },
    { id: 5, kategori: 'luar_pasukan', nama_row: 'Kursus' },
    { id: 6, kategori: 'luar_pasukan', nama_row: 'Sakit' },
    { id: 7, kategori: 'luar_pasukan', nama_row: 'Tugas Luar' },
    { id: 8, kategori: 'luar_pasukan', nama_row: 'Lain-lain' }
  ];

  // 5. Initial Kehadiran for Today
  const todayStr = new Date().toISOString().split('T')[0];
  const defaultKehadiran = [
    { id: 1, anggota_id: 4, tarikh: todayStr, status: 'hadir', dikemaskini_oleh: 1 },
    { id: 2, anggota_id: 5, tarikh: todayStr, status: 'hadir', dikemaskini_oleh: 1 },
    { id: 3, anggota_id: 6, tarikh: todayStr, status: 'hadir', dikemaskini_oleh: 1 },
    { id: 4, anggota_id: 7, tarikh: todayStr, status: 'tidak_hadir', dikemaskini_oleh: 1 },
    { id: 5, anggota_id: 8, tarikh: todayStr, status: 'tidak_hadir', dikemaskini_oleh: 1 }
  ];

  const defaultCatatanTidakHadir = [
    { id: 1, kehadiran_id: 4, sebab: 'Cuti', lokasi: 'luar_pasukan', tarikh_mula: todayStr, tarikh_tamat: todayStr, catatan: 'Cuti Tahunan' },
    { id: 2, kehadiran_id: 5, sebab: 'Pegawai Bertugas', lokasi: 'dalam_pasukan', tarikh_mula: todayStr, tarikh_tamat: todayStr, catatan: 'Bertugas di Kem' }
  ];

  // 6. Initial Activity Log
  const defaultLog = [
    { id: 1, user_id: 1, aksi: 'Sistem Dicipta', butiran: 'Sistem ALK Mockup sedia digunakan.', created_at: new Date().toISOString() }
  ];

  // Save all into localStorage
  Store.set(STORAGE_KEYS.USERS, defaultUsers);
  Store.set(STORAGE_KEYS.ANGGOTA, defaultAnggota);
  Store.set(STORAGE_KEYS.PENYATA_COLUMN, defaultColumns);
  Store.set(STORAGE_KEYS.PENYATA_ROW, defaultRows);
  Store.set(STORAGE_KEYS.KEHADIRAN, defaultKehadiran);
  Store.set(STORAGE_KEYS.CATATAN_TIDAK_HADIR, defaultCatatanTidakHadir);
  Store.set(STORAGE_KEYS.LOG_AKTIVITI, defaultLog);
  Store.set(STORAGE_KEYS.RESET_REQUESTS, []);

  localStorage.setItem('ALK_initialized', 'true');
})();
