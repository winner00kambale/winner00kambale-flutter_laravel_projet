import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;

  const RoundedButton(
      {Key? key, required this.btnText, required this.onBtnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.black,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: () {
          onBtnPressed();
        },
        minWidth: 320,
        height: 60,
        child: Text(
          btnText,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}






// import 'package:scan_soft/pages/pallete.dart';

// class RoundedButton extends StatelessWidget {
//   const RoundedButton({
//     Key? key,
//     required this.buttontext,
//   }) : super(key: key);

//   final String buttontext;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Colors.blue[300], borderRadius: BorderRadius.circular(16)),
//       child: FlatButton(
//         onPressed: () {},
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16.0),
//           child: Text(
//             buttontext,
//             style: kBodyText,
//           ),
//         ),
//       ),
//     );
//   }
// }
