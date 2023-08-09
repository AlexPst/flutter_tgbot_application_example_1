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

  MessageHandler handler(String text)
  {
    return((ctx) async => await ctx.reply("Got a $text")); 
  }

  _startBot() async
  {
    bot.onAudio(handler("audio"));
  bot.onDocument(handler("document"));
  bot.onPhoto(handler("photo"));
  bot.onSticker(handler("sticker"));
  bot.onVideo(handler("video"));
  bot.onVideoNote(handler("video note"));
  bot.onVoice(handler("voice"));
  bot.onContact(handler("contact"));
  bot.onDice(handler("dice"));
  bot.onGame(handler("game"));
  bot.onPollMessage(handler("poll"));
  bot.onVenue(handler("venue"));
  bot.onLocation(handler("location"));
  bot.onLiveLocation(handler("live location"));
  bot.onNewChatTitle(handler("new chat title"));
  bot.onNewChatPhoto(handler("new chat photo"));
  bot.onDeleteChatPhoto(handler("delete chat photo"));
  bot.onPinnedMessage(handler("pinned message"));
  bot.onUsrShared(handler("user shared"));
  bot.onChatShared(handler("chat shared"));
  bot.whenVideoChatScheduled(handler("video chat scheduled"));
  bot.whenVideoChatStarted(handler("video chat started"));
  bot.whenVideoChatEnded(handler("video chat ended"));
  bot.whenVideoChatParticipantsInvited(
    handler("video chat participants invited"),
  );
  bot.onForumTopicCreated(handler("forum topic created"));
  bot.onForumTopicEdited(handler("forum topic edited"));
  bot.onForumTopicClosed(handler("forum topic closed"));
  bot.onForumTopicReopened(handler("forum topic reopened"));
  bot.onWebAppData(handler("web app data"));
  bot.onAnimation(handler("animation"));
    // bot.command("start", (ctx) { String name = ctx.message.from!.firstName;
    //   ctx.reply("Hello $name!");});
    bot.start();
  }

  
 
}
