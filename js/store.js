// ALK System - localStorage Store Helper

const STORAGE_KEYS = {
  SESSION: 'ALK_session',
  USERS: 'ALK_users',
  ANGGOTA: 'ALK_anggota',
  KEHADIRAN: 'ALK_kehadiran',
  CATATAN_TIDAK_HADIR: 'ALK_catatan_tidak_hadir',
  PENYATA_COLUMN: 'ALK_penyata_column',
  PENYATA_ROW: 'ALK_penyata_row',
  PENYATA_DATA: 'ALK_penyata_data',
  LOG_AKTIVITI: 'ALK_log_aktiviti',
  RESET_REQUESTS: 'ALK_reset_requests'
};

const Store = {
  get(key, defaultValue = []) {
    try {
      const data = localStorage.getItem(key);
      return data ? JSON.parse(data) : defaultValue;
    } catch (e) {
      console.error(`Error reading ${key} from localStorage:`, e);
      return defaultValue;
    }
  },

  set(key, value) {
    try {
      localStorage.setItem(key, JSON.stringify(value));
    } catch (e) {
      console.error(`Error writing ${key} to localStorage:`, e);
    }
  },

  remove(key) {
    localStorage.removeItem(key);
  },

  // Helper for generating auto-increment style integer IDs
  getNextId(key) {
    const list = this.get(key, []);
    if (list.length === 0) return 1;
    const maxId = list.reduce((max, item) => (item.id && Number(item.id) > max ? Number(item.id) : max), 0);
    return maxId + 1;
  },

  // Log activity helper
  addLog(userId, aksi, butiran) {
    const logs = this.get(STORAGE_KEYS.LOG_AKTIVITI, []);
    const newLog = {
      id: this.getNextId(STORAGE_KEYS.LOG_AKTIVITI),
      user_id: userId,
      aksi: aksi,
      butiran: butiran,
      created_at: new Date().toISOString()
    };
    logs.unshift(newLog); // newest first
    this.set(STORAGE_KEYS.LOG_AKTIVITI, logs);
  }
};
