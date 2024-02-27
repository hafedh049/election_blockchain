import 'dart:convert';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:election_blockchain/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => _HolderState();
}

class _HolderState extends State<Holder> {
  Future<List<Map<String, dynamic>>> _load() async {
    return (json.decode(await rootBundle.loadString("assets/jsons/services.json")) as List).cast<Map<String, dynamic>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _load(),
              builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  final List<Map<String, dynamic>> data = snapshot.data!;
                  return Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    runSpacing: 40,
                    spacing: 40,
                    children: <Widget>[
                      for (final Map<String, dynamic> item in data)
                        AvatarGlow(
                          glowColor: purpleColor,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: darkColor),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Text(item["title"], style: GoogleFonts.itim(fontSize: 22, fontWeight: FontWeight.w500, color: whiteColor)),
                          ),
                        ),
                    ],
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(color: purpleColor);
                }
                return Text(snapshot.error.toString(), style: GoogleFonts.itim(fontSize: 18, fontWeight: FontWeight.w500, color: whiteColor));
              },
            ),
          ),
        ),
      ),
    );
  }
}
