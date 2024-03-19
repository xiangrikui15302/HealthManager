
import { CommonConstants } from '../../common/constants/CommonConstants'
import StaticInfo from '../../viewmodel/record/StaticInfo'

@Component
export default  struct CalorieStats {
  @Consume staticInfo: StaticInfo
  recommend: number = CommonConstants.RECOMMEND_CALORIE// 推荐的
  remainCalorie() {
    return this.recommend - this.staticInfo.intake + this.staticInfo.expend
  }
  build() {
    Row({ space:CommonConstants.SPACE_6 }){
      this.StatusBuilder({title:'饮食摄入',value:this.staticInfo.intake+""})

      Stack(){
        Progress({
          value: this.staticInfo.intake,
          total: this.recommend,
          type: ProgressType.Ring,
        })
          .width(130)
          .color($r('app.color.primary_color'))
          .style({
            strokeWidth:10,

          })
        this.StatusBuilder({title:'还可以吃',value:this.remainCalorie() + "",tips:'推荐'+this.recommend})

      }

      this.StatusBuilder({title:'运动消耗',value:this.staticInfo.expend+""})

    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({top: 30, bottom: 35})
  }

  @Builder StatusBuilder($$:{title:string, value: string, tips?: string}) {
    Column({ space:CommonConstants.SPACE_6 }) {
      Text($$.title)
        .fontColor($r('app.color.gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Text($$.value)
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      if($$.tips) {
        Text($$.tips)
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
      }
    }
  }
}