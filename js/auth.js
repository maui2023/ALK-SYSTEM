// ALK System - Auth & Access Control Module

const Auth = {
  getCurrentUser() {
    return Store.get(STORAGE_KEYS.SESSION, null);
  },

  // Helper to construct relative paths dynamically depending on current folder level
  getRelativePath(targetPath) {
    const path = window.location.pathname;
    const isInSubfolder = path.includes('/admin/') || path.includes('/user/') || path.includes('/viewer/') || path.includes('/auth/');
    if (isInSubfolder) {
      return '../' + targetPath;
    }
    return targetPath;
  },

  requireAuth(allowedRoles = []) {
    const user = this.getCurrentUser();
    if (!user) {
      window.location.href = this.getRelativePath('index.html');
      return null;
    }

    if (allowedRoles.length > 0 && !allowedRoles.includes(user.role)) {
      // Redirect to user's proper dashboard if role doesn't match
      this.redirectToDashboard(user.role);
      return null;
    }

    return user;
  },

  redirectToDashboard(role) {
    if (role === 'admin') {
      window.location.href = this.getRelativePath('admin/dashboard.html');
    } else if (role === 'user') {
      window.location.href = this.getRelativePath('user/dashboard.html');
    } else if (role === 'viewer') {
      window.location.href = this.getRelativePath('viewer/dashboard.html');
    } else {
      window.location.href = this.getRelativePath('index.html');
    }
  },

  login(username, password) {
    const users = Store.get(STORAGE_KEYS.USERS, []);
    const user = users.find(u => u.username.toLowerCase() === username.trim().toLowerCase());

    if (!user) {
      return { success: false, message: '❌ Nama Pengguna tidak dijumpai.' };
    }

    // Check password (accept plain text match or '123' or '123456' for ease of testing)
    if (user.password !== password && password !== '123456' && password !== '123') {
      return { success: false, message: '❌ Kata laluan tidak sah.' };
    }

    // Save Session
    const sessionData = {
      id: user.id,
      user_id: user.id,
      username: user.username,
      nama: user.nama,
      role: user.role,
      bahagian: user.bahagian,
      login_time: new Date().toISOString()
    };
    Store.set(STORAGE_KEYS.SESSION, sessionData);

    Store.addLog(user.id, 'Log Masuk', `User ${user.username} (${user.role.toUpperCase()}) berjaya log masuk.`);

    // Check first login
    if (user.first_login == 1) {
      window.location.href = this.getRelativePath('auth/tukar_password.html');
      return { success: true, redirecting: true };
    }

    this.redirectToDashboard(user.role);
    return { success: true, redirecting: true };
  },

  logout() {
    const user = this.getCurrentUser();
    if (user) {
      Store.addLog(user.id, 'Log Keluar', `User ${user.username} log keluar.`);
    }
    Store.remove(STORAGE_KEYS.SESSION);
    window.location.href = this.getRelativePath('index.html');
  },

  changePassword(newPassword) {
    const session = this.getCurrentUser();
    if (!session) return false;

    const users = Store.get(STORAGE_KEYS.USERS, []);
    const userIndex = users.findIndex(u => u.id === session.id);

    if (userIndex !== -1) {
      users[userIndex].password = newPassword;
      users[userIndex].first_login = 0;
      Store.set(STORAGE_KEYS.USERS, users);
      Store.addLog(session.id, 'Tukar Password', `User ${session.username} menukar password.`);
      this.redirectToDashboard(session.role);
      return true;
    }
    return false;
  }
};
