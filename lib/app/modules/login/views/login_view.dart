import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_cli2/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            alignment: Alignment.center,
            matchTextDirection: true,
            fit: BoxFit.cover,
            image: AssetImage("assets/property/house1.jpg"),
          ),
        ),
        child: SizedBox(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black12,
                            Colors.black87,
                          ]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Login ',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 50),
                          TextField(
                            controller: controller.emailC,
                            style: TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(color: Colors.lightGreenAccent),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreenAccent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.yellowAccent),
                              ),
                            ),
                          ),
                          // const SizedBox(height: 20),
                          TextField(
                            controller: controller.passC,
                            style: TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(color: Colors.lightGreenAccent),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreenAccent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.yellowAccent),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () => controller.login(
                                controller.emailC.text, controller.passC.text),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.greenAccent,
                                        Colors.yellowAccent
                                      ]),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                width: 200,
                                height: 60,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Have not Account?',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () => Get.toNamed(Routes.REGISTER),
                                child: const Text(
                                  'Register!',
                                  style:
                                      TextStyle(color: Colors.lightBlueAccent),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
