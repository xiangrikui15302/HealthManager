
import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default  struct NutrientStats {

  carbon: number = 20
  protein: number = 20
  fat: number = 20

  recommendCarbon: number = CommonConstants.RECOMMEND_CARBON
  recommendProtein: number = CommonConstants.RECOMMEND_PROTEIN
  recommendFat: number = CommonConstants.RECOMMEND_FAT

  build() {
    Row({ space:CommonConstants.SPACE_6 }){
      this.StatusBuilder(this.carbon, this.recommendCarbon,$r('app.color.carbon_color'),'碳水化合物（克）')
      this.StatusBuilder(this.protein, this.recommendProtein,$r('app.color.protein_color'),'蛋白质（克）')
      this.StatusBuilder(this.fat, this.recommendFat,$r('app.color.fat_color'),'脂肪（克）')

    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({top: 30, bottom: 35})
  }

  @Builder StatusBuilder(proValue:number, proMaxValue:number,proColor:ResourceStr, tips: string) {
    Column({ space: CommonConstants.SPACE_10 }){
      Stack(){
        Progress({
          value: proValue,
          total: proMaxValue,
          type: ProgressType.Ring,
        })
          .width(100)
          .color(proColor)
          .style({
            strokeWidth:6,

          })
        Column({ space:CommonConstants.SPACE_6 }) {
          Text('摄入推荐')
            .fontSize(13)
            .fontColor($r('app.color.gray'))
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
          Text(proValue+"/"+proMaxValue)
            .fontSize(20)
            .fontWeight(CommonConstants.FONT_WEIGHT_700)

        }
      }
      Text(tips)
        .fontSize(13)
        .fontColor($r('app.color.light_gray'))
    }

  }
}