import 'package:flutter/material.dart';
import 'package:splitwise/themes/app_theme.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      this.height,
      this.text,
      this.circularProgressIndicator,
      this.color});
  final String? text;
  final CircularProgressIndicator? circularProgressIndicator;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.10,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: color ?? AppTheme.backgroundContainer,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.gradientContainerLeft,
                AppTheme.gradientContainerRight,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              circularProgressIndicator ??
                  Text(
                    text!,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
