import 'package:flutter/material.dart';
import 'package:visitor_pattern_app/config/menu_item/menu_item.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.menuItem,
    required this.onTap,
  });

  final MenuItem menuItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(menuItem.icon),
      title: Text(menuItem.title),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => onTap(),
    );
  }
}
