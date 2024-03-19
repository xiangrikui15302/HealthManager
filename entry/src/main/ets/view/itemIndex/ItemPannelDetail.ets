import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordItem from '../../viewmodel/record/RecordItem'
@Component
export default struct ItemPannelDetail {
  @Link currentItem:RecordItem
  @Prop amount: number
  build() {
    Column({space:CommonConstants.SPACE_10}){
      Image(this.currentItem.image)
        .width(100)
      Text(this.currentItem.name)
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
        .padding({ left: CommonConstants.SPACE_10,
          right :CommonConstants.SPACE_10 ,
          top:CommonConstants.SPACE_4,
          bottom:CommonConstants.SPACE_4
        })
        .backgroundColor($r('app.color.lightest_primary_color'))
        .borderRadius(5)
      Divider()
        .margin({left:CommonConstants.SPACE_10, right: CommonConstants.SPACE_10})
        .opacity(0.6)
      Row({space: CommonConstants.SPACE_10}){
        this.NutrientInfo("热量（千卡）", this.currentItem.calorie+"")
        if(this.currentItem.carbon > 0){
          this.NutrientInfo("碳水（克）", this.currentItem.carbon+"")
        }
        if(this.currentItem.protein > 0) {
          this.NutrientInfo("蛋白质（克）", this.currentItem.protein+"")
        }
        if(this.currentItem.fat > 0) {
          this.NutrientInfo("脂肪（克）", this.currentItem.fat+"")
        }


      }
      Divider()
        .margin({left:CommonConstants.SPACE_10, right: CommonConstants.SPACE_10})
        .opacity(0.6)
      Row(){
        Column(){
          Text(this.amount.toFixed(1))
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
            .fontColor($r('app.color.primary_color'))
            .fontSize(40)
          Divider()
            .backgroundColor($r('app.color.primary_color'))

        }
        .width(120)
        Text('片')
          .fontColor($r('app.color.light_gray'))
      }
    }
  }

  @Builder NutrientInfo(title: string, value: string) {
    Column({space: CommonConstants.SPACE_8}){
      Text(title)
        .fontSize(12)
        .fontColor($r('app.color.light_gray'))
      Text(value)
        .fontSize(16)
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
    }
  }
}