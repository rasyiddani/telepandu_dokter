// Container buttonInfo(String title, String textButton, Color textColor,
//     Color colorButton, int id) {
//   return Container(
//     margin: const EdgeInsets.all(20),
//     padding: const EdgeInsets.all(20),
//     decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.grey.withOpacity(0.5),
//         ),
//         color: CustomColor.white,
//         borderRadius: BorderRadius.circular(15)),
//     width: 290,
//     child: Column(
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//               fontFamily: 'Lexend',
//               fontSize: Dimensions.leadParagraphTextSize,
//               color: CustomColor.mainColor,
//               fontWeight: FontWeight.w400),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               minimumSize: const Size(double.infinity, 46),
//               primary: colorButton,
//             ),
//             onPressed: () {
//               switch (id) {
//                 case 1:
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const ConsultRegistration()));
//                   break;
//                 case 2:
//                   if (cekStatusKonsul == "with doctor") {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const VideoCallRoomDoctor()));
//                   } else if (cekStatusKonsul == "with pharmacist") {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const VideoCallRoomApoteker()));
//                   } else if (cekStatusKonsul == "with nurse") {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const VideoCallRoomPerawat()));
//                   } else if (cekStatusKonsul ==
//                       "waiting for doctor instruction") {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const WaitingRoomInstruksi()));
//                   } else if (cekStatusKonsul == "waiting for pharmacist") {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const WaitingRoomApoteker()));
//                   } else if (cekStatusKonsul == "waiting for nurse") {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const WaitingRoomPerawat()));
//                   } else {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const ResepPaymentDetail()));
//                   }
//
//                   break;
//                 case 3:
//                   if (Provider.of<DetailKonsulProvider>(context,
//                       listen: false)
//                       .konsul!
//                       .statusKonsul ==
//                       "in queue") {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const ConsultRegistSuccess()));
//                   } else if (Provider.of<DetailKonsulProvider>(context,
//                       listen: false)
//                       .konsul!
//                       .statusKonsul ==
//                       "cancel") {
//                     setState(() {
//                       isRegisFinished = false;
//                     });
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const ConsultRegistExpired()));
//                   } else if (Provider.of<DetailKonsulProvider>(context,
//                       listen: false)
//                       .konsul!
//                       .statusKonsul ==
//                       "declined") {
//                     setState(() {
//                       isRegisFinished = false;
//                     });
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const ConsultRegistFailed()));
//                   } else if (Provider.of<DetailKonsulProvider>(context,
//                       listen: false)
//                       .konsul!
//                       .statusKonsul ==
//                       "waiting for payment") {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const ConsultRegistPending()));
//                   } else {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const ConsultRegistSuccess()));
//                   }
//
//                   break;
//               }
//             },
//             child: Text(
//               textButton,
//               style: TextStyle(color: textColor),
//             ))
//       ],
//     ),
//   );
// }