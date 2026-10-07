import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Janji Temu',
      home: const LoginPage(),
    );
  }
}

// ===============================
// HALAMAN LOGIN
// ===============================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  // Controller username
  TextEditingController usernameController =
      TextEditingController();

  // Controller password
  TextEditingController passwordController =
      TextEditingController();

  // Fungsi Login
  void login() {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    // CEK INPUT KOSONG
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Username dan password wajib diisi!",
          ),
          backgroundColor: Colors.red,
        ),
      );

      // Tidak boleh pindah halaman
      return;
    }

    // CEK USERNAME DAN PASSWORD
    if (username == "admin" && password == "12345") {
      
      // Pindah ke Homepage
      // pushReplacement supaya tidak bisa kembali
      // ke halaman login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      );
    } else {
      // Jika username/password salah
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Username atau password salah!",
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Background sesuai desain kamu
      backgroundColor: const Color.fromARGB(
        255,
        178,
        235,
        242,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // ===============================
              // ICON ADMIN
              // ===============================

              const Icon(
                Icons.admin_panel_settings,
                size: 100,
                color: Colors.black,
              ),

              const SizedBox(height: 15),

              // ===============================
              // JUDUL
              // ===============================

              const Text(
                "Masuk Admin",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Masukkan username dan password",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 30),

              // ===============================
              // USERNAME
              // ===============================

              SizedBox(
                width: 350,
                height: 55,

                child: TextField(
                  controller: usernameController,

                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Masukkan username",

                    prefixIcon: const Icon(
                      Icons.person,
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ===============================
              // PASSWORD
              // ===============================

              SizedBox(
                width: 350,
                height: 55,

                child: TextField(
                  controller: passwordController,

                  // Password disembunyikan
                  obscureText: true,

                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Masukkan password",

                    prefixIcon: const Icon(
                      Icons.lock,
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ===============================
              // TOMBOL LOGIN
              // ===============================

              SizedBox(
                width: 180,
                height: 48,

                child: ElevatedButton(
                  onPressed: login,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),

                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ===============================
// HOMEPAGE ADMIN
// ===============================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color.fromARGB(
        255,
        178,
        235,
        242,
      ),

      appBar: AppBar(
        title: const Text(
          "Dashboard Admin",
        ),

        backgroundColor: Colors.white,

        foregroundColor: Colors.black,

        elevation: 0,

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),

            child: Icon(
              Icons.person,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          children: [

            const SizedBox(height: 30),

            // ===============================
            // MENU ADMIN
            // ===============================

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,

              children: [

                // Tambah Dokter
                menuButton(
                  icon: Icons.person_add,
                  text: "Tambah Dokter",
                  color: Colors.blue,
                ),

                // Lihat Semua Dokter
                menuButton(
                  icon: Icons.people,
                  text: "Lihat Semua\nDokter",
                  color: Colors.green,
                ),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,

              children: [

                // Update Jadwal
                menuButton(
                  icon: Icons.calendar_month,
                  text: "Update Jadwal\nDokter",
                  color: Colors.orange,
                ),

                // Hapus Dokter
                menuButton(
                  icon: Icons.delete,
                  text: "Hapus Dokter",
                  color: Colors.red,
                ),
              ],
            ),

            const Spacer(),

            // ===============================
            // TOMBOL KELUAR
            // ===============================

            SizedBox(
              width: 220,
              height: 50,

              child: ElevatedButton(
                onPressed: () {
                  // Kembali ke login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),

                child: const Text(
                  "Keluar",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ===============================
  // WIDGET MENU
  // ===============================

  static Widget menuButton({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      width: 140,
      height: 120,

      decoration: BoxDecoration(
        color: color.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            size: 40,
            color: Colors.black,
          ),

          const SizedBox(height: 10),

          Text(
            text,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}