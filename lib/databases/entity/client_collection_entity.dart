import 'package:collection_app/models/client_collection_model.dart';
import 'package:floor/floor.dart';
import 'client_entity.dart';


@Entity(tableName: 'client_collection',
        indices: [
          Index(
              value: ['account_number']
          )

        ],
)
class ClientCollectionEntity implements ClientCollectionModel{

  @PrimaryKey(autoGenerate: true)
  int id;

  @ColumnInfo(name: 'account_number', nullable: false)
  @override
  String accountNumber;

  @ColumnInfo(name: 'amount', nullable: false)
  @override
  double amount;

  @ColumnInfo(name: 'date', nullable: false)
  @override
  int date;

  ClientCollectionEntity(this.id, this.accountNumber, this.amount, this.date);

}