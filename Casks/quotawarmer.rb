cask "quotawarmer" do
  version "1.0.0"
  sha256 "f2245a9460e804f450303408142ffcd41c3a0c7f15db6f207005fbcd3beb5f4b"

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
