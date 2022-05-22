import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController confirmPasswordController2 = TextEditingController();

  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();

  bool isVisible = false;

  void submitForm(){
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login is successful')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login is unsuccessfull')));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //username

              TextFormField(
                controller: usernameController,
                textInputAction: TextInputAction.next,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a username.';
                  }
                
                },
                onFieldSubmitted: (value) => {
                  focusNode.requestFocus()
                },
                decoration: InputDecoration(
                    hintText: 'Username',
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    prefix: Icon(Icons.ac_unit),
                    suffix: Text('Suffix icon'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green),
                    )),
              ),
               SizedBox(height: 10,),
              Text('Password'),
              TextFormField(
                // focusNode: focusNode2,
                textInputAction: TextInputAction.next,
                controller: passwordController,
                // keyboardType: TextInputType.visiblePassword,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a password.';
                  }
                  return null;
                },
                obscureText: isVisible,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(
                        isVisible
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye
                      ),
                    ),
                    )
              ),
              SizedBox(height: 10,),

               TextFormField(
                  focusNode: focusNode,
                controller: confirmPasswordController,
                textInputAction: TextInputAction.next,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a password.';
                  }
                  if(val.trim() != passwordController.value.text) {
                    return 'Passwordlar eyni deyil';
                  }
               
                },
                onFieldSubmitted: (value) => {focusNode2.requestFocus()},
              ),

              TextFormField(
                  focusNode: focusNode2,
                controller: confirmPasswordController2,
                textInputAction: TextInputAction.next,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a password.';
                  }
                  if(val.trim() != passwordController.value.text) {
                    return 'Passwordlar eyni deyil';
                  }
               
                },
                onFieldSubmitted: (value) => {focusNode2.requestFocus()},
              ),

              ElevatedButton(
                onPressed: () {
                  submitForm();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        );
  }
}
