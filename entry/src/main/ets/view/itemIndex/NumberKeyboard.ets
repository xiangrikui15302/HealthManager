import { CommonConstants } from '../../common/constants/CommonConstants'

@Styles function gridItemStyle() {
  .backgroundColor(Color.White)
  .height(70)
  .borderRadius(5)
}

@Component
export default struct NumberKeyboard {
  @Link amount: number
  @Link amountValue: string
  numbers: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.']
  build() {
    Grid(){
      ForEach(
        this.numbers,
        (item,index) => {
          GridItem(){
            Text(item)
              .fontSize(30)
              .fontWeight(CommonConstants.FONT_WEIGHT_700)
          }
          .gridItemStyle()
          .onClick(() => {
            this.numberClick(item)
          })
        }
      )

      GridItem(){
        Text("删除")
          .fontSize(30)
          .fontWeight(CommonConstants.FONT_WEIGHT_700)
      }
      .gridItemStyle()
      .onClick(() => {
        this.deleteClick()
      })
    }
    .height(320)
    .backgroundColor($r('app.color.index_page_background'))
    .columnsTemplate('1fr 1fr 1fr')
    .columnsGap(CommonConstants.SPACE_8)
    .rowsGap(CommonConstants.SPACE_8)
    .padding(CommonConstants.SPACE_8)
  }

  numberClick(number: string){
    let num = this.amountValue+number
    let arr: string[] = num.split('.')
    if (arr.length > 2){
      return
    }

    if(arr.length === 2 && arr[1].length >= 2){
      return
    }
    this.amountValue = num
    this.amount = this.parseToFloat(this.amountValue)
  }
  deleteClick(){
    if(this.amountValue.length <= 0){
      this.amountValue = ''
      this.amount = 0
      return
    }
    this.amountValue = this.amountValue.substring(0, this.amountValue.length-1)
    this.amount = this.parseToFloat(this.amountValue)
  }

  parseToFloat(number: string){
    if (number.length == 0) {
      return 0
    }
    if(number.endsWith('.')) {
      number = number.substring(0, number.length-1)
    }
    return parseFloat(number)
  }
}