import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class SnapshotAble<E> {
  @JsonKey(ignore: true)
  DocumentSnapshot snapshot;

  SnapshotAble(this.snapshot);

  @protected
  E fromJson();
}
