import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/img_path.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/moduls/hive_keys.dart';
import 'package:magic_hands/providers/provider.dart';
import 'package:magic_hands/services/hive_crud.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(
      builder: (context, provider, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsClass.bgColor,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage(ImgPath.loginGirl),
                            width: CustomMethods.mediaWidth(context, 1.3),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              left: CustomMethods.mediaWidth(context, 47)),
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  CustomMethods.mediaWidth(context, 10)),
                          height: CustomMethods.mediaWidth(context, 7),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorsClass.darkRed, width: 3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            cursorColor: ColorsClass.black,
                            controller: _controller,
                            focusNode: _focusNode,
                            style: TextStyle(
                                decorationColor: Colors.transparent,
                                decorationThickness: 0,
                                color: ColorsClass.black,
                                fontFamily: "Fredoka",
                                fontSize:
                                    CustomMethods.mediaWidth(context, 18)),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Username",
                              hintStyle: TextStyle(
                                  color: ColorsClass.black,
                                  fontFamily: "Fredoka",
                                  fontSize:
                                      CustomMethods.mediaWidth(context, 18)),
                            ),
                          ),
                        ),
                        CustomWidgets.height(context, 30),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  CustomMethods.mediaWidth(context, 10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  height: CustomMethods.mediaWidth(context, 8),
                                  width: CustomMethods.mediaWidth(context, 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorsClass.darkRed,
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (_controller.text.trim().length < 7) {
                                        provider.madeError();
                                      } else {
                                        provider.fixedError();
                                        HiveCrud.create(HiveKeys.username,
                                            _controller.text.trim());
                                        HiveCrud.create(HiveKeys.isFirst, false);
                                        context.go("/home",
                                            extra: _controller.text.trim());
                                      }
                                      _controller.clear();
                                      FocusScope.of(context).unfocus();
                                    },
                                    child: Text(
                                      "Enter",
                                      style: TextStyle(
                                          color: ColorsClass.bgColor,
                                          fontFamily: "Fredoka",
                                          fontSize: CustomMethods.mediaWidth(
                                              context, 22)),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        CustomWidgets.height(context, 30),
                        provider.hadError
                            ? Padding(
                                padding: EdgeInsets.only(
                                    right:
                                        CustomMethods.mediaWidth(context, 10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Must have at least 8 length!",
                                      style: TextStyle(
                                          color: ColorsClass.black,
                                          fontFamily: "Fredoka",
                                          fontSize: CustomMethods.mediaWidth(
                                              context, 22)),
                                    ),
                                  ],
                                ),
                              )
                            : CustomWidgets.width(context, 0)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
