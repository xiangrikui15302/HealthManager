import { RecordTypeEnum } from '../../model/record/RecordTypeModel'
import RecordType from './RecordType'
import RecordVO from './RecordVO'
export default class GroupInfo {
  /**
   * 分组类型
   */
  type: RecordType
  /**
   * 组内数据集合
   */
  items: RecordVO[]

  /**
   * 组内记录的总热量
   */
  calorie: number = 0

  constructor(type: RecordType, items: RecordVO[]) {
    this.type = type
    this.items = items
  }
}