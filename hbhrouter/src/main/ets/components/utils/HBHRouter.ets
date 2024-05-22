import Url from '@ohos.url' // URL解析
import { router } from '@kit.ArkUI'; // 路由
import '../mainpage/NotFound' // 未找到页面展示

// Router管理类
export class HBHRouter {

  // 打开某个链接
  public static openUrl(urlString: string):void {
    if (urlString.startsWith('http')) {
      // 如果是网页，直接打开webView
      // ... 跳转浏览器代码省略
    } else if (urlString.startsWith('hbh')) {
      // 如果是自定义hbh地址，解析URI参数和路径
      const url = Url.URL.parseURL(urlString);
      // 路径
      const path = url.hostname + url.pathname;
      // Router参数类型为Record<string, string>
      let params: Record<string, string> = {};
      if (path) {
        // 解析 uri参数
        url.params.forEach((value, key) => {
          params[key] = value
        })

        // 如果设置过映射
        router.pushNamedRoute({
          name: path,
          params: params
        },
          router.RouterMode.Standard,
          (err) => {
            if (err) {
              // 如果跳转失败，再跳转到未找到页面
              HBHRouter.pushNotFoundPage()
            }
          }
        )
      } else {
        // 否则跳转到未找到页面
        HBHRouter.pushNotFoundPage()
      }
    }
  }

  // 否则跳转到未找到页面
  private static pushNotFoundPage():void {

    router.pushNamedRoute({
      name: "NotFoundPage"
    }, (err) => {
      if (err) {
        console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
    })
  }
}