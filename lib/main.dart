import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WomensDayApp(),
  ));
}

class WomensDayApp extends StatefulWidget {
  @override
  State<WomensDayApp> createState() => _WomensDayAppState();
}

class _WomensDayAppState extends State<WomensDayApp> {

  final GlobalKey cardKey = GlobalKey();

  int selectedCard = 0;
  String recipientName = "";
  String senderName = "";
  String message = "Happy Women's Day!";

  final List<Map<String, dynamic>> cards = [
    {
      'bg': Colors.pink.shade100,
      'icon': '🌸',
      'quote': "Here's to strong women everywhere!"
    },
    {
      'bg': Colors.purple.shade100,
      'icon': '👑',
      'quote': "You are powerful beyond measure!"
    },
    {
      'bg': Colors.amber.shade100,
      'icon': '🌻',
      'quote': "Celebrating your strength & grace!"
    },
    {
      'bg': Colors.teal.shade100,
      'icon': '💐',
      'quote': "Empowered women empower women!"
    },
    {
      'bg': Colors.red.shade100,
      'icon': '🌹',
      'quote': "You make the world beautiful!"
    },
    {
    'bg': Colors.blue.shade100,
    'icon': '✨',
    'quote': "Shine bright like the amazing woman you are!"
  },
  {
    'bg': Colors.orange.shade100,
    'icon': '🔥',
    'quote': "Your courage inspires the world!"
  },
  {
    'bg': Colors.green.shade100,
    'icon': '🌿',
    'quote': "Strong roots grow powerful women."
  },
  {
    'bg': Colors.indigo.shade100,
    'icon': '💫',
    'quote': "Believe in yourself and magic will happen!"
  },
  {
    'bg': Colors.deepPurple.shade100,
    'icon': '💜',
    'quote': "A woman's strength is limitless."
  },
  {
    'bg': Colors.cyan.shade100,
    'icon': '🌊',
    'quote': "Graceful like water, strong like the ocean."
  },
  {
    'bg': Colors.lime.shade100,
    'icon': '🌼',
    'quote': "Bloom with confidence and beauty!"
  },
  {
    'bg': Colors.brown.shade100,
    'icon': '🌺',
    'quote': "Your kindness makes the world better."
  },
  {
    'bg': Colors.deepOrange.shade100,
    'icon': '🔥',
    'quote': "Fearless women change the world."
  },
  {
    'bg': Colors.pinkAccent.shade100,
    'icon': '💝',
    'quote': "Celebrating the heart of every woman."
  },
  ];

  Future<void> shareCard() async {

    RenderRepaintBoundary boundary =
        cardKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage(pixelRatio: 3);

    ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    Uint8List pngBytes = byteData!.buffer.asUint8List();

    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/womens_card.png');

    await file.writeAsBytes(pngBytes);

    await Share.shareXFiles(
      [XFile(file.path)],
      text: "Happy Women's Day 🌸",
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Women's Day Cards"),
        backgroundColor: Colors.purple,
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade50, Colors.purple.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [

              Text(
                "✨ Women's Day Cards ✨",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade800,
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cards.length,
                  itemBuilder: (context, index) {

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = index;
                        });
                      },

                      child: Container(
                        width: 160,
                        margin: EdgeInsets.symmetric(horizontal: 10),

                        decoration: BoxDecoration(
                          color: cards[index]['bg'],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selectedCard == index
                                ? Colors.purple
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              cards[index]['icon'],
                              style: TextStyle(fontSize: 50),
                            ),

                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                cards[index]['quote'],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 30),

              RepaintBoundary(
                key: cardKey,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: cards[selectedCard]['bg'],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0,5),
                      )
                    ],
                  ),

                  child: Column(
                    children: [

                      Text(
                        cards[selectedCard]['icon'],
                        style: TextStyle(fontSize: 60),
                      ),

                      SizedBox(height: 10),

                      Text(
                        cards[selectedCard]['quote'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        "Dear $recipientName",
                        style: TextStyle(fontSize: 16),
                      ),

                      SizedBox(height: 10),

                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "From $senderName ❤️",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25),

              Container(
                padding: EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [

                    TextField(
                      decoration: InputDecoration(
                        labelText: "Recipient Name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (v) {
                        setState(() {
                          recipientName = v;
                        });
                      },
                    ),

                    SizedBox(height: 15),

                    TextField(
                      decoration: InputDecoration(
                        labelText: "Your Name",
                        prefixIcon: Icon(Icons.edit),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (v) {
                        setState(() {
                          senderName = v;
                        });
                      },
                    ),

                    SizedBox(height: 15),

                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Personal Message",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (v) {
                        setState(() {
                          message = v;
                        });
                      },
                    ),

                    SizedBox(height: 20),

                    /// Share Button
                    ElevatedButton.icon(
                      onPressed: shareCard,
                      icon: Icon(Icons.share),
                      label: Text("Share Greeting Card"),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Text(
                "💜 Celebrate Every Woman 💜",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}