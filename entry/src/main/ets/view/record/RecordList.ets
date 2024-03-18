import router from '@ohos.router'
import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordItemModel from '../../model/record/RecordItemModel'
import RecordItem from '../../viewmodel/record/RecordItem'
import Record from '../../viewmodel/record/RecordItem'
import RecordListItem from './RecordListItem'
@Component
export default struct RecordList {
  @State recordList: RecordItem[] = RecordItemModel.list(true)
  build() {
    Row(){
      List({space:CommonConstants.SPACE_8}){
        ForEach(
          this.recordList,
          (item: RecordItem, index) => {
            ListItem(){
              RecordListItem({recordItem:item})
                .backgroundColor(Color.White)
                // .width('100%')

            }.onClick(() => {
              router.pushUrl({
                url:'pages/ItemIndexPage',
              })
            })
          }
        )
      }
    }
  }
}
