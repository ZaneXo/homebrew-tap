# homebrew-tap

[zsmeet](https://github.com/ZaneXo/zsmeet) 的 Homebrew Tap（macOS 14.4 及以上，Apple 芯片与 Intel 通用）。

## 安装

```bash
brew install --cask zanexo/tap/zsmeet
```

安装时会自动去掉下载隔离标记（`com.apple.quarantine`），装好可直接打开。

## 更新与卸载

zsmeet 支持在 App 内自动检查并安装新版本，也可以用 Homebrew 管理：

```bash
brew upgrade --cask zsmeet
brew uninstall --cask zsmeet          # 只删应用程序
brew uninstall --cask --zap zsmeet    # 连本地缓存与配置目录一起清理
```
