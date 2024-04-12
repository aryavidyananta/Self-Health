import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_self/component/size_config.dart';
import 'package:my_self/styles/Grid.dart';
import 'package:my_self/styles/Style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 7),
            child: Column(
              children: const [
                UserInfo(),
                SearchMedical(),
                GetBestMedicalService(),
                RekomendSelf(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text("Hello"),
      subtitle: Text(
        "Arya Vdiyananta",
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
      trailing: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/master.jpg"),
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeat),
            borderRadius: BorderRadius.circular(18.0)),
      ),
    );
  }
}

class SearchMedical extends StatelessWidget {
  const SearchMedical({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizedVertical! * 3),
      child: TextFormField(
          decoration: InputDecoration(
        hintText: "Search..",
        fillColor: AppStyle.inputFillColor,
        filled: true,
        prefixIcon: CupertinoButton(
          onPressed: () {},
          child: Icon(Icons.search),
        ),
        suffixIcon:
            CupertinoButton(onPressed: () {}, child: Icon(Icons.filter_list)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(18),
        ),
      )),
    );
  }
}

class GetBestMedicalService extends StatelessWidget {
  const GetBestMedicalService({super.key});

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
                color: Color(0xffDCEDF9),
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
                          "Get The Best Medical Service",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                  ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeHorizontal! * 1),
                        Text(
                          "Get The Best Medical Service",
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

class RekomendSelf extends StatelessWidget {
  const RekomendSelf({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Rekomendasi Self-Improment",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w700, letterSpacing: 1),
        ),
        SizedBox(
          height: SizeConfig.blockSizeHorizontal! * 2,
        ),
        Gridview()
      ],
    );
  }
}
