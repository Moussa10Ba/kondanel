
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kondanel/features/authentication/screens/login/login.dart';
import 'package:kondanel/screens/management.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser =  Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }
  
  _setInitialScreen(User? user){
    user == null ? Get.offAll(()=> LoginScreen()) : Get.offAll(()=> ManagementScreen());
  }
  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try{
      auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(()=> ManagementScreen()) : Get.offAll(()=> LoginScreen());
    }on FirebaseAuthException catch(e){}
    catch(e){
      print(e);
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {} catch (_) {}
  }
  
  Future<void> phoneAuthentication(String phoneNo) async {
  await  auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await auth.signInWithCredential(credential);
          print('Verification Completed');
        },
        codeSent: (verificationId, resendToken){
          this.verificationId.value =  verificationId;
          print('Code Send');
          print(this.verificationId.value);
        },
        codeAutoRetrievalTimeout: (verificationId){
          this.verificationId.value =  verificationId;
        },
      verificationFailed: (e){
          if(e.code == 'Invalid-phone-number'){
            Get.snackbar('Error', 'Le numero saisi est invalid');
          }else{
            Get.snackbar('Error', 'Une erreure est survenue Reessayer');
          }
      }
    );
  }
  Future<bool> verifyOTP(String opt) async {
    var credentials = await auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: opt));
    return credentials.user != null ? true : false;
  }
  Future<void> logOut() async{
    await auth.signOut();
  }
}