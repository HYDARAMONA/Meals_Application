import 'package:flutter/material.dart';

class SwitchTileItem extends StatelessWidget {
  SwitchTileItem({
    super.key,
    required this.intialValue,
    required this.onchanged,
    required this.mainTitle,
    required this.mainSubTile,
  });

  final bool intialValue;
  final void Function(bool) onchanged;
  final String mainTitle;
  final String mainSubTile;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: intialValue,
      onChanged: onchanged,

      enableFeedback: true, //remember to test this one
      title: Text(
        mainTitle,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        mainSubTile,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
    );
  }
}
