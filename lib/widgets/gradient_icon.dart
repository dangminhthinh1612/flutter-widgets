import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final int id;
  final Icon icon;

  const GradientIcon({super.key, required this.id, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) {
          return RadialGradient(
            center: Alignment.topLeft,
            radius: 3,
            colors: [
              Color.fromRGBO(
                (id * 7) % 225 <= 200 ? (id * 7) % 55 + 200 : (id * 7) % 225,
                (id * 61) % 225 <= 150
                    ? (id * 61) % 100 + 100
                    : (id * 61) % 225,
                (id * 150) % 225 >= 150
                    ? (id * 15) % 225 - 50
                    : (id * 15) % 225,
                1,
              ),
              Color.fromRGBO(
                (id * 5) % 225 >= 150 ? (id * 5) % 225 - 50 : (id * 5) % 225,
                (id * 23) % 225 <= 150 ? (id * 23) % 100 + 50 : (id * 23) % 225,
                (id * 3) % 225 <= 200 ? (id * 3) % 20 + 200 : (id * 3) % 225,
                1,
              ),
            ],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: icon,
      ),
    );
  }
}
