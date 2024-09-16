import 'package:flutter/material.dart';
import 'package:visitor_pattern_app/config/menu_item/menu_item.dart';
import 'package:visitor_pattern_app/ui/screens/register_screen.dart';
import 'package:visitor_pattern_app/ui/screens/buildings_screens.dart';
import 'package:visitor_pattern_app/ui/widgets/custom_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguros App'),
      ),
      body: ListView.builder(
          itemCount: homeMenuItems.length,
          itemBuilder: (context, index) {
            return CustomListTile(
                menuItem: homeMenuItems[index],
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ));
                      break;
                    case 1:
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const BuildingsScreens(),
                      ));
                      break;
                    default:
                      break;
                  }
                });
          }),
    );
  }
}
