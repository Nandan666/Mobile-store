import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_store_app/pages/login.dart';
// ignore: camel_case_types
class signOut {
  Future<Login> userout()async{
  await FirebaseAuth.instance.signOut();
  return const Login();
  }
}