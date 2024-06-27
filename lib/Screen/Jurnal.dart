// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:my_self/Screen/CRUDJurnal.dart';
import 'package:my_self/Screen/MindHaven/ReadJurnal.dart';
// ignore: unused_import
import 'package:my_self/Screen/addJurnal.dart';
// ignore: unused_import
import 'package:my_self/Screen/home.dart';
import 'package:my_self/component/size_config.dart';

import 'AddTypes.dart';

class JurnalScreen extends StatelessWidget {
  const JurnalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 7),
            child: const Column(
              children: [
                ButtonBar(),
                Text(
                  'Catatan Kamu',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
                GetBestMedicalService(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Kategori Jurnal",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
                GetBestMedicalService1(),
                GetBestMedicalService2(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GetBestMedicalService extends StatelessWidget {
  // ignore: use_super_parameters
  const GetBestMedicalService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeHorizontal! * 3),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 17, 150, 245),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotesScreen()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Riwayat Catatan",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeHorizontal! * 1),
                          Text(
                            "Lihat daftar catatan yang telah kamu tulis",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  fontSize: 11,
                                  height: 1.5,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(child: Image.asset("assets/images/makan.png"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GetBestMedicalService1 extends StatelessWidget {
  // ignore: use_super_parameters
  const GetBestMedicalService1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeHorizontal! * 3),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 252, 98, 147),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReadJurnalScreen()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Quality Of Life",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeHorizontal! * 1),
                          Text(
                            "Jurnal Mengenai keseharianmu",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  fontSize: 11,
                                  height: 1.5,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(child: Image.asset("assets/images/mood.png"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GetBestMedicalService2 extends StatelessWidget {
  const GetBestMedicalService2({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeHorizontal! * 3),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 252, 191, 7),
                borderRadius: BorderRadius.circular(18.0)),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Self-Potensial",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                  ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeHorizontal! * 1),
                        Text(
                          "Kenali dirimu lebih baik dengan jurnal ini",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                    fontSize: 11,
                                    height: 1.5,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Image.asset("assets/images/cemas.png"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GetBestMedicalService3 extends StatelessWidget {
  const GetBestMedicalService3({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeHorizontal! * 3),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 135, 56, 247),
                borderRadius: BorderRadius.circular(18.0)),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Personal Skills",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                  ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeHorizontal! * 1),
                        Text(
                          "Jurnal mengenaik peningkatan skill kamu",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                    fontSize: 11,
                                    height: 1.5,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Image.asset("assets/images/health.png"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GetBestMedicalService4 extends StatelessWidget {
  const GetBestMedicalService4({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeHorizontal! * 3),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xffDCEDF9),
                borderRadius: BorderRadius.circular(18.0)),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Confident",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                  ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeHorizontal! * 1),
                        Text(
                          "Jurnal-Jurnal Menarik",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                    fontSize: 11,
                                    height: 1.5,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Image.asset("assets/images/health.png"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
