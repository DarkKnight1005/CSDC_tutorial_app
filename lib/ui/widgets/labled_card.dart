import 'package:flutter/material.dart';
import 'package:myapp/ui/widgets/label_box.dart';

class LabeledCard extends StatelessWidget {

  final String labelMain;
  final String? labelSecondary;
  final String imageUrl;
  double? height;
  double? width;
  final double borderRadius;

  LabeledCard({
    Key? key,
    required this.labelMain,
    this.labelSecondary,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius = 20
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
        height: height ?? MediaQuery.of(context).size.height * .25,
        width: width ??  MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: LabelBox(
                text: labelMain
              ),
            ),
            labelSecondary != null
            ? Positioned(
              bottom: 10,
              right: 10,
              child: LabelBox(
                text: labelSecondary!,
                fontSize: 14,
              ),
            )
            : Container(),
          ],
        ),
      ),
    );
  }
}