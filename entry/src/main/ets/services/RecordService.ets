import DateUtil from '../common/utils/DateUtil'
import RecordItemModel from '../model/record/RecordItemModel'
import RecordModel from '../model/record/RecordModel'
import { RecordTypes } from '../model/record/RecordTypeModel'
import GroupInfo from '../viewmodel/record/GroupInfo'
import RecordVO from '../viewmodel/record/RecordVO'
class RecordService {

  //新增一条数据
  insertRecord(typeId: number,itemId: number, amount: number):Promise<number> {
    // 将RecordItem模型转化为RecordBD
    // 1.获取时间
    let createTime = (AppStorage.Get('selectedDate') || DateUtil.beginTimeOfDay(new Date())) as number
    // 2.新增
    return RecordModel.insert({typeId, itemId, amount, createTime})
  }

  /**
   * 根据id删除饮食记录
   * @param id 记录id
   * @returns 删除条数
   */
  deleteById(id: number): Promise<number>{
    return RecordModel.deleteById(id)
  }

  // 根据日期查询列表
  async listByDate(date: number): Promise<GroupInfo[]>{
    let recordDBs = await RecordModel.listByDate(date)

    let recordList = recordDBs.map((recordDB => {
      let record = {id: recordDB.id, typeId: recordDB.typeId, amount: recordDB.amount} as RecordVO
      record.recordItem = RecordItemModel.getItemById(record.id)
      record.calorie =  record.recordItem.calorie * record.amount
      return record
    }))
    return this.parseToGroupInfoArr(recordList)
  }

  parseToGroupInfoArr(recordList: RecordVO[]): GroupInfo[]{
    let groupInfoArr = RecordTypes.map(recordType => new GroupInfo(recordType, []))

    recordList.forEach(recordVO => {
      groupInfoArr[recordVO.typeId].items.push(recordVO)
      groupInfoArr[recordVO.typeId].calorie += recordVO.calorie
    })

    return groupInfoArr
  }

}

let recordService = new RecordService()
export default recordService as RecordService