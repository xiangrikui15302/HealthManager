
import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default  struct CalorieStats {
  intake: number = 192 // 摄入的
  expend: number = 150 // 消耗的
  recommend: number = CommonConstants.RECOMMEND_CALORIE// 推荐的
  remainCalorie() {
    return this.recommend - this.intake + this.expend
  }
  build() {
    Row({ space:CommonConstants.SPACE_6 }){
      this.StatusBuilder('饮食摄入',this.intake+"")

      Stack(){
        Progress({
          value: this.intake,
          total: this.recommend,
          type: ProgressType.Ring,
        })
          .width(130)
          .color($r('app.color.primary_color'))
          .style({
            strokeWidth:10,

          })
        this.StatusBuilder('还可以吃',this.remainCalorie() + "",'推荐'+this.recommend)

      }

      this.StatusBuilder('运动消耗',this.expend+"")

    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({top: 30, bottom: 35})
  }

  @Builder StatusBuilder(title:string, value: string, tips?: string) {
    Column({ space:CommonConstants.SPACE_6 }) {
      Text(title)
        .fontColor($r('app.color.gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Text(value)
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      if(tips) {
        Text(tips)
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
      }
    }
  }
}