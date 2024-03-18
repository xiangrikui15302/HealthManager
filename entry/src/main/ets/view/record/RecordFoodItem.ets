import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordItem from '../../viewmodel/record/RecordItem'
@Component
export default struct RecordFoodItem {
  recordItem: RecordItem
  build() {
    Row({space:CommonConstants.SPACE_10}){
      Image(this.recordItem.image)
        .width(40)
      Column({space:CommonConstants.SPACE_4}){
        Text(this.recordItem.name)
          .fontWeight(CommonConstants.FONT_WEIGHT_600)
          .fontSize(15)
        Text('150毫升')
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
      }
      Blank()
      Text('50千卡')
        .fontSize(14)
        .fontColor($r('app.color.light_gray'))
    }
    .width('100%')
    .height(70)
    .padding(CommonConstants.SPACE_10)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}