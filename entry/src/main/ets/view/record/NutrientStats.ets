
import { CommonConstants } from '../../common/constants/CommonConstants'
import StaticInfo from '../../viewmodel/record/StaticInfo'

@Component
export default  struct NutrientStats {

  @Consume staticInfo: StaticInfo

  recommendCarbon: number = CommonConstants.RECOMMEND_CARBON
  recommendProtein: number = CommonConstants.RECOMMEND_PROTEIN
  recommendFat: number = CommonConstants.RECOMMEND_FAT

  build() {
    Row({ space:CommonConstants.SPACE_6 }){
      this.StatusBuilder({proValue:this.staticInfo.carbon, proMaxValue:this.recommendCarbon,proColor:$r('app.color.carbon_color'),tips:'碳水化合物（克）'})
      this.StatusBuilder({proValue:this.staticInfo.protein, proMaxValue:this.recommendProtein,proColor:$r('app.color.protein_color'),tips:'蛋白质（克）'})
      this.StatusBuilder({proValue:this.staticInfo.fat, proMaxValue:this.recommendFat,proColor:$r('app.color.fat_color'),tips:'脂肪（克）'})

    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({top: 30, bottom: 35})
  }

  @Builder StatusBuilder($$:{proValue:number, proMaxValue:number,proColor:ResourceStr, tips: string}) {
    Column({ space: CommonConstants.SPACE_10 }){
      Stack(){
        Progress({
          value: $$.proValue,
          total: $$.proMaxValue,
          type: ProgressType.Ring,
        })
          .width(100)
          .color($$.proColor)
          .style({
            strokeWidth:6,

          })
        Column({ space:CommonConstants.SPACE_6 }) {
          Text('摄入推荐')
            .fontSize(13)
            .fontColor($r('app.color.gray'))
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
          Text($$.proValue+"/"+$$.proMaxValue)
            .fontSize(20)
            .fontWeight(CommonConstants.FONT_WEIGHT_700)

        }
      }
      Text($$.tips)
        .fontSize(13)
        .fontColor($r('app.color.light_gray'))
    }

  }
}