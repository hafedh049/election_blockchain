import 'package:election_blockchain/cyber_services/views/holder.dart';
import 'package:election_blockchain/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadow_overlay/shadow_overlay.dart';

class MainHolder extends StatefulWidget {
  const MainHolder({super.key});

  @override
  State<MainHolder> createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  late final List<Map<String, dynamic>> _topics;

  @override
  void initState() {
    _topics = <Map<String, dynamic>>[
      <String, dynamic>{
        "title": "Online Voting using BlockChain technology",
        "description": "Try Online Voting with Blockchain Technology",
        "picture": "blockchain.png",
        "callback": () {},
        "state": false,
      },
      <String, dynamic>{
        "title": "CyberSecurity Services",
        "description": "This part will cover many CyberSecurity topics including HYDRA, NMAP, ...",
        "picture": "cybersecurity.png",
        "callback": () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Holder())),
        "state": false,
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              for (Map<String, dynamic> topic in _topics)
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return InkWell(
                      onTap: topic["callback"],
                      onHover: (bool value) => _(() => topic["state"] = value),
                      splashColor: transparentColor,
                      highlightColor: transparentColor,
                      hoverColor: transparentColor,
                      child: AnimatedScale(
                        duration: 500.ms,
                        scale: topic["state"] ? 1.1 : 1,
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: darkColor),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Center(
                                child: ShadowOverlay(
                                  shadowColor: darkColor,
                                  shadowWidth: 300,
                                  shadowHeight: 150,
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: scaffoldColor),
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset("assets/images/${topic['picture']}"),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(topic["title"], style: GoogleFonts.itim(fontSize: 22, fontWeight: FontWeight.w500, color: purpleColor)),
                              const SizedBox(height: 20),
                              Text(topic["description"], style: GoogleFonts.itim(fontSize: 16, fontWeight: FontWeight.w500, color: whiteColor)),
                            ],
                          ),
                        ).animate(key: ValueKey<bool>(topic["state"])).shimmer(duration: 2.seconds, color: topic["state"] ? whiteColor.withOpacity(.3) : transparentColor),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
