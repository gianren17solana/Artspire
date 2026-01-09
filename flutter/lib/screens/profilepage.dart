import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:artspire/models/artist.dart';
import 'package:artspire/apiService.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Artist> _artistFuture;

  @override
  void initState() {
    super.initState();
    _artistFuture = ApiService.fetchArtist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      body: FutureBuilder<Artist>(
        future: _artistFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Failed to load profile",
                style: GoogleFonts.poppins(color: Colors.white70),
              ),
            );
          }

          final artist = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeader(),
              UserProfile(artist: artist),
              UserDescription(
                name: artist.username,
                description: artist.bio,
              ),
              const ArtType(),
              const Expanded(child: ArtContainer()),
            ],
          );
        },
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 42, bottom: 40),
      child: Center(
        child: Text(
          "Profile",
          style: GoogleFonts.poppins(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key, required this.artist});

  final Artist artist;

  static final _formatter = NumberFormat.currency(
    locale: 'en_PH',
    symbol: '₱',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: artist.pfpUrl.isNotEmpty
                ? NetworkImage(artist.pfpUrl)
                : const AssetImage("assets/img/Chatpf.png") as ImageProvider,
          ),
          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _InfoBlock(value: '${artist.artsCount}', title: 'Arts'),
                    _InfoBlock(value: '${artist.soldCount}', title: 'Sold'),
                    _InfoBlock(value: _formatter.format(artist.averagePrice), title: 'Average price'),
                  ],
                ),

                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => context.push('/profile/editprofile'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7A88F2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Edit Profile",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String title;
  final String value;

  const _InfoBlock({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF7A88F2),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFFC5C2D2),
          ),
        ),
      ],
    );
  }
}

class UserDescription extends StatelessWidget {
  final String name;
  final String description;

  const UserDescription({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 14,
              height: 1.4,
              color: const Color(0xFFC5C2D2),
            ),
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }
}

class ArtType extends StatelessWidget {
  const ArtType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        children: [
          Text(
            "Commissions",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF7A88F2),
            ),
          ),

          const SizedBox(width: 37),

          Text(
            "Like",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ArtContainer extends StatelessWidget {
  const ArtContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A3B),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      },
    );
  }
}
