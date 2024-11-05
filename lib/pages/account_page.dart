import 'package:flutter/material.dart';
import 'login_page.dart';
import 'profile.dart'; // Import halaman profile

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 1; // Set to 1 karena ini halaman Akun

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: // Home
        Navigator.pop(context); // Kembali ke Dashboard
        break;

      case 1: // Akun
        // Sudah di halaman akun, tidak perlu melakukan apa-apa
        break;

      case 2: // Logout
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Logout'),
              content: const Text('Apakah Anda yakin ingin keluar?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    // Tutup dialog
                    Navigator.pop(context);
                    // Navigate ke halaman login dan hapus semua rute sebelumnya
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false,
                    );
                  },
                  child: const Text('Ya'),
                ),
              ],
            );
          },
        );
        break;
    }
  }

  // Fungsi untuk menangani tap pada menu item
  void _handleMenuTap(String menu) {
    switch (menu) {
      case 'Kelola Akun':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
      // Tambahkan case lain untuk menu lainnya jika diperlukan
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F0FE),
      body: SafeArea(
        child: Column(
          children: [
            // Profile Section
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Profile Image Grid
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Name and University
                        const Column(
                          children: [
                            Text(
                              'Dimas Santoso',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'University of Technology Yogyakarta',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Menu Items dengan GestureDetector untuk handling tap
            GestureDetector(
              onTap: () => _handleMenuTap('Kelola Akun'),
              child: _buildMenuItem('Kelola Akun', Icons.arrow_forward_ios),
            ),
            _buildMenuItem('Notifikasi', Icons.arrow_forward_ios),
            _buildMenuItem('Privacy Policy', Icons.arrow_forward_ios),
            _buildMenuItem('Terms of Service', Icons.arrow_forward_ios),

            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(icon, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
