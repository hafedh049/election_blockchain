import 'package:election_blockchain/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ValidIP extends StatefulWidget {
  const ValidIP({super.key});

  @override
  State<ValidIP> createState() => _ValidIPState();
}

class _ValidIPState extends State<ValidIP> {
  final TextEditingController _ipController = TextEditingController();

  String _ipV4 = "";
  String _ipV6 = "";

  Future<List<String>> _validate() async {
    if
  }

  @override
  void dispose() {
    _ipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: whiteColor.withOpacity(.1)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    style: GoogleFonts.itim(fontSize: 16, fontWeight: FontWeight.w500, color: whiteColor),
                    controller: _ipController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      border: InputBorder.none,
                      hintText: "Enter IP Address",
                      hintStyle: GoogleFonts.itim(fontSize: 16, fontWeight: FontWeight.w500, color: whiteColor),
                    ),
                    onChanged: (String value) {},
                  ),
                ),
                const SizedBox(height: 20),
                FutureBuilder<List<String>>(
                  future: _validate(),
                  builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: _ipV4 == "NOT VALID" ? redColor : greenColor),
                          child: Text(_ipV4, style: GoogleFonts.itim(fontSize: 16, fontWeight: FontWeight.w500, color: whiteColor)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: _ipV6 == "NOT VALID" ? redColor : greenColor),
                          child: Text(_ipV6, style: GoogleFonts.itim(fontSize: 16, fontWeight: FontWeight.w500, color: whiteColor)),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
