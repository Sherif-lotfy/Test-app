import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MainApp(),
    ),
  );
}

class Qs {
  String photoUrl, theQ;
  bool qans;
  Qs(this.photoUrl, this.theQ, this.qans);
}

List<Qs> qs = [
  Qs('image-1.jpg', 'say yes', true),
  Qs('image-2.jpg', 'say yes', true),
  Qs('image-3.jpg', 'say no', false),
  Qs('image-4.jpg', 'say yes', true),
];

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test.',
          style: TextStyle(
            fontFamily: 'Edu',
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.cyan[400],
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Thecontent(),
      ),
    );
  }
}

class Thecontent extends StatefulWidget {
  const Thecontent({super.key});

  @override
  State<Thecontent> createState() => _ThecontentState();
}

class _ThecontentState extends State<Thecontent> {
  Row like() {
    return const Row(
      children: [
        Icon(
          Icons.thumb_up,
          size: 30,
          color: Color(0xff00ff00),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }

  Row dislike() {
    return const Row(
      children: [
        Icon(
          Icons.thumb_down,
          size: 30,
          color: Color(0xffff0000),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }

  List<Row> answers = [];

  void check(bool ans) {
    if (currentQ.qans == ans) {
      answers.add(like());
    } else {
      answers.add(dislike());
    }
    //issues fixed by this ...
    setState(() {
      if (qs.isNotEmpty) {
        currentQ = qs.last;
        qs.removeLast();
      }
    });
  }

  Qs currentQ = qs.isNotEmpty ? qs.last : Qs("", "", false);

  Widget printQ() {
    return Column(
      children: [
        Image.asset('imgs/${currentQ.photoUrl}'),
        const SizedBox(height: 10),
        Text(
          currentQ.theQ,
          style: const TextStyle(
            fontFamily: 'PoetsenOne',
            fontSize: 30,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: answers),
        const SizedBox(height: 20),
        if (qs.isNotEmpty)
          printQ()
        else
          const Center(
            child: Text(
              "We are done here ...",
              style: TextStyle(
                fontFamily: 'Mono',
                fontSize: 30,
              ),
            ),
          ),
        const SizedBox(height: 20),
        if (qs.isNotEmpty)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MaterialButton(
                  onPressed: () {
                    check(true);
                  },
                  color: Colors.cyan,
                  child: const Text(
                    "True",
                    style: TextStyle(
                      fontFamily: 'Mono',
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () {
                    check(false);
                  },
                  color: Colors.red,
                  child: const Text(
                    "False",
                    style: TextStyle(
                      fontFamily: 'Mono',
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
