// 页面设置模块
// 根据学位类型配置页面尺寸和页边距

/// 获取页面边距配置
/// - degree: 学位类型
#let get-page-margin(degree: "doctor") = {
  if degree == "bachelor" {
    (
      top: 3.8cm,
      bottom: 3.2cm,
      left: 3cm,
      right: 3cm,
    )
  } else {
    (
      top: 2.5cm,
      bottom: 2.5cm,
      left: 2.5cm,
      right: 2.5cm,
    )
  }
}

/// 封面页边距
#let cover-margin = (
  top: 3.2cm,
  bottom: 4.4cm,
  left: 2.5cm,
  right: 2.5cm,
)

/// 研究生英文标题页边距
#let titlepage-en-margin = (
  top: 7cm,
  bottom: 4.5cm,
  left: 2.5cm,
  right: 2.5cm,
)

/// 研究生中文提名页边距
#let titlepage-zh-margin = (
  top: 3.1cm,
  bottom: 6.5cm,
  left: 2.5cm,
  right: 2.5cm,
)

/// 本科标题页边距
#let titlepage-bachelor-margin = (
  top: 4cm,
  bottom: 6cm,
  left: 2.5cm,
  right: 2.5cm,
)

/// 版权页边距
#let copyright-margin = (
  top: 3.5cm,
  bottom: 5.7cm,
  left: 2.5cm,
  right: 2.5cm,
)
