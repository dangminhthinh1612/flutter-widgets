import "package:flutter/material.dart";

class IconList extends StatefulWidget {
  const IconList({
    super.key,
  });

  @override
  State<IconList> createState() => _IconListState();
}

class _IconListState extends State<IconList> {
  final List<Icon> list = [
    const Icon(Icons.currency_exchange_rounded),
    const Icon(Icons.military_tech_rounded),
    const Icon(Icons.savings_rounded),
    const Icon(Icons.add_card_rounded),
    const Icon(Icons.add_business_rounded),
    const Icon(Icons.local_dining_rounded),
    const Icon(Icons.shopping_cart_rounded),
    const Icon(Icons.commute_rounded),
    const Icon(Icons.cottage_rounded),
    const Icon(Icons.sports_esports_rounded),
    const Icon(Icons.medical_information_rounded),
    const Icon(Icons.receipt_rounded),
    const Icon(Icons.post_add_rounded),
    const Icon(Icons.lunch_dining_rounded),
    const Icon(Icons.restaurant_rounded),
    const Icon(Icons.coffee_rounded),
    const Icon(Icons.local_bar_rounded),
    const Icon(Icons.assignment_ind_rounded),
    const Icon(Icons.checkroom_rounded),
    const Icon(Icons.widgets_rounded),
    const Icon(Icons.local_gas_station_rounded),
    const Icon(Icons.directions_bus_rounded),
    const Icon(Icons.local_airport_rounded),
    const Icon(Icons.local_taxi_rounded),
    const Icon(Icons.add_home_rounded),
    const Icon(Icons.electric_meter_rounded),
    const Icon(Icons.water_damage_rounded),
    const Icon(Icons.router_rounded),
    const Icon(Icons.book_online_rounded),
    const Icon(Icons.local_movies_rounded),
    const Icon(Icons.face_retouching_natural_rounded),
    const Icon(Icons.luggage_rounded),
    const Icon(Icons.health_and_safety_rounded),
    const Icon(Icons.medication_rounded),
    const Icon(Icons.person_search_rounded),
    const Icon(Icons.domain_add_rounded),
  ];
  late Icon selectedIcon;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
      ),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return IconButton(
          onPressed: () {
            setState(() {
              selectedIcon = list[index];
            });

            Navigator.pop(context, selectedIcon);
          },
          icon: list[index],
        );
      },
    );
  }
}
