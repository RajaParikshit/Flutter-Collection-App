import 'package:collection_app/models/client_collection_model.dart';
import 'package:floor/floor.dart';
import 'client_entity.dart';
import 'package:meta/meta.dart';


@Entity(tableName: 'client_collection',
        foreignKeys: [
          ForeignKey(
              childColumns: ['account_number'],
              parentColumns: ['account_number'],
              entity: ClientEntity
          )
        ],
        indices: [
          Index(
              value: ['account_number']
          )
        ]
)
class ClientCollectionEntity implements ClientCollectionModel{

  @PrimaryKey(autoGenerate: true)
  int id;

  @ColumnInfo(name: 'account_number', nullable: false)
  @override
  String accountNumber;

  @ColumnInfo(name: 'collection_amount', nullable: false)
  @override
  double collectionAmount;

  @override
  int date;

  ClientCollectionEntity({this.id, @required this.accountNumber, @required this.collectionAmount, @required this.date});

}