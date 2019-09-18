import 'dart:async';
import 'dart:isolate';
import 'package:meta/meta.dart';


class CrossIsolatesMessage<T> {
  final SendPort sender;
  final T message;

  CrossIsolatesMessage({
    @required this.sender,
    this.message,
  });
}

class AppExecutor {

  Isolate _isolate;
  ReceivePort _handshakeReceivePort;
  SendPort _handshakeSendPort;
  ReceivePort _isolateTaskMessageReceiverPort;
  StreamController<dynamic> _isolateTaskStream;
  dynamic _arguments;

  static const int STREAM_COMPLETED = null;



  Future<void> assign(isolateTask, {dynamic arguments}){

    this._arguments = arguments;

    this._handshakeReceivePort = ReceivePort();

    Isolate.spawn(isolateTask, _handshakeReceivePort.sendPort).then((isolate){
      this._isolate = isolate;
    });

    return _handshakeReceivePort.first.then((isolateTaskSendPort){
      this._handshakeSendPort = isolateTaskSendPort;
    });
  }

  Future<dynamic> execute(){
    this._isolateTaskMessageReceiverPort = ReceivePort();
    this._handshakeSendPort.send(
        CrossIsolatesMessage<dynamic>(
          sender: this._isolateTaskMessageReceiverPort.sendPort,
          message: this._arguments,
        )
    );
    return this._isolateTaskMessageReceiverPort.first;
  }

  Stream<dynamic> stream(){

     _isolateTaskStream = StreamController.broadcast();

    this._isolateTaskMessageReceiverPort = ReceivePort();
    this._handshakeSendPort.send(
        CrossIsolatesMessage<dynamic>(
          sender: this._isolateTaskMessageReceiverPort.sendPort,
          message: this._arguments,
        )
    );

    _isolateTaskMessageReceiverPort.listen((data){
        if(data != AppExecutor.STREAM_COMPLETED){
          this._isolateTaskStream.add(data);
        }else{
          this._isolateTaskStream.close();
        }
    });

    return this._isolateTaskStream.stream;
  }

  void dispose(){
    this._handshakeReceivePort.close();
    this._isolateTaskMessageReceiverPort.close();
    this._isolate.kill(priority: Isolate.immediate);
    this._isolate = null;
  }

}




//void main() async {
//  Executor dbExecutor = new Executor();
//  print("Start Job A");
//
//  dbExecutor.assign(oneShotExecute, arguments: "Please do my job.").then((_){
//    dbExecutor.execute().then((data){
//      print("One shot output : $data");
//      print("Do post process after completion of Job A");
//    });
//  });
//
//  print("Do job B");
//
//  Executor networkExecutor = new Executor();
//  Map arguments = Map();
//  arguments['counter'] = 2;
//  arguments['expect'] = 300;
//  networkExecutor.assign(streamListen, arguments: arguments).then((_){
//    networkExecutor.stream().listen((data){
//       print("Stream output : $data");
//    }).onDone((){
//      print("Stream completed.");
//    });
//  });
//
//  print("Do jog C");
//
//  Executor newExecutor = new Executor();
//  Map arguments1 = Map();
//  arguments1['counter'] = 5;
//  arguments1['expect'] = 500;
//  newExecutor.assign(streamListen, arguments: arguments1).then((_){
//    newExecutor.stream().listen((data){
//      print("Stream output : $data");
//    }).onDone((){
//      print("Stream completed.");
//    });
//  });
//
//}
//
//void oneShotExecute(SendPort sendPort){
//
//  ReceivePort isolateTaskReceiverPort = ReceivePort();
//
//  sendPort.send(isolateTaskReceiverPort.sendPort);
//
//  isolateTaskReceiverPort.first.then((dynamic arguments){
//
//    CrossIsolatesMessage incomingMessage = arguments as CrossIsolatesMessage;
//    var message = incomingMessage.message;
//    print("oneShotExecute : $message");
//    Timer(Duration(seconds: 3), (){
//      String newMessage = "Hey I completed your job !!!";
//      incomingMessage.sender.send(newMessage);
//    });
//  });
//}
//
//
//void streamListen(SendPort sendPort){
//  ReceivePort isolateTaskReceiverPort = ReceivePort();
//
//  sendPort.send(isolateTaskReceiverPort.sendPort);
//
//  isolateTaskReceiverPort.first.then((dynamic arguments){
//
//    CrossIsolatesMessage incomingMessage = arguments as CrossIsolatesMessage;
//    Map arg= incomingMessage.message;
//    int counter = arg['counter'];
//    int expect = arg['expect'];
//    print("streamListen : Counter $counter");
//    int sum = 0;
//    while (sum <= expect){
//      sum += counter;
//      sleep(const Duration(milliseconds: 500));
//      incomingMessage.sender.send(sum);
//    }
//
//    incomingMessage.sender.send(Executor.STREAM_COMPLETED);
//    isolateTaskReceiverPort.close();
//  });
//}
