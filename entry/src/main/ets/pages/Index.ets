import { HBHRouter } from 'hbhrouter'

@Entry
@Component
struct Index {
  @State message: string = '动态路由测试';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)

        Button("跳转到店铺详情")
          .onClick(()=> {
            const url = 'hbh://mall/store/detail?storeId=88888'
            HBHRouter.openUrl(url)
          })
          .margin({ top:10 })
      }
      .width('100%')
    }
    .height('100%')
  }
}