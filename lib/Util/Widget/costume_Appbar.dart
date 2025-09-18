import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? username;
  final String? userId;
  final VoidCallback? onLogout;

  const CustomAppBar({super.key, this.username, this.userId, this.onLogout});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            showUserProfileDialog();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.person_pin,
                color: Colors.white,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Akun,',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    Text(username ?? '',
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      shadowColor: Colors.black,
      elevation: 5,
      leadingWidth: 110,
      title: SizedBox(width: 120, child: Image.asset('images/gca2Logo.png')),
      centerTitle: true,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Row(
            children: [
              TextButton.icon(
                icon: const Icon(
                  Icons.logout,
                  size: 20,
                  color: Colors.white,
                ),
                label:
                    const Text('Keluar', style: TextStyle(color: Colors.white)),
                onPressed: onLogout,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Fungsi untuk menampilkan popup dialog
void showUserProfileDialog() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('userid');
  String? username = prefs.getString('username');
  String? departement = prefs.getString('departemen');
  String? jobdesk = prefs.getString('peranan');

  await showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Informasi Akun',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.grey,
                size: 150,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('UserId:'),
                    const Spacer(
                      flex: 1,
                    ),
                    Text('$userId'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Username:'),
                    const Spacer(
                      flex: 1,
                    ),
                    Text('$username'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Departement: '),
                    const Spacer(
                      flex: 1,
                    ),
                    Text('$departement'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Role: '),
                    const Spacer(
                      flex: 1,
                    ),
                    Text('$jobdesk'),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue[300])),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: const Text(
                'Kembali',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    },
  );
}
