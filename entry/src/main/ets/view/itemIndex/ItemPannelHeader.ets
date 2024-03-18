import { CommonConstants } from '../../common/constants/CommonConstants'
@Component
export default struct ItemPannelHeader {
  build() {
    Row({space:CommonConstants.SPACE_4}){
      Text('09月09日')
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Text('早餐')
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Image($r('app.media.ic_public_spinner'))
        .width(20)
    }
  }
}