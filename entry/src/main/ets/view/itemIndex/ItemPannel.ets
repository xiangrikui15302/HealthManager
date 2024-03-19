import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordService from '../../services/RecordService'
import RecordItem from '../../viewmodel/record/RecordItem'
import ItemPannelDetail from './ItemPannelDetail'
import ItemPannelHeader from './ItemPannelHeader'
import NumberKeyboard from './NumberKeyboard'
@Component
export  default struct ItemPannel {
  @Link currentItem:RecordItem
  @Prop groupInfoId:number
  @Consume isShowPannel: boolean

  @State amount:number = 1
  @State amountValue: string = ""

  build() {
    Column({space: CommonConstants.SPACE_10}){
      ItemPannelHeader()
      if(this.currentItem) {
        ItemPannelDetail({
          currentItem: $currentItem,
          amount:this.amount
        })
      }

      // 键盘输入区
      NumberKeyboard({
        amount:$amount,
        amountValue:$amountValue
      })
      // 按钮
      Row({space: CommonConstants.SPACE_10}){
        Button('取消').onClick((event: ClickEvent) => {
          this.isShowPannel = false
        })
          .width(120)
          .type(ButtonType.Normal)
          .borderRadius(5)
          .backgroundColor($r('app.color.light_gray'))
        Button('提交').onClick((event: ClickEvent) => {
          this.isShowPannel = false
          RecordService.insertRecord(this.groupInfoId,this.currentItem.id,this.amount)
            .then(value => {
              console.log("插入成功")

            }).catch(error => {
            console.log("插入失败")
          })
        })
          .width(120)
          .type(ButtonType.Normal)
          .borderRadius(5)
          .backgroundColor($r('app.color.primary_color'))

      }
    }
    .width('100%')
    .height('100%')
  }
}