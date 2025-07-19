# Suitmedia Flutter

Aplikasi Flutter dengan 3 layar yang mendemonstrasikan navigasi, pengecekan palindrom, dan integrasi API.

## 📱 Fitur Utama

### 1. Palindrome Page (Layar Pertama)

- Input nama pengguna
- Input kalimat untuk pengecekan palindrom
- Validasi palindrom dengan dialog hasil
- Navigasi ke Welcome Page dengan membawa nama pengguna

### 2. Welcome Page (Layar Kedua)

- Menampilkan nama pengguna dari layar sebelumnya
- Label "Selected User Name" yang dapat diperbarui
- Tombol "Choose a User" untuk navigasi ke layar ketiga
- Divider di bawah AppBar untuk pemisahan visual

### 3. Select User Page (Layar Ketiga)

- Daftar pengguna dari API reqres.in
- Pull-to-refresh untuk memuat ulang data
- Infinite scrolling dengan pagination
- Tampilan avatar, nama lengkap, dan email pengguna
- Pemilihan pengguna yang mengembalikan nama ke layar kedua
- Empty state ketika tidak ada data
- Divider di bawah AppBar untuk konsistensi UI

## 🛠️ Teknologi yang Digunakan

- **Flutter**: Framework utama untuk pengembangan aplikasi
- **GetX**: State management dan navigasi
- **HTTP**: Untuk komunikasi dengan API
- **reqres.in API**: Sumber data pengguna
