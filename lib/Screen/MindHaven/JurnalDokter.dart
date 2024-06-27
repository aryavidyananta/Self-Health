// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';
import 'package:my_self/Screen/MindHaven/ReadJurnal.dart';
import 'package:my_self/Screen/MindHaven/TambahJurnal.dart';

import 'package:my_self/component/size_config.dart';

class JurnalDokter extends StatelessWidget {
  const JurnalDokter({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "Kategori Jurnal",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
                GetBestMedicalService1(),
              ],
            ),
          )
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
                              builder: (context) => AddJurnalScreen()),
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
