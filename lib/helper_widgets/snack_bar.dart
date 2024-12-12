import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, {required String text, bool isSuccess = true} ) async {
    final snackbar = SnackBar(
      content: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(isSuccess ? Icons.check : Icons.error, color: isSuccess ? Colors.green[300] : Colors.red[300],),
              ),
              Text( text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: isSuccess ? const Color.fromARGB(255, 22, 114, 25) : Colors.red,), ),
            ],
          ),
        ),
      ),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent, 
      duration: const Duration(milliseconds: 1200),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    if(isSuccess){
      Future.delayed(snackbar.duration, () {
        Navigator.pop(context, true);
      });
    }

  }     