import 'package:commet/client/client.dart';
import 'package:flutter/material.dart';

class SimulatedPeer implements Peer {
  @override
  ImageProvider<Object>? avatar;

  @override
  Client client;

  @override
  String displayName;

  @override
  String identifier;

  SimulatedPeer(this.client, this.identifier, this.displayName, this.avatar);
}