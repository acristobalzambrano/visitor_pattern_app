import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitor_pattern_app/config/menu_item/menu_item.dart';
import 'package:visitor_pattern_app/domain/providers/insurance_notifier.dart';
import 'package:visitor_pattern_app/ui/widgets/custom_snack_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar edificios'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Consumer<InsuranceNotifier>(builder: (
          context,
          notifier,
          child,
        ) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nombre del edificio',
                  ),
                  onChanged: (value) {
                    notifier.buildingName = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Dirección del edificio',
                  ),
                  onChanged: (value) {
                    notifier.buildingAddress = value;
                  },
                ),
              ),
              const Center(
                child: Text('Selecciona el tipo de edificio'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      value: notifier.selectedDropDownItem,
                      items: buildingMenuItems.map((MenuItem menuItem) {
                        return DropdownMenuItem<String>(
                          value: menuItem.title,
                          child: Row(
                            children: [
                              Icon(menuItem.icon),
                              Text(menuItem.title),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        notifier
                            .setSelectedDropDownItem(newValue ?? 'Residencial');
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: notifier.firstLabelText,
                        ),
                        onChanged: (value) {
                          notifier.firstInput = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: notifier.secondLabelText,
                        ),
                        onChanged: (value) {
                          notifier.secondInput = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(children: [
                        Text(notifier.thirdLabelText),
                        Checkbox(
                          value: notifier.checkboxState,
                          onChanged: (value) {
                            notifier.setCheckboxState(value ?? false);
                          },
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          notifier.addBuilding();
                          CustomSnackBar.showSnackBar(
                              context, 'Edificio registrado');
                          Navigator.of(context).pop();
                        },
                        child: const Text('Registrar edificio'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
