import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF21212E),
        elevation: 0,
        leadingWidth: 72,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/path.svg'),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),

            child: Text(
              "System",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),

          const NotificationToggle(),

          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              "Help",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const Help(label: "Report Bug", iconPath: "assets/icons/Bug.svg"),

          SizedBox(height: 6),

          const Help(
            label: "Help Center",
            iconPath: "assets/icons/helpcen.svg",
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              "Information",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const Help(label: "FAQ", iconPath: "assets/icons/faq.svg"),

          const SizedBox(height: 6),

          const Help(label: "User Guide", iconPath: "assets/icons/guide.svg"),

          const SizedBox(height: 6),

          const Help(
            label: "Privacy Policy",
            iconPath: "assets/icons/privacy.svg",
          ),

          const SizedBox(height: 6),

          const Version(version: "1.0", iconPath: "assets/icons/version.svg"),
        ],
      ),
    );
  }
}

class NotificationToggle extends StatefulWidget {
  const NotificationToggle({super.key});

  @override
  State<NotificationToggle> createState() => _NotificationToggleState();
}

class _NotificationToggleState extends State<NotificationToggle> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),

      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/Notification.svg",
            width: 22,
            height: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Notification",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isOn = !isOn;
              });
            },
            child: SvgPicture.asset(
              isOn
                  ? "assets/icons/Switch=YES.svg"
                  : "assets/icons/Switch=NO.svg",
              width: 40,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class Help extends StatelessWidget {
  final String label;
  final String iconPath;

  const Help({super.key, required this.label, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: 22, height: 22),
          const SizedBox(width: 12),

          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),

          SvgPicture.asset(
            'assets/icons/arrowright.svg',
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}

class Version extends StatelessWidget {
  final String version;
  final String iconPath;

  const Version({super.key, required this.version, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: 22, height: 22),
          const SizedBox(width: 12),

          Expanded(
            child: Text(
              "Version",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            version,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF727272),
            ),
          ),
        ],
      ),
    );
  }
}
