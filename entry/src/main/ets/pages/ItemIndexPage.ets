import router from '@ohos.router'
import thermal from '@ohos.thermal'
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemIndexList from '../view/itemIndex/ItemIndexList'
import ItemPannel from '../view/itemIndex/ItemPannel'
import RecordItem from '../viewmodel/record/RecordItem'
@Entry
@Component
struct ItemIndexPage {
  @State message: string = '早餐'
  @Provide isShowPannel: boolean = false
  @State item: RecordItem = null
  // @Provide currentItem: RecordItem = null

  onPannelShow(item: RecordItem){
    this.isShowPannel = true
    this.item = item
  }

  build() {
    Column() {
      this.header()

      ItemIndexList({onPannelShow: this.onPannelShow.bind(this)})
        .width('100%')
        .layoutWeight(1)

      Panel(this.isShowPannel) {
        ItemPannel({currentItem: $item})
      }
      .mode(PanelMode.Full)
      .dragBar(false)
      .backgroundMask($r('app.color.opacity_white_CC'))
    }
    .width('100%')
    .height('100%')
  }

  @Builder header(){
    Row(){
      Image($r('app.media.ic_public_back'))
        .width(25)
        .onClick(() => {
          router.back()
        })
      Blank()
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .padding(CommonConstants.SPACE_10)
  }
}