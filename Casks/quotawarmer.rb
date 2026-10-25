cask "quotawarmer" do
  version "1.4.1"
  sha256 "1acec84fc2fb9cb602f37e412aebba071597f12993395ecc5a122487e8264dac"

  url "https://github.com/bcanozgur/quota-warmer/releases/download/v#{version}/QuotaWarmer-#{version}-universal.dmg"
  name "QuotaWarmer"
  desc "Menu bar app that warms up Claude Code and Codex CLI quota windows"
  homepage "https://github.com/bcanozgur/quota-warmer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "QuotaWarmer.app"

  zap trash: [
    "~/Library/Application Support/QuotaWarmer",
    "~/Library/Caches/com.quotawarmer.app",
    "~/Library/Preferences/com.quotawarmer.app.plist",
  ]

  # This build is ad-hoc signed but not Apple-notarized, so macOS quarantines it.
  caveats <<~EOS
    QuotaWarmer is not notarized by Apple. After installing, clear the
    Gatekeeper quarantine once so the app can launch:

      xattr -dr com.apple.quarantine "#{appdir}/QuotaWarmer.app"

    Or right-click QuotaWarmer.app in Applications and choose Open the first time.
  EOS
end
