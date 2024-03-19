import router from '@ohos.router'
import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordItemModel from '../../model/record/RecordItemModel'
import GroupInfo from '../../viewmodel/record/GroupInfo'
import RecordItem from '../../viewmodel/record/RecordItem'
import Record from '../../viewmodel/record/RecordItem'
import RecordListItem from './RecordListItem'
@Component
export default struct RecordList {
 @Consume groupInfoArr: GroupInfo[]

  build() {
    Row(){
      List({space:CommonConstants.SPACE_8}){
        ForEach(
          this.groupInfoArr,
          (item: GroupInfo, index) => {
            ListItem(){
              RecordListItem({groupInfo:item})
                .backgroundColor(Color.White)
                // .width('100%')

            }.onClick(() => {
              router.pushUrl({
                url:'pages/ItemIndexPage',
                params:{"groupInfo": item}
              })
            })
          }
        )
      }
    }
  }
}
