import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/ui/uni_widgets/filter_bottom_sheet/filter_model.dart';
import 'package:space_x_app/ui/uni_widgets/primary_button.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';

class FilterBottomSheet extends StatefulWidget {
  int? selectedInt;
  FilterModel? response;

  FilterBottomSheet({
    this.response,
    Key? key,
  }) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return TabletWrapper(
      reducedWidthInLandscape: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'filtering',
                  style: context.theme.textTheme.headline5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.close,
                      )),
                )
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(child: Text(filterList[0])),
                const Gap(20),
                Expanded(
                    child: TextFormField(
                  onChanged: (value) {
                    widget.response?.fulltext = value;
                  },
                  initialValue: widget.response?.fulltext ?? '',
                ))
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(child: Text(filterList[1])),
                const Gap(20),
                Expanded(
                    child: TextFormField(
                  initialValue: widget.response?.flightNumber ?? '',
                  onChanged: (value) {
                    widget.response?.flightNumber = value;
                  },
                ))
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(child: Text(filterList[2])),
                const Gap(20),
                Expanded(
                    child: Checkbox(
                  onChanged: (bool? value) {
                    setState(() {
                      widget.response?.success = value;
                    });
                  },
                  value: widget.response?.success ??= false,
                ))
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(child: Text(filterList[3])),
                const Gap(20),
                Expanded(
                    child: Checkbox(
                  onChanged: (bool? value) {
                    setState(() {
                      widget.response?.recovered = value;
                    });
                  },
                  value: widget.response?.recovered ??= false,
                ))
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(child: Text(filterList[4])),
                const Gap(20),
                Expanded(
                  child: Checkbox(
                    onChanged: (bool? value) {
                      setState(() {
                        widget.response?.reused = value;
                      });
                    },
                    value: widget.response?.reused ??= false,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PrimaryButton(
                    minWidth: 150,
                    text: 'reset',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    secondary: true,
                    disabledMode: false,
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: PrimaryButton(
                      minWidth: 150,
                      text: 'saveAndClose',
                      onPressed: () {
                        Navigator.of(context).pop(widget.response);
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
