import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/ui/uni_widgets/primary_button.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';

class LanguageChange extends StatelessWidget {
  LanguageChange(
      {Key? key,
      required this.onChanged,
      required this.locales,
      required this.currLocale})
      : super(key: key);

  void Function(String?) onChanged;
  List<String> locales;
  String currLocale;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              context: context,
              isScrollControlled: false,
              constraints: BoxConstraints(
                  maxWidth: kMaxTabletWidthContent,
                  maxHeight: max(MediaQuery.of(context).size.height / 3, 300)),
              builder: (BuildContext context) {
                return LanguageBottomSheet(
                  currLocale: currLocale,
                  locales: locales,
                  onChanged: onChanged,
                );
              });
        },
        child: Row(
          children: [
            Text(currLocale,
                style: context.theme.textTheme.bodyText1!.copyWith(
                    fontSize: 13,
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w400)),
            const Gap(16),
            Icon(
              Icons.chevron_right,
              color: context.theme.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}

class LanguageBottomSheet extends StatefulWidget {
  LanguageBottomSheet(
      {Key? key,
      required this.onChanged,
      required this.locales,
      required this.currLocale})
      : super(key: key);

  void Function(String?) onChanged;
  List<String> locales;
  String currLocale;

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  String? selectedLocale;

  @override
  void initState() {
    selectedLocale = widget.currLocale;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: TabletWrapper(
          reducedWidthInLandscape: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Language',
                                style: context.theme.textTheme.bodyText1!
                                    .copyWith(
                                        fontSize: 15,
                                        color: context.theme.primaryColorDark,
                                        fontWeight: FontWeight.w500),
                              ),
                              const Icon(
                                Icons.close,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(14),
                    ...widget.locales.map((String value) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            selectedLocale = value;
                          });
                        },
                        contentPadding: const EdgeInsets.only(
                          right: 0,
                          left: 0,
                        ),
                        dense: true,
                        title: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              value,
                              style: context.theme.textTheme.bodyText1!
                                  .copyWith(
                                      fontSize: 13,
                                      color: context.theme.primaryColor,
                                      fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 25,
                          height: 25,
                          child: Radio<String>(
                            activeColor: context.theme.primaryColor,
                            value: value,
                            groupValue: selectedLocale,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedLocale = newValue;
                              });
                            },
                          ),
                        ),
                      );
                    }).toList()
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      secondary: true,
                      text: 'closeButton',
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        Navigator.of(context).pop();

                        int index = kAvailableLocalesString
                            .indexOf(selectedLocale ?? '');

                        if (index > 0) {
                          widget.onChanged(kAvailableLocales[index]);
                        } else {
                          widget.onChanged(kAvailableLocales.first);
                        }
                      },
                      text: 'continueTitle',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
