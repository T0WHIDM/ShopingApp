import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_sample/bloc/authitication/auth_bloc.dart';
import 'package:flutter_shop_sample/bloc/authitication/auth_event.dart';
import 'package:flutter_shop_sample/bloc/authitication/auth_state.dart';
import 'package:flutter_shop_sample/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _passwordController = TextEditingController(text: '123456789');
  final _userNameController = TextEditingController(text: 'towhid');

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomColors.blue,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icon_application.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'اپل شاپ',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'SB',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                        labelText: 'نام کاربری',
                        labelStyle: TextStyle(
                          fontFamily: 'SM',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: CustomColors.blue,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'رمز عبور',
                        labelStyle: TextStyle(
                          fontFamily: 'SM',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: CustomColors.blue,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthInitateState) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.blue,
                              minimumSize: Size(200, 48),
                            ),
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthLoginRequest(
                                  _userNameController.text,
                                  _passwordController.text,
                                ),
                              );
                            },
                            child: Text(
                              'ورود به حساب کاربری',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SB',
                                fontSize: 18,
                              ),
                            ),
                          );
                        }

                        if (state is AuthLoadingState) {
                          return CircularProgressIndicator();
                        }

                        if (state is AuthResponseState) {
                          Text widget = Text('');
                          return state.response.fold(
                            (l) => widget = Text(l),
                            (r) => widget = Text(r),
                          );
                        }

                        return Text('خطای نامشخص');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
