import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/config/theme/light_theme.dart';
import 'package:space_x_app/ui/uni_widgets/light_watermark.dart';
import 'package:space_x_app/ui/uni_widgets/primary_button.dart';
import 'package:space_x_app/ui/uni_widgets/set_pin_code/set_pin_code_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';
import 'package:stacked/stacked.dart';

class PinCodeView extends StatefulWidget {
  FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final bool onlyPresenting;
  final void Function(String)? onPressed;
  final String? Function(String?)? validator;
  PinCodeView(
      {super.key,
      this.onlyPresenting = false,
      this.onPressed,
      this.focusNode,
      this.validator,
      this.textEditingController});

  @override
  State<PinCodeView> createState() => _PinCodeViewState();
}

class _PinCodeViewState extends State<PinCodeView> {
  @override
  void initState() {
    widget.focusNode ??= FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetPinCodeViewModel>.reactive(
      onModelReady: (model) => model.init(context),
      builder:
          (BuildContext context, SetPinCodeViewModel viewModel, Widget? child) {
        return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: LightWatermark(
              child: TabletWrapper(
                reducedWithInLandscape: true,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (MediaQuery.of(context).size.width >= 360)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    !widget.onlyPresenting
                                        ? 'setFourDigitPIN'
                                        : 'fillPinCode',
                                    style: context.theme.textTheme.headline2!
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22)),
                              ],
                            ),
                          const Gap(20),
                        ],
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20)
                            .copyWith(bottom: 0),
                        child: Row(
                          children: [
                            Form(
                              child: SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width < 360
                                    ? 200
                                    : 220,
                                child: PinCodeTextField(
                                  onSubmitted: (_) {
                                    try {
                                      widget.focusNode?.requestFocus();
                                    } catch (e) {}
                                  },
                                  // validator: widget.validator,
                                  controller: widget.textEditingController,
                                  focusNode: widget.focusNode,
                                  onCompleted: widget.onlyPresenting
                                      ? (_) =>
                                          widget.onPressed!(viewModel.value)
                                      : (_) => viewModel.tapToContinue(),
                                  autoFocus: true,
                                  textStyle: context.theme.textTheme.bodyText2!
                                      .copyWith(color: spacePrimary),
                                  length: 4,
                                  obscureText: true,
                                  showCursor: false,
                                  blinkDuration: const Duration(seconds: 2),
                                  blinkWhenObscuring: true,
                                  keyboardType: TextInputType.number,
                                  animationType: AnimationType.fade,
                                  obscuringCharacter: "*",
                                  pinTheme: PinTheme(
                                      errorBorderColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(5),
                                      shape: PinCodeFieldShape.box,
                                      inactiveFillColor: spaceWhite,
                                      inactiveColor: spaceGreyLight,
                                      activeColor: spaceGreyLight,
                                      activeFillColor: spaceWhite,
                                      selectedColor: spacePrimary,
                                      selectedFillColor: spaceWhite,
                                      disabledColor: Colors.transparent,
                                      borderWidth: 1.5,
                                      fieldWidth: 42),
                                  enableActiveFill: true,
                                  onChanged: viewModel.setValue,
                                  appContext: context,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Text(
                                            "${viewModel.value.length}/4",
                                            style: context
                                                .theme.textTheme.headline2!
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 22)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      widget.validator != null
                          ? SizedBox(
                              height: 30,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      widget.validator!.call(viewModel.value) ??
                                          '',
                                      style: context.theme.textTheme.bodyText2!
                                          .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: spaceRed,
                                      )),
                                ],
                              ))
                          : const Gap(30),
                      Gap(MediaQuery.of(context).size.width < 360 ? 0 : 20),
                      PrimaryButton(
                        elevationCustome: 1,
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: widget.onlyPresenting
                            ? () => widget.onPressed!(viewModel.value)
                            : viewModel.tapToContinue,
                        child: Text(
                          'confirmButton',
                          style:
                              const TextStyle(color: spaceWhite, fontSize: 14),
                        ),
                      ),
                      const Gap(20),
                      if (!widget.onlyPresenting)
                        Gap(MediaQuery.of(context).size.width < 360 ? 0 : 60)
                    ],
                  ),
                ),
              ),
            ));
      },
      viewModelBuilder: () => SetPinCodeViewModel(),
    );
  }
}
