import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordItem from '../../viewmodel/record/RecordItem'
import RecordVO from '../../viewmodel/record/RecordVO'
@Component
export default struct RecordFoodItem {
  recordVO: RecordVO
  build() {
    Row({space:CommonConstants.SPACE_10}){
      Image(this.recordVO.recordItem.image)
        .width(40)
      Column({space:CommonConstants.SPACE_4}){
        Text(this.recordVO.recordItem.name)
          .fontWeight(CommonConstants.FONT_WEIGHT_600)
          .fontSize(15)
        Text(`${this.recordVO.amount}${this.recordVO.recordItem.unit}`)
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
      }
      Blank()
      Text(`${this.recordVO.calorie.toFixed(0)}千卡`)
        .fontSize(14)
        .fontColor($r('app.color.light_gray'))
    }
    .width('100%')
    .height(70)
    .padding(CommonConstants.SPACE_10)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}