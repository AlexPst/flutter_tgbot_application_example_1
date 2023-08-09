import 'dart:io';

import 'package:flutter/material.dart';
import 'package:televerse/televerse.dart';
//https://github.com/HeySreelal/televerse/blob/main/example/menu_bot.dart

 const String token = "6622522645:AAEzQznIXLr-gFT3pVT5LK8Zlsuthbr8Mzk";
 final Bot bot = Bot(token);
 Conversation conversation = Conversation(bot);

  
void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo BOT',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOT'),
        actions: [
          IconButton(icon: const Icon (Icons.play_arrow), onPressed: () => _startBot())
        ],
    )
    );
  }
  
  
  _startBot() async
  {
    bot.command("test", (ctx) => ctx.reply( "Hello <b>world</b>",
      parseMode: ParseMode.html,)); 
    // bot.command("start", (ctx) { String name = ctx.message.from!.firstName;
    //   ctx.reply("Hello $name!");});
    bot.start();
  }

  
 
}
