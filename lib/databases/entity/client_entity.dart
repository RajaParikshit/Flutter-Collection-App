import 'package:collection_app/models/client_model.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'clients',
        indices: [
          Index(
              value: ['account_number']),
        ],
)
class ClientEntity implements ClientModel{

  @PrimaryKey(autoGenerate: true)
  int id;

  @ColumnInfo(name: 'account_number', nullable: false)
  @override
  String accountNumber;

  @override
  double balance;

  @ColumnInfo(name: 'client_name')
  @override
  String name;

  ClientEntity(this.id, this.accountNumber, this.balance, this.name);

}