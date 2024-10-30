/**
 * Login Page.
 */

@Extend(TextInput)
function inputStyle() {
  .borderRadius(10)
  .height(55)
  .backgroundColor("#faf6fb")
  .fontColor("#222222")
  .fontSize(16)
  .fontWeight(FontWeight.Medium)
}

@Entry
@Component
struct LoginPage {
  @State loginBtnEnable: boolean = false
  @State password: string = ""
  @State account: string = ""
  @State @Watch('onAgreementChange') isAgree: boolean = false

  onAgreementChange(newVal: boolean, oldVal: boolean) {
    console.log(`count changed from ${oldVal} to ${newVal}`);
    this.isLoginAvailable()
  }

  /**
   * Check whether the login button can be clicked
   */
  isLoginAvailable() {
    this.loginBtnEnable = false;
    if (this.account.length > 0 && this.password.length > 0 && this.isAgree) {
      this.loginBtnEnable = true;
    }
  }

  async doLogin() {
    if (this.password === "" && this.account === "") {
      return
    }
  }

  build() {
    Column({ space: 20 }) {
      Text("登录")
        .fontSize(32)
        .fontColor("#222222")
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .padding({ left: 20, right: 20, top: 20 })
      Column() {
        TextInput({ placeholder: "请输入账号" })
          .inputStyle()
          .type(InputType.USER_NAME)
          .onChange((value: string) => {
            this.account = value
            this.isLoginAvailable()
          })
        TextInput({ placeholder: "请输入密码" }).inputStyle()
          .type(InputType.Password)
          .onChange((value: string) => {
            this.password = value
            this.isLoginAvailable()
          })
          .margin({ top: 16 })
      }
      .backgroundColor(Color.White)
      .borderRadius(10)
      .padding(20)
      .margin(16)

      LoginAgreement({ isAgree: this.isAgree })
      Button("登录")
        .enabled(this.loginBtnEnable)
        .onClick(() => {
          this.doLogin()
        })
        .height(50)
        .width(300)
        .type(ButtonType.Normal)
        .borderRadius(10)
    }
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor("#faf6fb")
  }
}

@Component
struct LoginAgreement {
  @Link isAgree: boolean

  build() {
    Row() {
      Checkbox().select(this.isAgree)
        .shape(CheckBoxShape.ROUNDED_SQUARE)
        .onChange((value) => {
          this.isAgree = value
        })
      Text("登录即同意")
        .fontColor("#222222")
        .fontSize(15)
        .margin({ left: 8 })
      Text("《隐私政策》")
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)
        .fontSize(15)
        .onClick(() => {
        })
      Text("和")
        .fontColor("#222222")
        .fontSize(15)
      Text("《用户协议》")
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)
        .fontSize(15)
        .onClick(() => {
        })
    }.width("100%")
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)

  }
}