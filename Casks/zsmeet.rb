cask "zsmeet" do
  version "0.1.0"
  sha256 "67abce4126ffa71d770a9a8c4ba33bd5d71439dd58d0ca5b380197dd3a7a3f59"

  url "https://github.com/ZaneXo/zsmeet/releases/download/desktop-v#{version}/zsmeet-desktop-#{version}-macos-universal.dmg"
  name "zsmeet"
  desc "Self-hosted meeting transcription and minutes desktop client"
  homepage "https://github.com/ZaneXo/zsmeet"

  livecheck do
    url "https://github.com/ZaneXo/zsmeet/releases/download/desktop-latest/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "zsmeet.app"

  if respond_to?(:postflight_steps)
    postflight_steps do
      run "xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/zsmeet.app"]
    end
  else
    postflight do
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/zsmeet.app"]
    end
  end

  uninstall quit: "io.github.zanexo.zsmeet"

  zap trash: [
    "~/Library/Application Support/io.github.zanexo.zsmeet",
    "~/Library/Caches/io.github.zanexo.zsmeet",
    "~/Library/Preferences/io.github.zanexo.zsmeet.plist",
    "~/Library/Saved Application State/io.github.zanexo.zsmeet.savedState",
    "~/Library/WebKit/io.github.zanexo.zsmeet",
  ]
end
