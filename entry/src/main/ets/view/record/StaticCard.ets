import { CommonConstants } from '../../common/constants/CommonConstants'
import dateUtil from '../../common/utils/DateUtil'
import recordService from '../../services/RecordService'
import GroupInfo from '../../viewmodel/record/GroupInfo'
import RecordVO from '../../viewmodel/record/RecordVO'
import StaticInfo from '../../viewmodel/record/StaticInfo'
import CalorieStats from './CalorieStats'
import { DatePickDialog } from './DatePickDialog'
import NutrientStats from './NutrientStats'
@Preview
@Component
export default struct StaticCard {

  @StorageProp('selectedDate') selectedDate:number = dateUtil.beginTimeOfDay(new Date())

  controller: CustomDialogController = new CustomDialogController({
    builder: DatePickDialog({
      selectedDate: new Date(this.selectedDate)
    })
  })


  build() {
    Column(){
      Row(){
        Text(dateUtil.formatDate(this.selectedDate))
          .fontColor($r('app.color.secondary_color'))
        Image($r("app.media.ic_public_spinner"))
          .width(20)
          .fillColor($r('app.color.secondary_color'))
      }
      .padding(CommonConstants.SPACE_12)
      .onClick(() => {
        this.controller.open()
      })

      Swiper(){
        // NutrientStats().width('100%')

        CalorieStats().width('100%')
        NutrientStats().width('100%')
      }
      .backgroundColor(Color.White)
      .borderRadius(CommonConstants.DEFAULT_18)
      .width('100%')
      .indicatorStyle({
        selectedColor:$r('app.color.primary_color')
      })
      .loop(false)
    }
    .width(CommonConstants.THOUSANDTH_940)
    .backgroundColor($r('app.color.stats_title_bgc'))
    .borderRadius(CommonConstants.DEFAULT_18)
  }
}