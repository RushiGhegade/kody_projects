// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String,
      userInformation: fields[1] as UserInformation,
      userProductInformation:
          (fields[2] as List).cast<UserProductInformation>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userInformation)
      ..writeByte(2)
      ..write(obj.userProductInformation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserProductInformationAdapter
    extends TypeAdapter<UserProductInformation> {
  @override
  final int typeId = 1;

  @override
  UserProductInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProductInformation(
      productId: fields[0] as String,
      orderFilter: fields[5] as OrderFilter?,
      orderQuality: fields[4] as int?,
      isCart: fields[1] as bool,
      order: fields[2] as bool,
      quantity: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserProductInformation obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.isCart)
      ..writeByte(2)
      ..write(obj.order)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.orderQuality)
      ..writeByte(5)
      ..write(obj.orderFilter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProductInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserInformationAdapter extends TypeAdapter<UserInformation> {
  @override
  final int typeId = 2;

  @override
  UserInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInformation(
      userName: fields[0] as String,
      uint8list: fields[2] as Uint8List,
      password: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserInformation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.uint8list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderFilterAdapter extends TypeAdapter<OrderFilter> {
  @override
  final int typeId = 3;

  @override
  OrderFilter read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return OrderFilter.Pending;
      case 1:
        return OrderFilter.Shipped;
      case 2:
        return OrderFilter.Delivered;
      default:
        return OrderFilter.Pending;
    }
  }

  @override
  void write(BinaryWriter writer, OrderFilter obj) {
    switch (obj) {
      case OrderFilter.Pending:
        writer.writeByte(0);
        break;
      case OrderFilter.Shipped:
        writer.writeByte(1);
        break;
      case OrderFilter.Delivered:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderFilterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
