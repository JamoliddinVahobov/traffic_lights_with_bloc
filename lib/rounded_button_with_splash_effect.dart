//  Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.green, // Text color
//                   elevation: 0, // Remove shadow
//                   shadowColor: Colors.transparent, // Remove shadow color
//                   shape: RoundedRectangleBorder(
//                     borderRadius:
//                         BorderRadius.circular(30.0), // Rounded corners
//                   ),
//                 ).copyWith(
//                   overlayColor: WidgetStateProperty.resolveWith<Color?>(
//                     (states) {
//                       if (states.contains(WidgetState.pressed)) {
//                         return Colors.blue
//                             .withOpacity(0.2); // Hover (pressed) color
//                       }
//                       return null; // No color change for other states
//                     },
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: const Center(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//                     child: Text(
//                       'Start Traffic Lights',
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ),