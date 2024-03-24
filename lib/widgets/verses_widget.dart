import 'package:flutter/material.dart';
import 'package:quran_app/constants/style/colors.dart';
import 'package:quran_app/constants/style/text_styles.dart';
import 'package:quran_app/models/surah_detail_model.dart';

class VersesWidget extends StatefulWidget {
  final AyahModel ayahs;
  final String surah;

  const VersesWidget({
    super.key,
    required this.ayahs,
    required this.surah,
  });

  @override
  State<VersesWidget> createState() => _VersesWidgetState();
}

class _VersesWidgetState extends State<VersesWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 13.0),
            decoration: BoxDecoration(
              color: kPrimary.withOpacity(0.065),
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Row(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  // padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: kPrimary,
                  ),
                  child: Center(
                    child: Text(
                      widget.ayahs.numberInSurah.toString(),
                      style: kHeading6.copyWith(
                        color: Colors.white,
                        fontSize: 8.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                // const Spacer(),
                // const SizedBox(width: 12.0),
                // const SizedBox(width: 6.0),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.ayahs.text.replaceAll('\n', ''),
              textAlign: TextAlign.right,
              style: kHeading6.copyWith(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                // color: widget.prefSetProvider.isDarkTheme
                //     ? Colors.white
                //     : kDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
