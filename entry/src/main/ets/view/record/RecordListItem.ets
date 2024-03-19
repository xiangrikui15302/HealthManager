import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordItemModel from '../../model/record/RecordItemModel'
import GroupInfo from '../../viewmodel/record/GroupInfo'
import RecordItem from '../../viewmodel/record/RecordItem'
import RecordFoodItem from './RecordFoodItem'

@Component
export default struct RecordListItem {
  groupInfo: GroupInfo
  // @State foods: RecordItem[] = RecordItemModel.list(true)

  build() {
    Column(){
      Row({space:CommonConstants.SPACE_6}){
        Image(this.groupInfo.type.icon)
          .width(20)
        Text(this.groupInfo.type.name)
          .fontWeight(CommonConstants.FONT_WEIGHT_700)
          .fontSize(18)
        Text(`建议${this.groupInfo.type.min}~${this.groupInfo.type.max}千卡`)
          .fontSize(15)
          .fontColor($r('app.color.light_gray'))
        Blank()
        Text(this.groupInfo.calorie+"")
          .fontSize(15)
          .fontColor($r('app.color.primary_color'))
        Text('碗')
          .fontSize(15)
          .fontColor($r('app.color.light_gray'))
        Image($r('app.media.ic_public_add_norm_filled'))
          .width(20)
          .onClick((event: ClickEvent) => {

          })
      }
      .width('100%')
      .padding(15)
      .height(60)
      .justifyContent(FlexAlign.SpaceBetween)

      // 二级列表
      if(this.groupInfo.items.length > 0){
        List(){
          ForEach(
            this.groupInfo.items,
            (item, index) => {
              ListItem(){
                RecordFoodItem({recordVO: item})
              }.swipeAction({
                end: this.deleteBtn.bind(this)
              })
            }
          )
        }
      }
    }

  }

  @Builder deleteBtn(){
    Image($r('app.media.ic_public_delete_filled'))
      .width(30)
      .fillColor(Color.Red)
      .margin(5)
      .onClick(() => {

      })
  }
}