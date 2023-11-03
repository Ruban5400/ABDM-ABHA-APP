import 'package:abha/export_packages.dart';
import 'package:abha/reusable_widget/toolTip/custom_tool_tip_message.dart';

class RegistrationAbhaAddressDesktopView extends StatefulWidget {
  final Map arguments;
  final Function(Map formObject) onAbhaFormSubmission;
  final Function(String abhaAddress) onIsAbhaAddressExist;

  const RegistrationAbhaAddressDesktopView({
    required this.arguments,
    required this.onAbhaFormSubmission,
    required this.onIsAbhaAddressExist,
    super.key,
  });

  @override
  RegistrationAbhaAddressDesktopViewState createState() =>
      RegistrationAbhaAddressDesktopViewState();
}

class RegistrationAbhaAddressDesktopViewState
    extends State<RegistrationAbhaAddressDesktopView> {
  late RegistrationController _registrationController;
  final _deBouncer = Debouncer(delay: const Duration(seconds: 2));
  late String _fromScreenString;

  Map configData = abhaSingleton.getAppConfig.getConfigData();
  // AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _fromScreenString = widget.arguments['fromScreen'];
    _registrationController = Get.find();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String initScreenTitleText() {
    if (_fromScreenString == 'registrationEmail') {
      return LocalizationHandler.of().registrationWithEmail.toTitleCase();
    } else if (_fromScreenString == 'registrationMobile') {
      return LocalizationHandler.of()
          .registrationWithMobileNumber
          .toTitleCase();
    } else if (_fromScreenString == 'registrationAbha') {
      return LocalizationHandler.of().registrationWithABHANUmber;
    } else {
      return '';
    }
  }

  void _checkOnAbhaClick(value) {
    setState(() {
      _registrationController.showAbhaAddressAvailability = true;
      _registrationController.abhaAddressTEC.text = value as String;
      widget.onIsAbhaAddressExist(
        '$value${configData[AppConfig.abhaAddressSuffix]}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return DesktopCommonScreenWidget(
      image: ImageLocalAssets.loginWithEmailImg,
      title: initScreenTitleText(),
      child: registrationFormWidget(),
    );
  }

  Widget registrationFormWidget() {
    return Form(
      key: _registrationController.formKey,
      // autovalidateMode: autoValidateMode,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${LocalizationHandler.of().create_new_phr} ',
                  style: CustomTextStyle.bodyLarge(context)?.apply(
                    fontSizeDelta: -2,
                    fontWeightDelta: 2,
                    color: AppColors.colorBlack6,
                  ),
                ),
                CustomToolTipMessage(
                  message: LocalizationHandler.of().errorSuggestAbhaAddress,
                  showDuration: 5,
                ).marginOnly(left: Dimen.d_5),
              ],
            ),
            AppTextFormField.desktop(
              context: context,
              key: const Key(KeyConstant.abhaAddressTextField),
              title: LocalizationHandler.of().abhaAddress,
              textEditingController: _registrationController.abhaAddressTEC,
              hintText: LocalizationHandler.of().hintEnterAbhaAddress,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              suffix: Text(
                configData[AppConfig.abhaAddressSuffix],
                style: CustomTextStyle.bodyMedium(context)?.apply(
                  color: AppColors.colorAppBlue,
                ),
              ),
              validator: (value) {
                if (Validator.isNullOrEmpty(value?.trim())) {
                  return LocalizationHandler.of().errorEnterAbhaAddress;
                }
                if (value!.trim().length < 8) {
                  return LocalizationHandler.of().invalidAbhaAddress;
                }
                if (Validator.isDotCriteriaMatches(value)) {
                  return LocalizationHandler.of().invalidAbhaAddress;
                }
                if (!Validator.isValidAbhaAddressPattern(value)) {
                  return LocalizationHandler.of().invalidAbhaAddress;
                }
                return null;
              },
              onChanged: (string) {
                if (!Validator.isNullOrEmpty(string.trim()) &&
                    string.trim().length > 8 &&
                    !Validator.isDotCriteriaMatches(string) &&
                    Validator.isValidAbhaAddressPattern(string)) {
                  _registrationController.showAbhaAddressAvailability = true;
                  _deBouncer.call(() {
                    widget.onIsAbhaAddressExist(
                      '${string.toString().trim()}${configData[AppConfig.abhaAddressSuffix]}',
                    );
                  });
                } else {
                  _deBouncer.cancel();
                  setState(() {
                    _registrationController.showAbhaAddressAvailability = false;
                  });
                }
              },
            ).marginOnly(top: Dimen.d_20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_registrationController.showAbhaAddressAvailability)
                  if (_registrationController.isAbhaAddressExist == false)
                    Text(
                      LocalizationHandler.of().addressAvailable,
                      style: CustomTextStyle.titleMedium(context)?.apply(
                        color: AppColors.colorGreen,
                        fontWeightDelta: 1,
                        fontSizeDelta: 0.5,
                      ),
                    ).paddingOnly(top: Dimen.d_10)
                  else
                    Text(
                      LocalizationHandler.of().addressNotAvailable,
                      style: CustomTextStyle.titleMedium(context)?.apply(
                        color: AppColors.colorDarkRed1,
                        fontWeightDelta: 1,
                        fontSizeDelta: 0.5,
                      ),
                    ).paddingOnly(top: Dimen.d_10),
                if (_registrationController.showAbhaAddressAvailability)
                  ValueListenableBuilder<bool>(
                    valueListenable: _registrationController.showLoader,
                    builder: (context, showLoader, _) {
                      if (showLoader) {
                        return const CircularProgressIndicator(
                          backgroundColor: AppColors.colorAppOrange,
                          color: AppColors.colorAppBlue,
                          strokeWidth: 2,
                        ).sizedBox(
                          width: Dimen.d_10,
                          height: Dimen.d_10,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ).paddingOnly(top: Dimen.d_10, left: Dimen.d_5)
              ],
            ),
            if (!Validator.isNullOrEmpty(
              _registrationController.suggestedAbhaAddress,
            ))
              Text(
                '${LocalizationHandler.of().suggestion} ',
                style: CustomTextStyle.bodySmall(context)?.apply(
                  fontSizeDelta: -2,
                  fontWeightDelta: -1,
                  color: AppColors.colorBlack6,
                ),
              ).marginOnly(
                top: Dimen.d_20,
              ),
            if (!Validator.isNullOrEmpty(
              _registrationController.suggestedAbhaAddress,
            ))
              Wrap(
                children: List.generate(
                    _registrationController.suggestedAbhaAddress!.length,
                    (index) {
                  var item =
                      _registrationController.suggestedAbhaAddress![index];
                  return InkWell(
                    onTap: () {
                      _checkOnAbhaClick(item);
                    },
                    child: Text(
                      '$item',
                      style: CustomTextStyle.bodySmall(context)?.apply(
                        color: AppColors.colorAppOrange,
                      ),
                    ).paddingAll(Dimen.d_5),
                  ).paddingOnly(right: Dimen.d_5);
                }).toList(),
              ).marginOnly(top: Dimen.d_10),
            Row(
              children: [
                Text(
                  '${LocalizationHandler.of().create_password_text} (${LocalizationHandler.of().labelOptional})',
                  style: CustomTextStyle.bodyLarge(context)?.apply(
                    fontSizeDelta: -2,
                    fontWeightDelta: 2,
                    color: AppColors.colorBlack6,
                  ),
                ),
                CustomToolTipMessage(
                  message: LocalizationHandler.of().password_validation_hint,
                  showDuration: 5,
                ).marginOnly(left: Dimen.d_5),
              ],
            ).marginOnly(
              top: Dimen.d_20,
            ),
            getPasswordWidgets(),
            Row(
              children: [
                TextButtonOrange.desktop(
                  text: LocalizationHandler.of().submit,
                  onPressed: () {
                    final isValid = _registrationController.formKey.currentState
                        ?.validate();
                    if (!isValid!) {
                    } else if (_registrationController.isAbhaAddressExist ==
                        true) {
                      MessageBar.showToastError(
                        LocalizationHandler.of().pleaseUseAnotherAbhaAddress,
                      );
                    } else {
                      var formObject = {};
                      formObject = {
                        ApiKeys.requestKeys.alreadyExistedPHR: false,
                        ApiKeys.requestKeys.password:
                            _registrationController.passwordTEC.text,
                        ApiKeys.responseKeys.phrAddress:
                            '${_registrationController.abhaAddressTEC.text.toLowerCase()}${configData[AppConfig.abhaAddressSuffix]}',
                        ApiKeys.requestKeys.sessionId: '_sessionId'
                      };
                      widget.onAbhaFormSubmission(formObject);
                    }
                  },
                ).marginOnly(right: Dimen.d_16),
                TextButtonPurple.desktop(
                  text: LocalizationHandler.of().cancel,
                  onPressed: () {
                    setState(() {
                      _registrationController.mobileTexController.text = '';
                      _registrationController.abhaNumberTextController.text =
                          '';
                      _registrationController.emailTextController.text = '';
                      _registrationController.autoValidateModeWeb =
                          AutovalidateMode.disabled;
                    });
                    context.navigateBack();
                  },
                ).marginOnly(right: Dimen.d_16),
              ],
            ).marginOnly(top: Dimen.d_40),
          ],
        ),
      ),
    );
  }

  Widget getPasswordWidgets() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField.desktop(
          context: context,
          key: const Key(KeyConstant.enterPasswordField),
          title: LocalizationHandler.of().create_password,
          hintText: LocalizationHandler.of().hintEnterPassword,
          textEditingController: _registrationController.passwordTEC,
          suffix: GestureDetector(
            key: const Key(KeyConstant.toggleIconBtn),
            onTap: () {
              setState(() {
                _registrationController.passwordVisible =
                    !_registrationController.passwordVisible;
              });
            },
            child: Icon(
              _registrationController.passwordVisible
                  ? IconAssets.closeEye
                  : IconAssets.openEye,
            ),
          ),
          isPassword: !_registrationController.passwordVisible ? true : false,
          validator: (value) {
            if (_registrationController.skipPassword) {
              return null;
            }
            if (Validator.isNullOrEmpty(value?.trim())) {
              if (Validator.isNullOrEmpty(
                _registrationController.confirmPasswordTEC.text.trim(),
              )) {
                return null;
              } else {
                return LocalizationHandler.of().enterPassword;
              }
            }
            if (!Validator.isPassValid(value!)) {
              return LocalizationHandler.of().invalidPass;
            }
            return null;
          },
        ).marginOnly(top: Dimen.d_26),
        AppTextFormField.desktop(
          context: context,
          key: const Key(KeyConstant.enterConfirmPasswordField),
          title: LocalizationHandler.of().confirm_password,
          hintText: LocalizationHandler.of().hintEnterConfirmPassword,
          textEditingController: _registrationController.confirmPasswordTEC,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          isPassword:
              !_registrationController.confirmPasswordVisible ? true : false,
          suffix: GestureDetector(
            key: const Key(KeyConstant.toggleIconBtn),
            onTap: () {
              setState(() {
                _registrationController.confirmPasswordVisible =
                    !_registrationController.confirmPasswordVisible;
              });
            },
            child: Icon(
              _registrationController.confirmPasswordVisible
                  ? IconAssets.closeEye
                  : IconAssets.openEye,
            ),
          ),
          validator: (value) {
            if (_registrationController.skipPassword) {
              return null;
            }
            if (Validator.isNullOrEmpty(value)) {
              if (Validator.isNullOrEmpty(
                _registrationController.passwordTEC.text.trim(),
              )) {
                return null;
              } else {
                return LocalizationHandler.of().enterConfirmPass;
              }
            }
            if (!Validator.isPassValid(value!)) {
              return LocalizationHandler.of().invalidConfirmPassword;
            }
            if (value != _registrationController.passwordTEC.text) {
              return LocalizationHandler.of().confirmPasswordNotMatches;
            }
            return null;
          },
        ).marginOnly(top: Dimen.d_20),
      ],
    );
  }
}
