
export default class RecordItem{

  id: number
  name: ResourceStr
  image: ResourceStr
  // 分类
  category: number
  // 热量
  calorie: number
  // 单位
  unit:ResourceStr
  // 碳水
  carbon: number
  // 单位
  protein:number
  // 脂肪
  fat:number

  constructor(id: number, name: ResourceStr, image: ResourceStr,
              category: number,unit:ResourceStr, calorie: number,
              carbon?: number, protein?:number,fat?:number
  ) {
    this.id = id
    this.name = name
    this.image = image
    this.category = category
    this.unit = unit
    this.calorie = calorie
    this.carbon = carbon
    this.protein = protein
    this.fat = fat
  }
}