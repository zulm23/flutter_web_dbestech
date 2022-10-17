import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  const TopBarContents(this.opacity, {super.key});

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.white.withOpacity(widget.opacity),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width / 4,
                ),
                const Text(
                  'Author',
                  style: TextStyle(
                    color: Color(0xFF077bd7),
                    fontSize: 26,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(width: screenSize.width / 15),
                menuButton('Home', 0, () {
                  debugPrint(widget.opacity.toString());
                }),
                SizedBox(width: screenSize.width / 15),
                menuButton('About', 1, () {
                  debugPrint('Button About Click');
                }),
                SizedBox(width: screenSize.width / 15),
                menuButton('History', 2, () {
                  debugPrint('Button History Click');
                }),
                SizedBox(width: screenSize.width / 15),
                menuButton('Contact Us', 3, () {
                  debugPrint('Button Contact Click');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  InkWell menuButton(String text, int isHovering, VoidCallback ontap) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onHover: (value) {
        setState(() {
          value
              ? _isHovering[isHovering] = true
              : _isHovering[isHovering] = false;
        });
      },
      onTap: ontap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
                color: _isHovering[isHovering]
                    ? const Color(0xFF077bd7)
                    : const Color(0xFF077bd7),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          const SizedBox(height: 5),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: _isHovering[isHovering],
            child: Container(
              height: 2,
              width: 30,
              color: Colors.greenAccent,
            ),
          )
        ],
      ),
    );
  }
}
