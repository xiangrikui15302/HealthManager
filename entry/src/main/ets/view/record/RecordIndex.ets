
import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import recordService from '../../services/RecordService'
import GroupInfo from '../../viewmodel/record/GroupInfo'
import RecordVO from '../../viewmodel/record/RecordVO'
import StaticInfo from '../../viewmodel/record/StaticInfo'
import RecordList from './RecordList'
import { SearchHeader } from './SearchHeader'
import StaticCard from './StaticCard'
@Preview
@Component
export struct RecordIndex {
  @Provide groupInfoArr:GroupInfo[] = []
  @Provide records:RecordVO[] = []
  @StorageProp('selectedDate')
  @Watch('aboutToAppear')
  selectedDate: number = DateUtil.beginTimeOfDay(new Date())

  @Prop
  @Watch('aboutToAppear')
  isPageShow:boolean

  @Provide staticInfo: StaticInfo = new StaticInfo()


  async aboutToAppear(){

    // let createTime = (AppStorage.Get('selectedDate') || DateUtil.beginTimeOfDay(new Date())) as number
    if (this.isPageShow) {

      this.records = await recordService.listByDate(this.selectedDate)
      console.log("records.len:"+this.records.length)

      this.staticInfo = recordService.calculateStatsInfo(this.records)
      console.log("staticInfo:"+this.staticInfo.carbon)
      this.groupInfoArr = recordService.parseToGroupInfoArr(this.records)
    }

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