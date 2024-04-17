import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iiitrnexus1/features/auth/controllers/auth_controller.dart';
import 'package:iiitrnexus1/features/common/loader.dart';
import 'package:iiitrnexus1/features/common/textfield.dart';
// import 'package:lottie/lottie.dart';

class SignIn extends ConsumerWidget {
  SignIn({super.key});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Loader()
          : SafeArea(
              child: Stack(
                children: [
                  // SizedBox(
                  //   height: double.infinity,
                  //   width: double.infinity,
                  //   child: LottieBuilder.asset(
                  //     'assets/backf.json',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  // Positioned.fill(
                  //   child: BackdropFilter(
                  //     filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  //     child: const SizedBox(
                  //       height: double.infinity,
                  //       width: double.infinity,
                  //     ),
                  //   ),
                  // ),
                  ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Image(
                          image: AssetImage(
                            'assets/IIITRlogo.png',
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'College ID',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: CustomTextField(hintText: "Enter College ID", controller: emailController,),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: CustomTextField(hintText: "Enter your password", controller: passwordController,),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 135.0),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Container(
                              color: Colors.black,
                              width: 100,
                              height: 1,
                            ),
                          ),
                          const Text(
                            'or',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Container(
                              color: Colors.black,
                              width: 100,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 239, 239, 239),
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () => signInWithGoogle(context, ref),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: SizedBox(
                                          height: 30,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/googlelogo.png'),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Continue with Google",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.zero,
                              ),
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.transparent,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      Center(child: Text("Continue as a guest."))
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
