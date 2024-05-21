import router from '@ohos.router';
@Preview
@Entry({routeName: 'NotFoundPage'})
@Component
export struct NotFoundPage {

  build() {
    Row() {
      Column() {

        Text("您正在查找的内容闹洞房去啦～")
          .fontSize(15)
          .fontWeight(FontWeight.Regular)
          .fontColor($r('app.color.not_found_title_color'))
          .margin({ top: 16 })

        Text("建议去别的页面转转")
          .fontSize(13)
          .fontWeight(FontWeight.Regular)
          .fontColor($r('app.color.not_found_desc_color'))
          .margin({ top: 8})

        Row() {
          Button("返回上一页")
            .backgroundColor(Color.White)
            .fontWeight(FontWeight.Regular)
            .fontSize(14)
            .fontColor('#666666')
            .borderWidth(0.5)
            .borderColor('#DDDDDD')
            .onClick(() => {
              router.back();
            })
        }
        .margin({ top: 25})
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }
    .height('100%')
  }
}
