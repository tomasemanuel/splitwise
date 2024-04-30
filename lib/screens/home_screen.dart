import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitwise/helpers/form_helper.dart';
import 'package:splitwise/providers/login_form.dart';
import 'package:splitwise/widgets/widgets.dart';
import 'package:splitwise/providers/providers.dart';

import '../widgets/background/background_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FormHelper formHelper = FormHelper();
  bool aceptar = false;
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final loadingProvider = Provider.of<LoadingProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;

    return PopScope(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              BackgroundHome(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Splitwise',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Form(
                            key: loginForm.formLoginKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                LoginFormField(
                                  isPassword: false,
                                  text: 'Email',
                                  formProperty: 'email',
                                  keyboardType: TextInputType.emailAddress,
                                  formValues: loginForm.formValues,
                                  validator: formHelper.isValidEmail,
                                ),
                                SizedBox(height: size.height * 0.04),
                                LoginFormField(
                                  isPassword: true,
                                  text: 'Contraseña',
                                  formProperty: 'password',
                                  formValues: loginForm.formValues,
                                  validator: formHelper.isValidPassword,
                                ),
                                InkWell(
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                    if (!loginForm.isValidForm() ||
                                        loadingProvider.isLoading) {
                                      return;
                                    }
                                    loadingProvider.isLoading = true;
                                    await authServiceLogin(
                                      context,
                                      loginForm.formValues,
                                      loginForm.recordarme,
                                      false,
                                    );
                                    loadingProvider.isLoading =
                                        false; // Move this line inside authServiceLogin
                                  },
                                  child: Consumer<LoadingProvider>(
                                    builder: (context, loadingProvider, _) {
                                      return loadingProvider.isLoading == false
                                          ? const RoundedContainer(
                                              text: "Login", color: Colors.blue)
                                          : const RoundedContainer(
                                              circularProgressIndicator:
                                                  CircularProgressIndicator(
                                                strokeWidth: 3.0,
                                                color: Colors.white,
                                              ),
                                              color: Colors.blue);
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Future<void> authServiceLogin(
    BuildContext context, formValues, bool recordarme, bool biometric) async {
  // Simulating a delay to mimic an asynchronous operation (e.g., API call)
  Navigator.pushReplacementNamed(context, 'home_page');
}
