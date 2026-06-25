cask "appear" do
  version "1.0.0"
  sha256 "918ee2fd61fdbd74e66246f5a38228ee822cc15666b8fa48e861d3df03f851f4"

  url "https://github.com/JackUait/appear/releases/download/v#{version}/Appear.zip"
  name "Appear"
  desc "Summon any app with a keyboard shortcut or multi-key chord"
  homepage "https://github.com/JackUait/appear"

  depends_on macos: ">= :sequoia"

  app "Appear.app"

  # Appear isn't notarized yet, so clear the download quarantine after install
  # — the app then launches without a Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Appear.app"]
  end

  uninstall quit: "io.dodobrands.appear"

  zap trash: "~/Library/Preferences/io.dodobrands.appear.plist"
end
