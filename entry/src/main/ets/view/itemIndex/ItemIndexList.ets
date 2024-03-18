import { CommonConstants } from '../../common/constants/CommonConstants'
import itemCategoryModel from '../../model/record/ItemCategoryModel'
import recordItemModel from '../../model/record/RecordItemModel'
import ItemCategory from '../../viewmodel/record/ItemCategory'
import type RecordItem from '../../viewmodel/record/RecordItem'
@Component
export default struct ItemIndexList {
  @Consume isShowPannel: boolean
  onPannelShow: (item: ItemCategory) => void

  build() {
    Row(){
      Tabs() {
        ForEach(
          itemCategoryModel.foodsCategories,
          (item: ItemCategory, index)=>{
            TabContent(){
              this.tabContentBuilder(item.id)
            }
            .tabBar(item.name)
          }
        )
      }
    }
    .width('100%')
  }

  @Builder tabContentBuilder(categoryId: number) {
    List(){
      ForEach(
        recordItemModel.getListByCategoryId(true,categoryId),
        (item: RecordItem, index) => {
          ListItem(){
            Row({ space: CommonConstants.SPACE_6 }) {
              Image(item.image).width(50)
              Column({ space: CommonConstants.SPACE_4 }) {
                Text(item.name).fontWeight(CommonConstants.FONT_WEIGHT_500)
                Text(`${item.calorie}千卡/${item.unit}`).fontSize(14).fontColor($r('app.color.light_gray'))
              }.alignItems(HorizontalAlign.Start)

              Blank()
              Image($r('app.media.ic_public_add_norm_filled'))
                .width(18)
                .fillColor($r('app.color.primary_color'))
            }
            .width('100%')
            .padding(CommonConstants.SPACE_6)
          }
          .onClick(()=>{
            this.onPannelShow(item)
          })
        }
      )
    }
    .alignListItem(ListItemAlign.Center)
    .height('100%')
  }
}