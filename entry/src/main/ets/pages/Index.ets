import { CommonConstants } from '../common/constants/CommonConstants'
import DateUtil from '../common/utils/DateUtil'
import DbUtil from '../common/utils/DbUtil'
import recordModel from '../model/record/RecordModel'
import recordService from '../services/RecordService'
import { RecordIndex } from '../view/record/RecordIndex'
import GroupInfo from '../viewmodel/record/GroupInfo'
@Entry
@Component
struct Index {
  @State currentIndex: number = 0

  @State isPageShow:boolean = true

  onPageShow(){
    this.isPageShow = true
  }

  onPageHide(){
    this.isPageShow = false
  }

  @Builder tabBarBuilder(title: ResourceStr, image: ResourceStr, index: number){
    Column({ space: CommonConstants.SPACE_8 }){
      Image(image)
        .width(24)
        .fillColor(this.selecteColor(index))
      Text(title)
        .fontSize(14)
        .fontColor(this.selecteColor(index))
    }
  }

  selecteColor(index: number) {
    return this.currentIndex === index ? $r('app.color.primary_color') : $r('app.color.gray')
  }

  build() {
    Tabs() {
      // 饮食记录x
      TabContent(){
        RecordIndex({isPageShow: this.isPageShow})
      }
      .tabBar(this.tabBarBuilder($r('app.string.tab_record'),$r('app.media.ic_calendar'),0))

      // 发现
      TabContent(){
        Text('')
      }
      .tabBar(this.tabBarBuilder($r('app.string.tab_discover'),$r('app.media.discover'),1))

      TabContent(){
        Text('')
      }
      .tabBar(this.tabBarBuilder($r('app.string.tab_user'),$r('app.media.ic_user_portrait'),2))
    }
    .barPosition(BarPosition.End)
    .vertical(false)
    .width('100%')
    .height('100%')
    .onChange(index => {
      this.currentIndex = index
    })
  }


}