import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Alignment alignment = Alignment.topLeft;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainColor = colors.first;
    prevColor = colors.last;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  List<colorModel> colors = [
    colorModel(Colors.black, Alignment.topLeft),
    colorModel(Colors.red, Alignment.topCenter),
    colorModel(Colors.green, Alignment.topRight),
    colorModel(Colors.yellow, Alignment.centerRight),
    colorModel(Colors.purple, Alignment.bottomRight),
    colorModel(Colors.orange, Alignment.bottomCenter),
    colorModel(Colors.brown, Alignment.bottomLeft),
    colorModel(Colors.blue, Alignment.centerLeft),
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  colorModel? mainColor;
  colorModel? prevColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              color: prevColor!.color,
              height: MediaQuery.of(context).size.height * .6,
            ),
            AnimatedBuilder(
                animation: animationController,
                builder: (context, _) {
                  return ClipPath(
                    clipper: customPath(
                        value: animationController.value,
                        alignment: mainColor!.alignment),
                    child: Container(
                      color: mainColor!.color,
                      height: MediaQuery.of(context).size.height * .6,
                    ),
                  );
                }),
          ],
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      mainColor = colors[index];
                      animationController.forward(from: 0).whenComplete(() {
                        prevColor = colors[index];
                      });
                    });
                  },
                  child: GridViewItem(
                    color: colors[index].color,
                  ),
                );
              }),
        ))
      ],
    ));
  }
}

class colorModel {
  colorModel(this.color, this.alignment);
  final Color color;
  final Alignment alignment;
}

class GridViewItem extends StatelessWidget {
  final Color color;
  const GridViewItem({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
    );
  }
}

class customPath extends CustomClipper<Path> {
  final double value;
  final Alignment alignment;
  customPath({required this.value, required this.alignment});
  @override
  Path getClip(Size size) {
    Path path = Path();
    if (alignment == Alignment.topLeft) {
      buildPathClip(path, size, Offset(0, 0));
    } else if (alignment == Alignment.topCenter) {
      buildPathClip(path, size, Offset(size.width / 2, 0));
    } else if (alignment == Alignment.topRight) {
      buildPathClip(path, size, Offset(size.width, 0));
    } else if (alignment == Alignment.centerRight) {
      buildPathClip(path, size, Offset(size.width, size.height / 2));
    } else if (alignment == Alignment.bottomRight) {
      buildPathClip(path, size, Offset(size.width, size.height));
    } else if (alignment == Alignment.bottomCenter) {
      buildPathClip(path, size, Offset(size.width / 2, size.height));
    } else if (alignment == Alignment.bottomLeft) {
      buildPathClip(path, size, Offset(0, size.height));
    } else if (alignment == Alignment.centerLeft) {
      buildPathClip(path, size, Offset(0, size.height / 2));
    }

    return path;
  }

  void buildPathClip(Path path, Size size, Offset offset) {
    path.addOval(Rect.fromCenter(
      center: offset,
      width: size.width * 3 * value,
      height: size.height * 3 * value,
    ));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
