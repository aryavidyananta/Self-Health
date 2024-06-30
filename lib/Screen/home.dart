import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:my_self/Screen/AddTypes.dart';
import 'package:my_self/Screen/CreateNotes.dart';
import 'package:my_self/Screen/DetailScreen.dart';
import 'package:my_self/Screen/Login.dart';
// ignore: unused_import
import 'package:my_self/Screen/MindHaven/About.dart';
// ignore: unused_import
import 'package:my_self/Screen/MindHaven/addquiet.dart';
// ignore: unused_import
import 'package:my_self/Screen/addJurnal.dart';
// ignore: unused_import
import 'package:my_self/Screen/profile.dart';
import 'package:my_self/component/size_config.dart';
import 'package:my_self/cubit/datalogin/data_login_cubit.dart';
import 'package:my_self/dbhelper/Db_helper.dart';
// ignore: unused_import
import 'package:my_self/styles/Grid.dart';
import 'package:my_self/styles/Style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(''),
        // Optionally add actions to the app bar if needed
        // ignore: prefer_const_literals_to_create_immutables
        actions: [],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            BlocBuilder<DataLoginCubit, DataLoginState>(
              builder: (context, state) {
                if (state is DataLoginInitial) {
                  return DrawerHeader(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 13, 143, 134),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/master.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Hi, Selamat Bergabung',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        BlocBuilder<DataLoginCubit, DataLoginState>(
                          builder: (context, state) {
                            if (state is DataLoginState) {
                              final profile = state.profile;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    profile.namapengguna ?? '-',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    profile.email ?? '-',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const Text(
                                'Belum ada pengguna',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  );

                  // ignore: unnecessary_type_check
                } else if (state is DataLoginState) {
                  return DrawerHeader(
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 13, 143, 134),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // ignore: prefer_const_constructors
                            image: DecorationImage(
                              image:
                                  const AssetImage("assets/images/master.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Hi, ${state.IdPengguna}', // Display user's name
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          state.roles, // Display user roles here
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox
                    .shrink(); // Return an empty widget or null if needed
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Tentang Aplikasi'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutAppScreen(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Qoutes'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTypes(),
                    ));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Wrap your body with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 6),
          child: const Column(
            children: [
              // ignore: unnecessary_const
              // const UserInfo(),
              SizedBox(height: 20),
              GetBestMedicalService(),
              // ignore: prefer_const_constructors
              VerticalScrollView(),
              SizedBox(
                height: 20,
              ),
              DoctorList(),
              SizedBox(
                height: 20,
              ),
              TypesList(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  // ignore: use_super_parameters
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataLoginCubit, DataLoginState>(
      builder: (context, state) {
        if (state is DataLoginInitial) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text("Hi, Selamat Bergabung"),
            subtitle: Text(
              "Belum ada pengguna", // Pesan default jika belum ada pengguna yang login
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            trailing: ClipOval(
              child: Container(
                height: 48,
                width: 48,
                color: Colors.grey[300],
                // Placeholder image or default avatar
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ),
          );
          // ignore: unnecessary_type_check
        } else if (state is DataLoginState) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
                "Hi, Selamat Bergabung ${state.IdPengguna}"), // Display user's name
            subtitle: Text(
              state.roles, // Menampilkan roles pengguna yang login
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          );
        }
        return const SizedBox
            .shrink(); // Mengembalikan widget kosong jika tidak ada data yang tersedia
      },
    );
  }
}

class GetBestMedicalService extends StatelessWidget {
  final double cardHeight;
  final double cardWidth;

  const GetBestMedicalService({
    super.key,
    this.cardHeight = 150.0,
    this.cardWidth = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final PageController controller = PageController();

    return Column(
      children: [
        SizedBox(
          height:
              cardHeight + 20, // Adjust height to accommodate cards and spacing
          child: PageView(
            controller: controller,
            children: [
              _buildServiceCard(
                context,
                "Kenali Kami",
                "Sesuaikan diri menurut MindHeaven. Beri Peluang bagimu untuk mendeteksi kesehatan mental sejak dini ",
                "assets/images/health.png",
              ),
              _buildServiceCard(
                context,
                "Masih Ragu?",
                "Aplikasi MindHaven memiliki koneksi dengan dokter psikolog terpercaya. Percaya pada kualitas dirimu bukan kata orang lain.",
                "assets/images/kecemasan.png",
              ),
              _buildServiceCard(
                context,
                "Buat Jurnalmu!!!",
                "Jurnal merupakan salah satu fitur kami yang dapat membantu kamu dalam mengungkapkan perasaanmu. Kami akan menjaga dengan baik rahasiamu",
                "assets/images/makan.png",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceCard(BuildContext context, String title,
      String description, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal! * 3,
      ),
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          color: const Color(0xffDCEDF9),
          borderRadius: BorderRadius.circular(20), // Added corner radius
        ),
        child: Row(
          children: [
            Expanded(
              child: Image.asset(imagePath),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal! * 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeHorizontal! * 1),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            fontSize: 11,
                            height: 1.5,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalScrollView extends StatelessWidget {
  const VerticalScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCategoryCard('Hidup Sehat itu Penting'),
              _buildCategoryCard('Konsultasi'),
              _buildCategoryCard('Meditasi'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title) {
    return Container(
      height: 90,
      width: 180,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF008442), Color(0xFF00A850)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20), // Set corner radius here
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "ayo motivasi dirimu!!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class TypesList extends StatelessWidget {
  const TypesList({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: SQLHelper.getAllData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No data available"));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var data = snapshot.data![index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(data: data),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.blue.shade50],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            data['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(data: data),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Baca Selengkapnya',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
