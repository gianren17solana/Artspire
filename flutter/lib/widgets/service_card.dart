import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:artspire/models/artItem.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.item});

  final ArtItem item;

  static final _formatter = NumberFormat.currency(
    locale: 'en_PH',
    symbol: '₱',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/search/${item.id}', extra: item);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF383843),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        item.imgUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFF383843),
                            child: Icon(Icons.image, color: Colors.white54),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: const Color(0xFF7A88F2),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              item.serviceName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
                color: Colors.white,
              ),
            ),
            Text(
              "Starting from",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
                color: const Color(0xFFC5C2D2),
              ),
            ),
            Text(
              "${_formatter.format(item.price)}+",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
