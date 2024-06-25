import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Хувийн мэдээлэл"),
        toolbarHeight: 30,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 218, 214, 214)
                                .withOpacity(0.5),
                            offset: const Offset(-2, -2),
                            blurRadius: 1,
                            spreadRadius: 2,
                          ),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text('94911068'),
                  ],
                ),
                const SizedBox(height: 10),
                Text('Овог: '),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter your surname',
                  ),
                ),
                const SizedBox(height: 10),
                Text('Нэр: '),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter your name',
                  ),
                ),
                const SizedBox(height: 10),
                Text('Утасны дугаар: '),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter your phone number',
                  ),
                ),
                const SizedBox(height: 10),
                Text('Цахим шуудан: '),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter your email',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CameraButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CameraButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.camera,
              size: 10,
            ),
          ],
        ));
  }
}
