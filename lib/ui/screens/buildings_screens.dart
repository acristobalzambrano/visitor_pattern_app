import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitor_pattern_app/ui/widgets/buildings_list_tile.dart';
import 'package:visitor_pattern_app/ui/widgets/custom_dialog.dart';

import '../../domain/providers/insurance_notifier.dart';

class BuildingsScreens extends StatelessWidget {
  const BuildingsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final insourceNotifier = context.read<InsuranceNotifier>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edificios registrados'),
        ),
        body: ListView.builder(
          itemCount: insourceNotifier.buildings.length,
          itemBuilder: (context, index) {
            return BuildingsListTile(
              building: insourceNotifier.buildings[index],
              onTap: () {
                CustomDialog.dialogBuilder(
                    context, insourceNotifier.buildings[index]);
              },
            );
          },
        ));
  }
}
