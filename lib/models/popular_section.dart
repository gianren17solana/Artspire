import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  //mock data declaration for layout testing
  static const List<String> tags = ["Illustration", "Manga", "3D Model"];
  static const List<String> price = ["₱3,000", "₱2,000", "₱5,000"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Tags",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                  height: 1.2,
                  color: Colors.white,
                ),
              ),
              Text(
                "View All",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                  height: 1.2,
                  color: const Color(0xFF7A88F2),
                ),
              ),
            ], 
          ), //Popular Heading
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length, 
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(left: 16, top: 18),
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tags[index],
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        "On everything today",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        "Starting from ${price[index]}+",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                          height: 3.3,
                        ),
                      ),
                      TextButton(
                        onPressed: (){}, 
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF7A88F2),
                          padding: EdgeInsets.symmetric(horizontal: 18)
                        ),
                        child: const Text(
                          "Explore",
                          style: TextStyle(
                            fontSize: 11,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ), //Content within the card
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 18);
              }
            ),
          ),
        ],
      ),
    );
  }
}
