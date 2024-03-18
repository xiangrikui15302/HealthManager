import { CommonConstants } from '../../common/constants/CommonConstants'
@Component
export struct SearchHeader {
  build() {
    Row({space:CommonConstants.SPACE_10}){
      Search({
        placeholder:'搜索',
      })
        .textFont({size:15})
        .layoutWeight(1)
      Badge({count:1,
        position:BadgePosition.RightTop,
        style: {
          fontSize:12
        }
      }){
        Image($r('app.media.ic_public_email'))
          .width(25)
      }
    }
    .width(CommonConstants.THOUSANDTH_940)
  }
}