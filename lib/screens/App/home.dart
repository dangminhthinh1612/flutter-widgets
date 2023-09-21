import "package:flutter/material.dart";
import "package:flutter_application_1/widgets/chart.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const EdgeInsetsGeometry all_08 = EdgeInsets.all(8);
    const EdgeInsetsGeometry sym_816 =
        EdgeInsets.symmetric(vertical: 8, horizontal: 16);

    return ListView(
      children: [
        Card(
          margin: sym_816,
          child: Padding(
            padding: all_08,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Total",
                      style: (Theme.of(context).textTheme.titleLarge),
                    ),
                    Text(
                      "See all",
                      style: (Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
                ),
                Text(
                  "\$10,000",
                  style: (Theme.of(context).textTheme.titleLarge),
                ),
              ],
            ),
          ),
        ),
        const Card(
          margin: sym_816,
          child: BarChartSample3(),
        ),
      ],
    );
  }
}
