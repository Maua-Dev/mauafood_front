import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauafood_front/app/modules/user/presenter/states/contact/contact_state.dart';
import 'package:mauafood_front/app/shared/helpers/services/snackbar/global_snackbar.dart';
import 'package:mauafood_front/app/shared/widgets/contact/text_field_contact_widget.dart';
import 'package:mauafood_front/app/shared/widgets/confirm_dialog_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';
import 'contact_controller.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var contactController = Modular.get<ContactController>();
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor2,
      actionsPadding: const EdgeInsets.only(bottom: 16),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(S.of(context).typeContact,
              style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold)),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.circleExclamation,
                color: AppColors.mainBlueColor),
            onPressed: () => showDialog(
                context: context,
                builder: (context) => ConfirmationDialogWidget(
                      dialogTitle: S.of(context).dataStorageTitle,
                      confirmationText: S.of(context).closeTitle,
                      dialogContent: S.of(context).dataStorageAlertTitle,
                    )),
          ),
        ],
      ),
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Scrollable(
          viewportBuilder: (BuildContext context, ViewportOffset position) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: 600,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!contactController.isLogged)
                      TextFieldContactWidget(
                        suffixIcon: const Icon(Icons.person),
                        onChanged: contactController.setName,
                        validator: contactController.validateName,
                        title: '${S.of(context).labelName} *',
                        hintText: S.of(context).labelName,
                        keyboardType: TextInputType.multiline,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                      ),
                    if (!contactController.isLogged)
                      TextFieldContactWidget(
                        suffixIcon: const Icon(Icons.email),
                        onChanged: contactController.setEmail,
                        validator: contactController.validateEmail,
                        title: '${S.of(context).emailTitle} *',
                        hintText: S.of(context).emailTitle,
                        keyboardType: TextInputType.multiline,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(100),
                        ],
                      ),
                    TextFieldContactWidget(
                      onChanged: contactController.setMessage,
                      validator: contactController.validateMessage,
                      title: '${S.of(context).labelMessage} *',
                      hintText: S.of(context).labelMessage,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(500),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      scrollable: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: <Widget>[
        Center(
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all<Size>(const Size(200, 60)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.mainBlueColor),
            ),
            child: Text(
              S.of(context).labelSend.toUpperCase(),
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () async {
              await contactController.sendEmail();
              if (contactController.state is ContactSuccessState) {
                GlobalSnackBar.success(S.current.messageSentSuccessfully);
              } else if (contactController.state is ContactErrorState) {
                GlobalSnackBar.error(S.current.messageSentError);
              }
              Modular.to.pop();
            },
          ),
        ),
      ],
    );
  }
}
