// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

// class SubtaskBox extends StatefulWidget {
//   final String title;
//   final bool done;
//   final VoidCallback onpress;
//   final bool ongoing;
//   final VoidCallback addAttachment;

//   const SubtaskBox({
//     super.key,
//     required this.title,
//     required this.done,
//     required this.onpress,
//     this.ongoing = false,
//     required this.addAttachment,
//   });

//   @override
//   State<SubtaskBox> createState() => _SubtaskBoxState();
// }

// class _SubtaskBoxState extends State<SubtaskBox> {
//   late bool checked;

//   @override
//   void initState() {
//     super.initState();
//     checked = widget.done;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Vx.gray400,
//         border: Border.all(color: Vx.gray700, width: 1.5),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Checkbox(
//                 value: checked,
//                 onChanged: (!widget.ongoing)
//                     ? null
//                     : (widget.done)
//                     ? null
//                     : (value) {
//                         if (value != null && value) {
//                           widget.onpress();
//                           setState(() {
//                             checked = true;
//                           });
//                         }
//                       },
//                 activeColor: Vx.white,
//                 checkColor: Vx.gray700,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.6,
//                 child:
//                     (checked
//                             ? widget.title.text
//                                   .size(16)
//                                   .gray700
//                                   .lineThrough
//                                   .maxLines(2)
//                                   .ellipsis
//                                   .make()
//                             : widget.title.text
//                                   .size(16)
//                                   .bold
//                                   .gray800
//                                   .maxLines(2)
//                                   .ellipsis
//                                   .make())
//                         .paddingOnly(left: 2),
//               ),
//             ],
//           ),
//           IconButton(
//             icon: const Icon(Icons.attach_file, color: Vx.gray800),
//             onPressed: widget.addAttachment,
//           ),
//         ],
//       ),
//     );
//   }
// }
