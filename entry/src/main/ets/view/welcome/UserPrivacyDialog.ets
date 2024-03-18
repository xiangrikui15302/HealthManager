
import { CommonConstants } from '../../common/constants/CommonConstants'

@CustomDialog
export  struct UserPrivacyDialog {
  controller: CustomDialogController
  confirm: () => void
  cancel: () => void
  build() {
    Column({space:10}){
      Text($r('app.string.user_privacy_title'))
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      Text($r('app.string.user_privacy_content'))
      Button($r('app.string.agree_label'))
        .backgroundColor($r('app.color.primary_color'))
        .width(150)
        .onClick((event: ClickEvent) => {
          this.confirm()
          this.controller.close()
        })
      Button($r('app.string.refuse_label'))
        .backgroundColor($r('app.color.lightest_primary_color'))
        .width(150)
        .fontColor($r('app.color.light_gray'))
        .onClick((event: ClickEvent) => {
          this.cancel()
          this.controller.close()
        })
    }
    .width('100%')
    .padding(10)
  }
}