import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'menu_bloc.dart';
import 'menu.dart';
import 'about_tile.dart';
import 'profile_tile.dart';
import 'uidata.dart';
import 'package:rounded_modal/rounded_modal.dart';
import 'room_one.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  Size deviceSize;
  bool _switchValue = false;
  bool _switchValueTwo = false;
  bool _switchValueThree = false;
  BuildContext _context;

void initState() {
    super.initState();
  //  _connect();
}

// //mqtt 
//  String broker           = 'soldier.cloudmqtt.com';
//   int port                = 13391 ;
//   String username         = 'qzmlgsle';
//   String passwd           = '_bVD3pryg2wc';
//   String clientIdentifier = 'android';

//   mqtt.MqttClient client;
//   mqtt.MqttConnectionState connectionState;
//   StreamSubscription subscription;

//  void _subscribeToTopic(String topic) {
//     if (connectionState == mqtt.MqttConnectionState.connected) {
//         print('[MQTT client] Subscribing to ${topic.trim()}');
//         client.subscribe(topic, mqtt.MqttQos.exactlyOnce);
//     }
//   }

//    Future _connect() async {
//     /// First create a client, the client is constructed with a broker name, client identifier
//     /// and port if needed. The client identifier (short ClientId) is an identifier of each MQTT
//     /// client connecting to a MQTT broker. As the word identifier already suggests, it should be unique per broker.
//     /// The broker uses it for identifying the client and the current state of the client. If you don’t need a state
//     /// to be hold by the broker, in MQTT 3.1.1 you can set an empty ClientId, which results in a connection without any state.
//     /// A condition is that clean session connect flag is true, otherwise the connection will be rejected.
//     /// The client identifier can be a maximum length of 23 characters. If a port is not specified the standard port
//     /// of 1883 is used.
//     /// If you want to use websockets rather than TCP see below.
//     ///
//     client = mqtt.MqttClient(broker, '');
//     client.port = port;

//     /// A websocket URL must start with ws:// or wss:// or Dart will throw an exception, consult your websocket MQTT broker
//     /// for details.
//     /// To use websockets add the following lines -:
//     /// client.useWebSocket = true;
//     /// client.port = 80;  ( or whatever your WS port is)
//     /// Note do not set the secure flag if you are using wss, the secure flags is for TCP sockets only.

//     /// Set logging on if needed, defaults to off
//     client.logging(on: true);

//     /// If you intend to use a keep alive value in your connect message that is not the default(60s)
//     /// you must set it here
//     client.keepAlivePeriod = 30;

//     /// Add the unsolicited disconnection callback
//     client.onDisconnected = _onDisconnected;

//     /// Create a connection message to use or use the default one. The default one sets the
//     /// client identifier, any supplied username/password, the default keepalive interval(60s)
//     /// and clean session, an example of a specific one below.
//     final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
//         .withClientIdentifier(clientIdentifier)
//         .authenticateAs('test', 'test')
//         .startClean() // Non persistent session for testing
//         .keepAliveFor(30)
//         .withWillQos(mqtt.MqttQos.atMostOnce);
//     print('[MQTT client] MQTT client connecting....');
//     client.connectionMessage = connMess;

//     /// Connect the client, any errors here are communicated by raising of the appropriate exception. Note
//     /// in some circumstances the broker will just disconnect us, see the spec about this, we however will
//     /// never send malformed messages.

//     try {
//       await client.connect(username, passwd);
//     } catch (e) {
//       print(e);
//       _disconnect();
//     }

//     /// Check if we are connected
//     if (client.connectionStatus.state == mqtt.MqttConnectionState.connected) {
//       print('[MQTT client] connected');
//       setState(() {
//         connectionState = client.connectionStatus.state;
//       });
//     } else {
//       print('[MQTT client] ERROR: MQTT client connection failed - '
//           'disconnecting, state is ${client.connectionStatus.state}');
//       _disconnect();
//     }

//     /// The client has a change notifier object(see the Observable class) which we then listen to to get
//     /// notifications of published updates to each subscribed topic.
//     subscription = client.updates.listen(_onMessage);

//     _subscribeToTopic("room/lamp");
//   }

//   void _disconnect() {
//     print('[MQTT client] _disconnect()');
//     client.disconnect();
//     _onDisconnected();

    
//   }

//   void _onDisconnected() {
//     print('[MQTT client] _onDisconnected');
//     setState(() {
//       //topics.clear();
//       connectionState = client.connectionStatus.state;
//       client = null;
//       subscription.cancel();
//       subscription = null;
//     });
//     print('[MQTT client] MQTT client disconnected');
//   }


 



//  void _onMessage(List<mqtt.MqttReceivedMessage> event) {
//     print(event.length);
//     final mqtt.MqttPublishMessage recMess =
//     event[0].payload as mqtt.MqttPublishMessage;
//     final String message =
//     mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

//     /// The above may seem a little convoluted for users only interested in the
//     /// payload, some users however may be interested in the received publish message,
//     /// lets not constrain ourselves yet until the package has been in the wild
//     /// for a while.
//     /// The payload is a byte buffer, this will be specific to the topic
//     print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
//         'payload is <-- $message -->');
//     print(client.connectionStatus.state);
//     print("[MQTT client] message with topic: ${event[0].topic}");
//     print("[MQTT client] message with message: $message");
//     setState(() {
//      // _temp = double.parse(message);
//      if(message == "on") {
      
//         _switchValue =true;
       
//          print('switchValue is equals to: $_switchValue');
//      }
//      else if(message == "off") {
      
//         _switchValue = false;
      
//           print('switchValue is equals to: $_switchValue');
//      }
//     });
//   }

  //menuStack

  Widget roomOne(BuildContext context) {
    return InkWell(
      onTap: () => _showModalBottomSheet(),
      splashColor: Colors.orange,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //image
            Image.asset(
              UIData.profileImage,
              fit: BoxFit.cover,
            ),

            //color
            new Container(
              decoration: BoxDecoration(boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  blurRadius: 5.0,
                ),
              ]),
            ),

            //menuData

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.lightbulb_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Room 1",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget roomTwo(BuildContext context) {
    return InkWell(
      onTap: () => _showModalBottomSheetTwo(),
      splashColor: Colors.orange,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //image
            Image.asset(
              UIData.loginImage,
              fit: BoxFit.cover,
            ),

            //color
            new Container(
              decoration: BoxDecoration(boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  blurRadius: 5.0,
                ),
              ]),
            ),

            //menuData

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.lightbulb_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Room 2",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

//all widgets

  List<Widget> allWidgets() {
    return [roomOne(context), roomTwo(context)];
  }

  //appbar
  Widget appBar() => SliverAppBar(
        backgroundColor: Colors.black,
        pinned: true,
        elevation: 10.0,
        forceElevated: true,
        expandedHeight: 150.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          background: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: UIData.kitGradients)),
          ),
          title: Row(
            children: <Widget>[
              FlutterLogo(
                colors: Colors.yellow,
                textColor: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(UIData.appName)
            ],
          ),
        ),
      );

  //bodygrid
  Widget bodyGrid() => SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(_context).orientation == Orientation.portrait ? 2 : 3,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          //return roomOne(context);
          return Container(
            child: Stack(
              children: <Widget>[roomOne(context), roomTwo(context)],
            ),
          );

          // return menuStack(context, menu[index]);
        },
        childCount: 2,
      ));

  Widget homeScaffold(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Scaffold(key: _scaffoldState, body: bodySliverList()),
      );

  Widget bodySliverList() {
    // MenuBloc menuBloc = MenuBloc();
    // return StreamBuilder<List<Menu>>(
    //     stream: menuBloc.menuItems,
    //     builder: (context, snapshot) {
    // return snapshot.hasData
    //     ?
    return CustomScrollView(
      slivers: <Widget>[
        appBar(),
        // bodyGrid(),
        SliverPadding(
          padding: const EdgeInsets.all(2.0),
          sliver: SliverGrid.count(
            crossAxisCount:
                MediaQuery.of(_context).orientation == Orientation.portrait
                    ? 2
                    : 3,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: 1.0,
            children: <Widget>[roomOne(context), roomTwo(context)],
          ),
        ),
      ],
    );
    //: Center(child: CircularProgressIndicator());
    // });
  }

  Widget roomTwoheader() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients2)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  title: "Room 2",
                  subtitle: "",
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
  Widget roomOneheader() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients2)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  title: "Room 1",
                  subtitle: "",
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  Widget roomThreeheader() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients2)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(UIData.pkImage),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  title: "Room 3",
                  subtitle: "",
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  Widget roomFourheader() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients2)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(UIData.pkImage),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  title: "Room 4",
                  subtitle: "",
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  Widget roomFiveheader() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients2)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(UIData.pkImage),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  title: "Room 5",
                  subtitle: "",
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  Widget roomSixheader() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients2)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(UIData.pkImage),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  title: "Room 6",
                  subtitle: "",
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  // Widget _switchlights() => MergeSemantics(
  //                 child: ListTile(
  //                   title: Text('Lights'),
  //                   trailing: CupertinoSwitch(
  //                     activeColor: Colors.yellowAccent,
  //                     value: _lights,
  //                     onChanged: (bool value) { setState(() { _lights = value; }); },
  //                   ),
  //                   onTap: () { setState(() { _lights = !_lights; }); },
  //                 ),
  //               );

   void _showModalBottomSheet() {
    showRoundedModalBottomSheet(
      radius: 15.0,
        context: context,
        builder: (context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Material(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                  
                      borderRadius: new BorderRadius.only(
                          topLeft: new Radius.circular(15.0),
                          topRight: new Radius.circular(15.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      roomOneheader(),
                      SizedBox(
                        height: 10.0,
                      ),
                      BottomSheetSwitch(
                        switchValue: _switchValue,
                        switchValueTwo: _switchValueTwo,
                        switchValueThree: _switchValueThree,
                        valueChanged: (value) {
                          _switchValue = value;
                        },
                        valueChangedTwo: (value) {
                          _switchValueTwo = value;
                        },
                        valueChangedThree: (value) {
                          _switchValueThree = value;
                        },
                      )
                    ],
                  ));
            }));
  }

  void _showModalBottomSheetTwo() {
    showRoundedModalBottomSheet(
      radius: 15.0,
        context: context,
        builder: (context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Material(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                  
                      borderRadius: new BorderRadius.only(
                          topLeft: new Radius.circular(15.0),
                          topRight: new Radius.circular(15.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      roomTwoheader(),
                      SizedBox(
                        height: 10.0,
                      ),
                      BottomSheetSwitch(
                        switchValue: _switchValue,
                        switchValueTwo: _switchValueTwo,
                        switchValueThree: _switchValueThree,
                        valueChanged: (value) {
                          _switchValue = value;
                        },
                        valueChangedTwo: (value) {
                          _switchValueTwo = value;
                        },
                        valueChangedThree: (value) {
                          _switchValueThree = value;
                        },
                      )
                    ],
                  ));
            }));
  }

  Widget iosCardBottom(Menu menu, BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 40.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 3.0, color: Colors.white),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        menu.image,
                      ))),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              menu.title,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 20.0,
            ),
            FittedBox(
              child: CupertinoButton(
                onPressed: () => _showModalBottomSheet(),
                borderRadius: BorderRadius.circular(50.0),
                child: Text(
                  "Go",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: CupertinoColors.activeBlue),
                ),
                color: Colors.white,
              ),
            )
          ],
        ),
      );

  Widget menuIOS(Menu menu, BuildContext context) {
    return Container(
      height: deviceSize.height / 2,
      decoration: ShapeDecoration(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3.0,
        margin: EdgeInsets.all(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // menuImage(menu),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                menu.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              height: 60.0,
              child: Container(
                width: double.infinity,
                color: menu.menuColor,
                child: iosCardBottom(menu, context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyDataIOS(List<Menu> data, BuildContext context) => SliverList(
        delegate: SliverChildListDelegate(
            data.map((menu) => menuIOS(menu, context)).toList()),
      );

  Widget homeBodyIOS(BuildContext context) {
    MenuBloc menuBloc = MenuBloc();
    return StreamBuilder<List<Menu>>(
        stream: menuBloc.menuItems,
        initialData: List(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? bodyDataIOS(snapshot.data, context)
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  Widget homeIOS(BuildContext context) => Theme(
        data: ThemeData(
          fontFamily: '.SF Pro Text',
        ).copyWith(canvasColor: Colors.transparent),
        child: CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                border: Border(bottom: BorderSide.none),
                backgroundColor: CupertinoColors.white,
                largeTitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(UIData.appName),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: CupertinoColors.black,
                        child: FlutterLogo(
                          size: 15.0,
                          colors: Colors.yellow,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              homeBodyIOS(context)
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    _context = context;
    deviceSize = MediaQuery.of(context).size;
    return defaultTargetPlatform == TargetPlatform.iOS
        ? homeIOS(context)
        : homeScaffold(context);
  }
}

class BottomSheetSwitch extends StatefulWidget {
  BottomSheetSwitch(
      {@required this.switchValue,
      @required this.switchValueThree,
      @required this.valueChangedThree,
      @required this.valueChanged,
      @required this.switchValueTwo,
      @required this.valueChangedTwo});

  final bool switchValue;
  final bool switchValueTwo;
  final bool switchValueThree;
  final ValueChanged valueChanged;
  final ValueChanged valueChangedThree;
  final ValueChanged valueChangedTwo;

  @override
  _BottomSheetSwitch createState() => _BottomSheetSwitch();
}

class _BottomSheetSwitch extends State<BottomSheetSwitch> {
  bool _switchValue;
  bool _switchValueTwo;
  bool _switchValueThree;
  @override
  void initState() {
    _switchValue = widget.switchValue;
    _switchValueTwo = widget.switchValueTwo;
    _switchValueThree = widget.switchValueThree;
    super.initState();
    _connect();
  }

  //mqtt 
 String broker           = 'soldier.cloudmqtt.com';
  int port                = 13391 ;
  String username         = 'qzmlgsle';
  String passwd           = '_bVD3pryg2wc';
  String clientIdentifier = 'android';

  mqtt.MqttClient client;
  mqtt.MqttConnectionState connectionState;
  StreamSubscription subscription;

 void _subscribeToTopic(String topic) {
    if (connectionState == mqtt.MqttConnectionState.connected) {
        print('[MQTT client] Subscribing to ${topic.trim()}');
        client.subscribe(topic, mqtt.MqttQos.exactlyOnce);
    }
  }

  void _subscribeToTopicTwo(String topic) {
    if (connectionState == mqtt.MqttConnectionState.connected) {
        print('[MQTT client] Subscribing to ${topic.trim()}');
        client.subscribe(topic, mqtt.MqttQos.exactlyOnce);
    }
  }

   Future _connect() async {

    client = mqtt.MqttClient(broker, '');
    client.port = port;

   
    client.logging(on: true);

    /// If you intend to use a keep alive value in your connect message that is not the default(60s)
    /// you must set it here
    client.keepAlivePeriod = 30;

    /// Add the unsolicited disconnection callback
    client.onDisconnected = _onDisconnected;

 
    final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
        .withClientIdentifier(clientIdentifier)
        .authenticateAs('test', 'test')
        .startClean() // Non persistent session for testing
        .keepAliveFor(30)
        .withWillQos(mqtt.MqttQos.atMostOnce);
    print('[MQTT client] MQTT client connecting....');
    client.connectionMessage = connMess;


    try {
      await client.connect(username, passwd);
    } catch (e) {
      print(e);
      _disconnect();
    }

    /// Check if we are connected
    if (client.connectionStatus.state == mqtt.MqttConnectionState.connected) {
      print('[MQTT client] connected');
      setState(() {
        connectionState = client.connectionStatus.state;
      });
    } else {
      print('[MQTT client] ERROR: MQTT client connection failed - '
          'disconnecting, state is ${client.connectionStatus.state}');
      _disconnect();
    }

    subscription = client.updates.listen(_onMessage);
    subscription = client.updates.listen(_onMessageTwo);

    _subscribeToTopic("room/lamp");
     _subscribeToTopicTwo("room/lamp2");

  }

  void _disconnect() {
    print('[MQTT client] _disconnect()');
    client.disconnect();
    _onDisconnected();

    
  }

  void _onDisconnected() {
    print('[MQTT client] _onDisconnected');
    setState(() {
      //topics.clear();
      connectionState = client.connectionStatus.state;
      client = null;
      subscription.cancel();
      subscription = null;
    });
    print('[MQTT client] MQTT client disconnected');
  }


 



 void _onMessage(List<mqtt.MqttReceivedMessage> event) {
    print(event.length);
    final mqtt.MqttPublishMessage recMess =
    event[0].payload as mqtt.MqttPublishMessage;
    final String message =
    mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

  
    print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
        'payload is <-- $message -->');
    print(client.connectionStatus.state);
    print("[MQTT client] message with topic: ${event[0].topic}");
    print("[MQTT client] message with message: $message");
    setState(() {
     // _temp = double.parse(message);
     if(message == "on") {
      
        _switchValue =true;
       
         print('switchValue is equals to: $_switchValue');
     }
     else if(message == "off") {
      
        _switchValue = false;
       
          print('switchValue is equals to: $_switchValue');
     }
    });
  }

 void _onMessageTwo(List<mqtt.MqttReceivedMessage> event) {
    print(event.length);
    final mqtt.MqttPublishMessage recMess =
    event[0].payload as mqtt.MqttPublishMessage;
    final String message2 =
    mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

  
    print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
        'payload is <-- $message2 -->');
    print(client.connectionStatus.state);
    print("[MQTT client] message with topic: ${event[0].topic}");
    print("[MQTT client] message with message: $message2");
    setState(() {
     // _temp = double.parse(message);
     if(message2 == "on2") {
      
        _switchValueTwo =true;
       
         print('switchValue is equals to: $_switchValueTwo');
     }
     else if(message2 == "off2") {
      
        _switchValueTwo = false;
       
          print('switchValue is equals to: $_switchValueTwo');
     }
    });
  }






  Widget _lights() {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(
            child: MergeSemantics(
                child: ListTile(
          title: Text('Light One'),
          trailing: CupertinoSwitch(
              activeColor: Colors.yellowAccent,
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                
                  widget.valueChanged(value);

                  if(value ==true) {
                    /// Lets publish to our topic
  /// Use the payload builder rather than a raw buffer
  /// Our known topic to publish to
                const String pubTopic = 'room/lamp';
                final mqtt.MqttClientPayloadBuilder builder =
        mqtt.MqttClientPayloadBuilder();
                builder.addString('on');

                /// Subscribe to it
                print('EXAMPLE::Subscribing to the room/lamp topic');
                client.subscribe(pubTopic, mqtt.MqttQos.exactlyOnce);

                /// Publish it
                print('EXAMPLE::Publishing our topic');
                client.publishMessage(pubTopic, mqtt.MqttQos.exactlyOnce, builder.payload);  

                  }
                  else if(value == false) {
                       const String pubTopic = 'room/lamp';
                final mqtt.MqttClientPayloadBuilder builder =
        mqtt.MqttClientPayloadBuilder();
                builder.addString('off');

                /// Subscribe to it
                print('EXAMPLE::Subscribing to the room/lamp topic');
                client.subscribe(pubTopic, mqtt.MqttQos.exactlyOnce);

                /// Publish it
                print('EXAMPLE::Publishing our topic');
                client.publishMessage(pubTopic, mqtt.MqttQos.exactlyOnce, builder.payload);  


                  }


                });
              }),
        ))),
        Container(
            child: MergeSemantics(
                child: ListTile(
          title: Text('Light Two'),
          trailing: CupertinoSwitch(
              activeColor: Colors.yellowAccent,
              value: _switchValueTwo,
              onChanged: (bool value) {
                setState(() {
                  _switchValueTwo = value;
                  widget.valueChangedTwo(value);

                    if(value ==true) {
                    /// Lets publish to our topic
  /// Use the payload builder rather than a raw buffer
  /// Our known topic to publish to
                const String pubTopic2 = 'room/lamp2';
                final mqtt.MqttClientPayloadBuilder builder =
        mqtt.MqttClientPayloadBuilder();
                builder.addString('on2');

                /// Subscribe to it
                print('EXAMPLE::Subscribing to the room/lamp2 topic');
                client.subscribe(pubTopic2, mqtt.MqttQos.exactlyOnce);

                /// Publish it
                print('EXAMPLE::Publishing our topic');
                client.publishMessage(pubTopic2, mqtt.MqttQos.exactlyOnce, builder.payload);  

                  }
                  else if(value == false) {
                       const String pubTopic2 = 'room/lamp2';
                final mqtt.MqttClientPayloadBuilder builder =
        mqtt.MqttClientPayloadBuilder();
                builder.addString('off2');

                /// Subscribe to it
                print('EXAMPLE::Subscribing to the room/lamp2 topic');
                client.subscribe(pubTopic2, mqtt.MqttQos.exactlyOnce);

                /// Publish it
                print('EXAMPLE::Publishing our topic');
                client.publishMessage(pubTopic2, mqtt.MqttQos.exactlyOnce, builder.payload);  

                  }
                });
              }),
        ))),
        Container(
            child: MergeSemantics(
                child: ListTile(
          title: Text('Light Three'),
          trailing: CupertinoSwitch(
              activeColor: Colors.yellowAccent,
              value: _switchValueThree,
              onChanged: (bool value) {
                setState(() {
                  _switchValueThree = value;
                  widget.valueChangedThree(value);
                });
              }),
        ))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _lights();
  }
}
