import 'package:flutter/material.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';

class SectionPart extends StatefulWidget {
  const SectionPart({super.key});

  @override
  State<SectionPart> createState() => _SectionPartState();
}

class _SectionPartState extends State<SectionPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: CustomText(
                    'Sertifikasi',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      print("EDIT PROFILE");
                    },
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
