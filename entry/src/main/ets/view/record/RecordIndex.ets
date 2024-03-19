
import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import recordService from '../../services/RecordService'
import GroupInfo from '../../viewmodel/record/GroupInfo'
import RecordList from './RecordList'
import { SearchHeader } from './SearchHeader'
import StaticCard from './StaticCard'
@Preview
@Component
export struct RecordIndex {
  @Provide groupInfoArr:GroupInfo[] = []

  @StorageProp('selectedDate')
  @Watch('aboutToAppear')
  selectedDate: number = DateUtil.beginTimeOfDay(new Date())

  async aboutToAppear(){

    // let createTime = (AppStorage.Get('selectedDate') || DateUtil.beginTimeOfDay(new Date())) as number
    this.groupInfoArr = await recordService.listByDate(this.selectedDate)
  }
  build() {
    Column({space:CommonConstants.SPACE_10}){
      // 头部搜索
      SearchHeader()
      // 统计卡片
      StaticCard()
      // 记录列表
      RecordList()
        .width(CommonConstants.THOUSANDTH_940)
        .layoutWeight(1)

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_page_background'))
    .padding({bottom:5})
  }
}