import 'package:abha/app/health_locker/model/health_locker_info_model.dart';
import 'package:abha/app/health_locker/view/desktop/health_locker_authorization_request_desktop_view.dart';
import 'package:abha/app/health_locker/view/mobile/health_locker_authorization_request_mobile_view.dart';
import 'package:abha/export_packages.dart';

class HealthLockerAuthorizationRequestView extends StatefulWidget {
  final Map arguments;

  const HealthLockerAuthorizationRequestView({
    required this.arguments,
    super.key,
  });

  @override
  HealthLockerAuthorizationRequestViewState createState() =>
      HealthLockerAuthorizationRequestViewState();
}

class HealthLockerAuthorizationRequestViewState
    extends State<HealthLockerAuthorizationRequestView> {
  late HealthLockerController healthLockerController;
  late String authorizationRequestId;
  bool checkbox1 = false;
  late Authorization authorization;
  late bool isAuthRevoked;

  @override
  void initState() {
    healthLockerController = Get.find<HealthLockerController>();
    authorizationRequestId =
        widget.arguments[IntentConstant.authorizationRequestId];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!Validator.isNullOrEmpty(authorizationRequestId)) {
        _onFetchAuthorizationRequest();
      }
    });
    super.initState();
  }

  Future<void> _onFetchAuthorizationRequest() async {
    await healthLockerController.functionHandler(
      function: () => healthLockerController
          .getAuthorizationRequestDetail(authorizationRequestId),
      isUpdateUi: true,
      isLoaderReq: true,
      isUpdateUiOnError: true,
      updateUiBuilderIds: [UpdateLockerBuilderIds.authorizationRequest],
    );
  }

  /// @Here function calls api to revoked the authorization.
  Future<void> submitRevokedRequestOnClick() async {
    if (!Validator.isNullOrEmpty(authorization.requestId)) {
      await healthLockerController
          .functionHandler(
        function: () => healthLockerController
            .getRevokedAuthRequest(authorization.requestId!),
        isLoaderReq: true,
      )
          .then(
        (_) {
          if (healthLockerController.responseHandler.status == Status.success) {
            context.navigateBack();
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      type: HealthLockerAuthorizationRequestView,
      isTopSafeArea: true,
      title: LocalizationHandler.of().authorization_requests,
      bodyMobile: HealthLockerAuthorizationRequestMobileView(
        arguments: widget.arguments,
        submitRevokedRequestOnClick: submitRevokedRequestOnClick,
      ),
      bodyDesktop: HealthLockerAuthorizationRequestDesktopView(
        arguments: widget.arguments,
        submitRevokedRequestOnClick: submitRevokedRequestOnClick,
      ),
    );
  }

  Widget getAuthorizationRequest() {
    return GetBuilder<HealthLockerController>(
      id: UpdateLockerBuilderIds.authorizationRequest,
      builder: (_) {
        authorization = healthLockerController.authorization ?? Authorization();
        isAuthRevoked = healthLockerController.isAuthRevoked();
        return _authorizationRequestWidget();
      },
    );
  }

  Widget _authorizationRequestWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _authorizationDetailsWidget(),
          if (!isAuthRevoked) buttonRevoked() else Container()
        ],
      ).paddingAll(Dimen.d_15),
    );
  }

  Widget _authorizationDetailsWidget() {
    return Column(
      children: [
        Text(
          authorization.requester?.name ?? '',
          style: CustomTextStyle.bodySmall(context)?.apply(
            fontWeightDelta: 2,
            color: AppColors.colorGreyDark2,
          ),
        ).alignAtTopLeft(),
        Text(
          LocalizationHandler.of().authorization_requests,
          style: CustomTextStyle.labelMedium(context)
              ?.apply(color: AppColors.colorGreyLight6),
        ).marginOnly(top: Dimen.d_5).alignAtTopLeft(),
        Text(
          LocalizationHandler.of().purposeOfRequest,
          style: CustomTextStyle.bodySmall(context)?.apply(
            fontWeightDelta: 2,
            color: AppColors.colorGreyDark2,
          ),
        ).marginOnly(top: Dimen.d_20).alignAtTopLeft(),
        Text(
          authorization.purpose?.text ?? '',
          style: CustomTextStyle.labelMedium(context)
              ?.apply(color: AppColors.colorGreyLight6),
        ).marginOnly(top: Dimen.d_5).alignAtTopLeft(),
        if (isAuthRevoked)
          showTextWithBackground(
            title: LocalizationHandler.of().authorization_revoked,
          ).marginOnly(top: Dimen.d_30).alignAtTopLeft()
        else
          Container(),
        showTextWithBackground(
          title: LocalizationHandler.of().authorizeLockerProfileDetail(
            authorization.requester?.name ?? '',
          ),
          value: LocalizationHandler.of().approve_to_access_profile_details,
        ).marginOnly(top: Dimen.d_30),
        showTextWithBackground(
          title: LocalizationHandler.of().authorizeLockerWithYourHealthAcc(
            authorization.requester?.name ?? '',
          ),
          value: LocalizationHandler.of().enable_to_upload_own_records,
        ).marginOnly(top: Dimen.d_20),
        if (isAuthRevoked) checkToLinkRecords() else Container()
      ],
    );
  }

  Widget buttonRevoked() {
    return TextButtonOrange.mobile(
      text: LocalizationHandler.of().revoked,
      onPressed: () {
        CustomDialog.showPopupDialog(
          LocalizationHandler.of().doYouWantToRevokeAuthorization,
          positiveButtonTitle: LocalizationHandler.of().yes,
          negativeButtonTitle: LocalizationHandler.of().cancel,
          onPositiveButtonPressed: () {
            CustomDialog.dismissDialog(mContext: context);
            submitRevokedRequestOnClick();
          },
          onNegativeButtonPressed: CustomDialog.dismissDialog,
        );
      },
    ).marginOnly(top: Dimen.d_35);
  }

  /// Here is the decorated common widget for text messages. Params used:-
  ///    [title] of type String,
  ///    [value] of type String,
  ///    [authorization] of type Authorization.
  Widget showTextWithBackground({
    required String title,
    String? value,
  }) {
    return DecoratedBox(
      decoration: abhaSingleton.getBorderDecoration.getRectangularBorder(
        color: Validator.isNullOrEmpty(value)
            ? AppColors.colorPink1
            : AppColors.colorWhite,
        borderColor:
            isAuthRevoked ? AppColors.colorDarkRed1 : AppColors.colorGreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTextStyle.bodySmall(context)?.apply(
              color: AppColors.colorGreyDark2,
              fontWeightDelta: 2,
            ),
          ),
          if (!Validator.isNullOrEmpty(value))
            Text(
              value ?? '',
              style: CustomTextStyle.bodySmall(context)?.apply(
                fontSizeDelta: -2,
                color: AppColors.colorGreyDark1,
              ),
            ).marginOnly(top: Dimen.d_10)
          else
            Container()
        ],
      ).paddingSymmetric(vertical: Dimen.d_20, horizontal: Dimen.d_20),
    );
  }

  Widget checkToLinkRecords() {
    checkbox1 = true;
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.all(Dimen.d_0),
          onPressed: () {
            setState(() {
              checkbox1 = !checkbox1;
            });
          },
          icon: Icon(
            checkbox1 ? IconAssets.checkboxSelect : IconAssets.checkboxUnselect,
            size: Dimen.d_32,
            color: AppColors.colorAppBlue,
          ),
        ),
        Flexible(
          child: Text(
            LocalizationHandler.of().allow_locker_to_link_record,
            style: CustomTextStyle.labelMedium(context)
                ?.apply(fontSizeDelta: 1, color: AppColors.colorGreyDark),
          ),
        )
      ],
    ).marginOnly(top: Dimen.d_40);
  }
}
