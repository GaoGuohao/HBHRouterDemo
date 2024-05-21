import router from '@ohos.router';

// 申明页面入口时，添加路由名称，名称和路径定义保持一致即可
@Entry({routeName: "mall/store/detail"})
@Component
export struct StoreDetailPage {

  // 接收Router参数
  @State storeId: string = (router.getParams() as Record<string, string>).storeId;
  // 或
  // @State storeId: string = (router.getParams() as Record<string, string>)['storeId'];

  build() {
    Row() {
      Column() {
        Text(`这是 hbhshop 组件模块`)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)

        Text(`来到了storeId为${this.storeId}的店铺`)
          .fontSize(20)
          .fontWeight(FontWeight.Regular)
          .margin({ top:15 })
      }
      .width('100%')
    }
    .height('100%')
  }
}