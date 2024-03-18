import common from '@ohos.app.ability.common'
import router from '@ohos.router'
import PreferenceUtil from '../common/utils/PreferenceUtil'
import {UserPrivacyDialog} from '../view/welcome/UserPrivacyDialog'
@Extend(Text) function whiteText(opacity:number){
  .fontSize(12).opacity(opacity).fontColor(Color.White)
}

const PREE_KEY = 'userPrivacyKey'
@Entry
@Component
struct WelcomePage {
  context = getContext(this) as common.UIAbilityContext
  controller:CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      confirm:()=> this.onConfirm(),
      cancel:()=> this.onCancel()
    })
  })

  async onConfirm(){
    // 保存首选项
    await PreferenceUtil.putPreferenceValue(PREE_KEY,true)
    this.jumpToHomePage()
  }

  onCancel(){
    // 退出app
    this.context.terminateSelf()
  }

  async aboutToAppear(){
    let isAgree = await PreferenceUtil.getPreferenceValue(PREE_KEY,false)
    if(!isAgree){
      this.controller.open()
    } else {
      // 调整到首页
      this.jumpToHomePage()

    }

  }

  /**
   * 调转到首页
   */
  jumpToHomePage(){
    // 调整到首页
    setTimeout(() => {
      router.replaceUrl({
        url:'pages/Index'
      })
    },1000)
  }

  build() {
    Column({space:10}) {
      Row(){
        Image($r('app.media.home_slogan'))
          .width(260)
      }
      .layoutWeight(1)
      Image($r('app.media.home_logo'))
        .width(150)
      Row(){
        Text('健康管理支持').whiteText(0.8)
        Text('IPV6').whiteText(0.8)
          .borderWidth(1).borderColor(Color.White).borderRadius(16)
          .padding({left:5,right:5})
          .margin({left:5,right:5})
        Text('网络').whiteText(0.8)
      }
      Text('网络网络网络网络网络网络网络网络网络网络')
        .whiteText(0.8)
      Text('IP备0103534546456')
        .whiteText(0.6)
    }
    .width('100%').height('100%')
    .padding({bottom:50})
    .backgroundColor($r('app.color.welcome_page_background'))
  }
}