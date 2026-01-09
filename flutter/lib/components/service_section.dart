import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:artspire/widgets/service_card.dart';
import 'package:artspire/models/artItem.dart';
import 'package:artspire/apiService.dart';

class ServiceSection extends StatefulWidget {
  const ServiceSection({super.key});

  @override
  State<ServiceSection> createState() => _ServiceSectionState();
}

class _ServiceSectionState extends State<ServiceSection> {
  late Future<List<ArtItem>> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = ApiService.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Commisions",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
              color: Colors.white,
            ),
          ),
          FutureBuilder<List<ArtItem>>(
            future: _itemsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError) {
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      "Failed to load commissions",
                      style: GoogleFonts.poppins(color: Colors.white70),
                    ),
                  ),
                );
              }

              final items = snapshot.data!;

              return Container(
                margin: EdgeInsets.only(top: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final item = items[index];
                    return ServiceCard(item: item);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
