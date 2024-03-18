import systemDateTime from '@ohos.systemDateTime'
import { CommonConstants } from '../../common/constants/CommonConstants'


@CustomDialog
export struct DatePickDialog {
  controller:CustomDialogController
  selectedDate: Date = new Date()
  build() {
    Column({ space:CommonConstants.SPACE_12 }){
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        .onChange((value: DatePickerResult) => {
          this.selectedDate.setFullYear(value.year, value.month, value.day)
          console.info('select current date is: ' + JSON.stringify(value))
        })
      Row({ space:CommonConstants.SPACE_12 }){
        Button('取消')
          .width(120)
          .backgroundColor($r('app.color.light_gray'))
          .onClick(() => {
            this.controller.close()
          })
        Button('确定')
          .width(120)
          .backgroundColor($r('app.color.primary_color'))
          .onClick(() => {
            // 保存日期到全局存储AppStorage
            AppStorage.SetOrCreate('selectedDate',this.selectedDate.getTime())
            this.controller.close()
          })
      }

    }
    .width('100%')
    .padding(CommonConstants.SPACE_12)
  }
}