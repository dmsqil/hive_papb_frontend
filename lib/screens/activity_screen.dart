import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/activity/activity_bloc.dart';
import '../blocs/activity/activity_event.dart';
import '../blocs/activity/activity_state.dart';
import 'search_screen.dart'; // Pastikan SearchScreen sudah di-import jika diperlukan

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ActivityBloc()..add(LoadActivity()),
      child: DefaultTabController(
        length: 3, // Jumlah tab (Semua, Mengikuti, Balasan)
        child: Scaffold(
          backgroundColor: Colors.black, // Background hitam untuk dark mode
          appBar: AppBar(
            backgroundColor: Colors.black, // AppBar hitam
            title: const Text(
              'Aktivitas',
              style: TextStyle(color: Colors.white), // Warna teks AppBar putih
            ),
            centerTitle: false, // Memusatkan judul di AppBar
            automaticallyImplyLeading: false, // Menghilangkan icon "kembali"
            elevation: 0, // Menghilangkan bayangan AppBar
            bottom: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Semua'),
                Tab(text: 'Mengikuti'),
                Tab(text: 'Balasan'),
              ],
            ),
          ),
          body: BlocBuilder<ActivityBloc, ActivityState>(
            builder: (context, state) {
              if (state is ActivityInitial) {
                return Center(child: CircularProgressIndicator(color: Colors.white));
              } else if (state is ActivityLoaded) {
                return TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: state.activity.length,
                      itemBuilder: (context, index) {
                        final item = state.activity[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[800],
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          title: Text(
                            item['username'],
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            '${item['waktu']} • ${item['status']}',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(0, 185, 185, 185),
                              side: const BorderSide(color: Color.fromARGB(255, 177, 177, 177)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              "Ikuti",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                    Center(child: Text('Tidak Ada Aktivitas Mengikuti')),
                    Center(child: Text('Tidak Ada Aktivitas Balasan')),
                  ],
                );
              }
              return Center(
                child: Text(
                  'Something went wrong',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: 3, // Menandakan halaman ini adalah Activity (indeks ke-3)
            onTap: (index) {
              if (index == 0) {
                Navigator.pushReplacementNamed(context, '/home');
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                ); // Navigasi ke SearchScreen
              } else if (index == 2) {
                Navigator.pushNamed(context, '/add_post');
              } else if (index == 3) {
                Navigator.pushReplacementNamed(context, '/activity'); // Tetap di halaman Activity
              } else if (index == 4) {
                Navigator.pushNamed(context, '/profile'); // Navigasi ke halaman profil
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
