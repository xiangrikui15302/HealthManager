
import relationalStore from '@ohos.data.relationalStore'
import { ColumnInfo, ColumnType } from '../../common/bean/ColumnInfo'
import RecordDB from '../../common/bean/RecordDB'
import DbUtil from '../../common/utils/DbUtil'
const CREATE_TABLE_SQL: string = `
 CREATE TABLE IF NOT EXISTS record (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   type_id INTEGER NOT NULL,
   item_id INTEGER NOT NULL,
   amount DOUBLE NOT NULL,
   create_time INTEGER NOT NULL
 )
 `
const COLUMNS: ColumnInfo[] = [
  {name: 'id', columnName: 'id', type: ColumnType.LONG},
  {name: 'typeId', columnName: 'type_id', type: ColumnType.LONG},
  {name: 'itemId', columnName: 'item_id', type: ColumnType.LONG},
  {name: 'amount', columnName: 'amount', type: ColumnType.DOUBLE},
  {name: 'createTime', columnName: 'create_time', type: ColumnType.LONG}
]

const TABLE_NAME: string = 'record'
const ID_COLUMN = 'id'
const DATE_COLUMN = 'create_time'

class RecordModel {
  getCreateTableSql(): string {
    return CREATE_TABLE_SQL
  }

  // 增
  insert(record: RecordDB): Promise<number> {
    return  DbUtil.insert(TABLE_NAME, record, COLUMNS)
  }
  // 删
  deleteById(id: number): Promise<number>{
    // 1.查询条件
    let predicates = new relationalStore.RdbPredicates(TABLE_NAME)
    predicates.equalTo(ID_COLUMN, id)
    return DbUtil.delete(predicates)
  }
  // 查
  listByDate(date: number): Promise<RecordDB[]>{
    // 1.查询条件
    let predicates = new relationalStore.RdbPredicates(TABLE_NAME)
    predicates.equalTo(DATE_COLUMN, date)
    // 2.查询
    return DbUtil.queryForList(predicates, COLUMNS)
  }

}

let recordModel = new RecordModel()
export default recordModel as RecordModel