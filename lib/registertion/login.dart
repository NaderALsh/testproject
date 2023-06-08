
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/constants/style.dart';
import 'package:testproject/controller/login_control.dart';
import 'package:testproject/custom_widget/Textwidget.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  

  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? email;
  TextEditingController ?password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passwordVisibility = false;
  @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => LoginModel());

    email ??= TextEditingController();
    password ??= TextEditingController(text: '**********');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        // scrollDirection: ,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: width,
              height: height * 0.45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [bluelight, bluedark],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0.34, -1),
                  end: AlignmentDirectional(-0.34, 1),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                    ),
                    Text(
                      'Health suite',
                      style: TextStyle(color: white,
                            fontSize: 28,)
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: Text(
                            'Log In',
                            style:TextStyle(color: white,
                                      fontSize: 33,)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: height * 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: width,
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                            child: TextFormField(
                              controller: email,
                              validator: (String? value){
                                      if(value!.isEmpty){
                                        return "الرجاء أدخال الايميل بطريقة صحيحة";
                                      }
                                    },
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: black,),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: black,
                                    width: 2,
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: bluedark,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: bluedark,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              ),
                              style: TextStyle(color: black,),
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.emailAddress,
                              // validator: 
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                            child: TextFormField(
                              controller: password,
                              textCapitalization: TextCapitalization.none,
                              obscureText:passwordVisibility== false ? true :  false,
                              validator: (String?value){
                                        if(value!.isEmpty){
                                          return "الرجاء أدخال كلمة المرور";
                                        }
                                      },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: black,),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: black,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: bluedark,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: bluedark,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => passwordVisibility =!
                                        passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    passwordVisibility
                                        ? Icons.visibility_outlined : 
                                        Icons.visibility_off_outlined,
                                    color: Color(0x9C616161),
                                    size: 16,
                                  ),
                                ),
                              ),
                              style: TextStyle(color: black,),
                              textAlign: TextAlign.start,
                              // validator: _model.passwordValidator
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: GetBuilder<Login_controller>(
                      init: Login_controller(),
                      builder: (controller) {
                        return InkWell(
                          onTap: (){
                            formKey.currentState!.save();
                            if (formKey.currentState!.validate()) {
                              Map map = {
                                'username' : email!.text,
                                'password' : password!.text,
                              };
                              
                              controller.login(map);
                              email!.clear();
                              password!.clear();
                            }
                          },
                          child: Container(
                            width: width * 0.8,
                            height: 55,
                            decoration: BoxDecoration(
                              color: bluelight,
                              borderRadius: BorderRadius.circular(55),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child:
                            controller.loading ? CircularProgressIndicator(color: bluedark,) :
                            Text(
                              'continue',
                              style: TextStyle(color: white,
                                    fontSize: 18,)
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child:   TextWidget(color: Color(0xE4000000),fontSize: 16,text:'Need Help ?',fontfamily: 'light'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
