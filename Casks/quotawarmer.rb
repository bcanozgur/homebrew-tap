cask "quotawarmer" do
  version "1.2.0"
  sha256 "ea17cac260bd1c7d368c93cfa8abea1c51234f456f5b4b4cb63a5d2e36a565d1"

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
