import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Belajar Tugas Akhir',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00A8B5),
          primary: const Color(0xFF00A8B5),
          secondary: const Color(0xFFFF8200),
        ),
      ),
      home: const MobileMainScreen(),
    );
  }
}

class MobileMainScreen extends StatefulWidget {
  const MobileMainScreen({super.key});

  @override
  State<MobileMainScreen> createState() => _MobileMainScreenState();
}

class _MobileMainScreenState extends State<MobileMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const EduHomeScreen(),
    const Center(child: Text('Halaman Kelas Saya', style: TextStyle(fontSize: 16))),
    const Center(child: Text('Halaman Diskusi & Tanya Jawab', style: TextStyle(fontSize: 16))),
    const Center(child: Text('Profil Pelajar', style: TextStyle(fontSize: 16))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Color(0xFF00A8B5)),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book, color: Color(0xFF00A8B5)),
            label: 'Kelas',
          ),
          NavigationDestination(
            icon: Icon(Icons.forum_outlined),
            selectedIcon: Icon(Icons.forum, color: Color(0xFF00A8B5)),
            label: 'Diskusi',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Color(0xFF00A8B5)),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class EduHomeScreen extends StatelessWidget {
  const EduHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFF00A8B5),
              child: Icon(Icons.school, color: Colors.white, size: 20),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Rizal!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                Text(
                  'Kelas 12 IPA - Siap UTBK',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Promo / Paket Belajar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00A8B5), Color(0xFF007A87)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00A8B5).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF8200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'TUGAS AKHIR EDU',
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Siap Hadapi Ujian dengan Video Interaktif!',
                    style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Akses ribuan materi pelajaran & latihan soal.',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8200),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    onPressed: () {},
                    child: const Text('Mulai Belajar', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Pilihan Pelajaran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 12),

            // Kategori Mata Pelajaran (Grid 4 Kolom)
            GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildSubjectCategory('Matematika', Icons.calculate, Colors.redAccent),
                _buildSubjectCategory('Fisika', Icons.science, Colors.purpleAccent),
                _buildSubjectCategory('Biologi', Icons.eco, Colors.green),
                _buildSubjectCategory('Kimia', Icons.biotech, Colors.orangeAccent),
                _buildSubjectCategory('B. Inggris', Icons.language, Colors.blueAccent),
                _buildSubjectCategory('Sejarah', Icons.history_edu, Colors.brown),
                _buildSubjectCategory('Tryout', Icons.assignment, const Color(0xFF00A8B5)),
                _buildSubjectCategory('Lainnya', Icons.grid_view, Colors.grey),
              ],
            ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Progress Belajar Kamu',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Lihat Detail', style: TextStyle(color: Color(0xFF00A8B5))),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Card Progress Belajar
            _buildProgressCard('Matematika Wajib - Aljabar', '12 dari 15 Video Selesai', 0.8),
            _buildProgressCard('Fisika - Gelombang Elektromagnetik', '4 dari 10 Video Selesai', 0.4),
          ],
        ),
      ),
    );
  }

  static Widget _buildSubjectCategory(String title, IconData icon, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black87),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  static Widget _buildProgressCard(String title, String subtitle, double progress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.play_circle_fill, color: Color(0xFF00A8B5), size: 28),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00A8B5)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFE0F2F1),
              color: const Color(0xFF00A8B5),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}