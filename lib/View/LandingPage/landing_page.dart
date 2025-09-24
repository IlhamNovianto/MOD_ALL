import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_on_duty/Util/Popup/popUpLogoutBack.dart';
import 'package:manager_on_duty/Util/Widget/costume_Appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPageMaker extends StatefulWidget {
  const LandingPageMaker({super.key});

  @override
  State<LandingPageMaker> createState() => _LandingPageMakerState();
}

class _LandingPageMakerState extends State<LandingPageMaker> {
  //Gm1Controller gm1controller = Get.put(Gm1Controller());

  @override
  void initState() {
    getPref();
    //getPrefCekToken();
    // cekSession();
    super.initState();
  }

  String? userId;
  String? username;
  String? token;
  String? peranan;
  bool? visibleBM = false;
  String? bmTiket;

  void getPref() async {
    SharedPreferences getDataUser = await SharedPreferences.getInstance();
    setState(() {
      userId = getDataUser.getString('userid');
      username = getDataUser.getString('username');
      token = getDataUser.getString('token');
      peranan = getDataUser.getString('peranan');
      bmTiket = getDataUser.getString('bmtiket');

      if (peranan == 'General Manager') {
        visibleBM = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: CustomAppBar(
          username: username,
          userId: userId,
          onLogout: () {
            popUpLogoutBack();
          },
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            popUpLogoutBack();
            //logout(userId: userId);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //
                          //================ MENU ======================
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  //cekSession();
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'images/daily.png',
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: ElevatedButton(
                                          onPressed: () async {
                                            //cekSession();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            textStyle:
                                                const TextStyle(fontSize: 14),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            elevation: 10,
                                          ),
                                          child: const Text('CHECKLIST MOD',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),

                          ///========================= REPORT MOD =================
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Pindah Halaman
                                  //Get.to(const HistorymodPage());
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'images/report.png',
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: ElevatedButton(
                                          onPressed: () {
                                            // Pindah Halaman
                                            //Get.to(const HistorymodPage());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            textStyle:
                                                const TextStyle(fontSize: 14),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            elevation: 10,
                                          ),
                                          child: const Text('Report MOD',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  // ====================== BM MENU ===========================
                  Visibility(
                    visible: visibleBM!,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // gm1controller.getListUnit();
                            // Get.to(const GmPage());
                            // Get.to(const Gm1Page());
                            menuX();
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'images/bmicon.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: ElevatedButton(
                                    onPressed: () async {
                                      // gm1controller.getListUnit();
                                      // Get.to(const GmPage());
                                      // Get.to(const Gm1Page());
                                      menuX();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      textStyle: const TextStyle(fontSize: 14),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 10,
                                    ),
                                    child: const Text('CHECKLIST BM',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Popup pilih menu BM
void menuX() {
  showDialog(
      context: Get.context!,
      builder: (context) {
        return SimpleDialog(
          title: Image.asset(
            'images/icon_warning.png',
            width: 50,
            height: 50,
          ),
          contentPadding: const EdgeInsets.all(20),
          children: [
            const Center(
              child: Text(
                "Pilih Filter ?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text(
                        'By Date',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        //Get.to(const GmPage());
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text(
                        'By Unit',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        // Get.to(const Gm1Page());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      });
}
