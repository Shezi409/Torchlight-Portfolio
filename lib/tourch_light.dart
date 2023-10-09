import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class TourchLight extends StatefulWidget {
  const TourchLight({super.key});

  @override
  State<TourchLight> createState() => _TourchLightState();
}

class _TourchLightState extends State<TourchLight> {
  final bgColor = const Color(0xff2C3333);
  final textColor = const Color(0xffE7F6F2);
  var isActive = false;
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Torch Light',
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    isActive
                        ? 'assets/touchlight.png'
                        : 'assets/touchtransparent.png',
                    width: 200,
                    height: 200,
                    color: isActive ? null : textColor.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  CircleAvatar(
                    minRadius: 30,
                    maxRadius: 45,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                          onPressed: () {
                            controller.toggle();
                            isActive = !isActive;
                            setState(() {});
                          },
                          icon: const Icon(Icons.power_settings_new_rounded)),
                    ),
                  )
                ],
              ),
            ),
          )),
          Text(
            'Developed By Jam Shahzad',
            style: TextStyle(color: textColor, fontSize: 14),
          ),
          SizedBox(
            height: size.height * 0.05,
          )
        ],
      ),
    );
  }
}
