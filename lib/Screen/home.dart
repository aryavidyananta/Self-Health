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
                        // ignore: prefer_const_constructors
                        Text(
                          'Hi, Selamat Bergabung',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        Text(
                          'Belum ada pengguna', // Placeholder text if no user is logged in
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
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
              const UserInfo(),
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

class SearchMedical extends StatelessWidget {
  const SearchMedical({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical! * 3),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search..",
          fillColor: AppStyle.inputFillColor,
          filled: true,
          prefixIcon: CupertinoButton(
            onPressed: () {},
            child: const Icon(Icons.search),
          ),
          suffixIcon: CupertinoButton(
            onPressed: () {},
            child: const Icon(Icons.filter_list),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
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
              _buildCategoryCard('Jurnal'),
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
            "Buat Kamu Yang Sedang Bosen",
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

// ignore: use_key_in_widget_constructors
class DoctorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF00C6FF), Color.fromARGB(255, 0, 114, 255)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/Dokter1.png"),
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. John Doe',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '4.5',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Konsultasi',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
// Ganti dengan import sesuai dengan struktur aplikasi Anda

// Import detail_screen.dart di sini atau sesuaikan dengan struktur proyek Anda

class TypesList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
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
                    // Handle container tap here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(data: data),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
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
                            ),
                          ),
                          subtitle: Text(data['description']),
                          // ignore: prefer_const_constructors
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [],
                          ),
                        ),
                        const SizedBox(height: 2),
                        GestureDetector(
                          onTap: () {
                            // Handle "Baca Selengkapnya" tap here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(data: data),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Baca Selengkapnya',
                              style: TextStyle(
                                color: Colors.blue,
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
            },
          );
        }
      },
    );
  }
}
