import 'package:flutter/material.dart';

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
    const Icon(Icons.ac_unit_rounded),
    const Icon(Icons.airport_shuttle_rounded),
    const Icon(Icons.all_inclusive_rounded),
    const Icon(Icons.apartment_rounded),
    const Icon(Icons.baby_changing_station_rounded),
    const Icon(Icons.backpack_rounded),
    const Icon(Icons.balcony_rounded),
    const Icon(Icons.bathtub_rounded),
    const Icon(Icons.beach_access_rounded),
    const Icon(Icons.bento_rounded),
    const Icon(Icons.bungalow_rounded),
    const Icon(Icons.business_center_rounded),
    const Icon(Icons.cabin_rounded),
    const Icon(Icons.carpenter_rounded),
    const Icon(Icons.casino_rounded),
    const Icon(Icons.chalet_rounded),
    const Icon(Icons.charging_station_rounded),
    const Icon(Icons.child_care_rounded),
    const Icon(Icons.child_friendly_rounded),
    const Icon(Icons.corporate_fare_rounded),
    const Icon(Icons.countertops_rounded),
    const Icon(Icons.crib_rounded),
    const Icon(Icons.desk_rounded),
    const Icon(Icons.dry_rounded),
    const Icon(Icons.elevator_rounded),
    const Icon(Icons.escalator_rounded),
    const Icon(Icons.escalator_warning_rounded),
    const Icon(Icons.family_restroom_rounded),
    const Icon(Icons.fence_rounded),
    const Icon(Icons.fire_extinguisher_rounded),
    const Icon(Icons.fitness_center_rounded),
    const Icon(Icons.food_bank_rounded),
    const Icon(Icons.foundation_rounded),
    const Icon(Icons.free_breakfast_rounded),
    const Icon(Icons.gite_rounded),
    const Icon(Icons.golf_course_rounded),
    const Icon(Icons.grass_rounded),
    const Icon(Icons.holiday_village_rounded),
    const Icon(Icons.hot_tub_rounded),
    const Icon(Icons.house_rounded),
    const Icon(Icons.house_siding_rounded),
    const Icon(Icons.houseboat_rounded),
    const Icon(Icons.iron_rounded),
    const Icon(Icons.kitchen_rounded),
    const Icon(Icons.meeting_room_rounded),
    const Icon(Icons.microwave_rounded),
    const Icon(Icons.night_shelter_rounded),
    const Icon(Icons.other_houses_rounded),
    const Icon(Icons.pool_rounded),
    const Icon(Icons.rice_bowl_rounded),
    const Icon(Icons.roofing_rounded),
    const Icon(Icons.room_preferences_rounded),
    const Icon(Icons.room_service_rounded),
    const Icon(Icons.rv_hookup_rounded),
    const Icon(Icons.smoking_rooms_rounded),
    const Icon(Icons.soap_rounded),
    const Icon(Icons.spa_rounded),
    const Icon(Icons.sports_bar_rounded),
    const Icon(Icons.stairs_rounded),
    const Icon(Icons.storefront_rounded),
    const Icon(Icons.stroller_rounded),
    const Icon(Icons.tapas_rounded),
    const Icon(Icons.tty_rounded),
    const Icon(Icons.umbrella_rounded),
    const Icon(Icons.vaping_rooms_rounded),
    const Icon(Icons.villa_rounded),
    const Icon(Icons.wash_rounded),
    const Icon(Icons.wheelchair_pickup_rounded),
    const Icon(Icons.auto_mode_rounded),
    const Icon(Icons.blinds_rounded),
    const Icon(Icons.blinds_closed_rounded),
    const Icon(Icons.broadcast_on_home_rounded),
    const Icon(Icons.broadcast_on_personal_rounded),
    const Icon(Icons.curtains_rounded),
    const Icon(Icons.curtains_closed_rounded),
    const Icon(Icons.electric_bolt_rounded),
    const Icon(Icons.energy_savings_leaf_rounded),
    const Icon(Icons.gas_meter_rounded),
    const Icon(Icons.heat_pump_rounded),
    const Icon(Icons.nest_cam_wired_stand_rounded),
    const Icon(Icons.oil_barrel_rounded),
    const Icon(Icons.propane_rounded),
    const Icon(Icons.propane_tank_rounded),
    const Icon(Icons.roller_shades_rounded),
    const Icon(Icons.roller_shades_closed_rounded),
    const Icon(Icons.sensor_door_rounded),
    const Icon(Icons.sensor_occupied_rounded),
    const Icon(Icons.sensor_window_rounded),
    const Icon(Icons.shield_moon_rounded),
    const Icon(Icons.solar_power_rounded),
    const Icon(Icons.vertical_shades_rounded),
    const Icon(Icons.vertical_shades_closed_rounded),
    const Icon(Icons.wind_power_rounded),
    const Icon(Icons.auto_stories_rounded),
    const Icon(Icons.star_rounded),
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
          iconSize: 40,
        );
      },
    );
  }
}
