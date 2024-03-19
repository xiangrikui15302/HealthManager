import router from '@ohos.router'
import thermal from '@ohos.thermal'
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemIndexList from '../view/itemIndex/ItemIndexList'
import ItemPannel from '../view/itemIndex/ItemPannel'
import GroupInfo from '../viewmodel/record/GroupInfo'
import RecordItem from '../viewmodel/record/RecordItem'
@Entry
@Component
struct ItemIndexPage {
  @Provide isShowPannel: boolean = false
  @State item: RecordItem = null
  @State groupInfo:GroupInfo = router.getParams()["groupInfo"]
  // @Provide currentItem: RecordItem = null

  onPannelShow(item: RecordItem){
    this.isShowPannel = true
    this.item = item
  }

  build() {
    Column() {
      this.header()

      ItemIndexList({isFood: this.groupInfo.type.id !== 4, onPannelShow: this.onPannelShow.bind(this)})
        .width('100%')
        .layoutWeight(1)

      Panel(this.isShowPannel) {
        ItemPannel({currentItem: $item,groupInfoId: this.groupInfo.type.id})
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
      Text(this.groupInfo.type.name)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .padding(CommonConstants.SPACE_10)
  }
}