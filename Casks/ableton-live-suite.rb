cask "ableton-live-suite" do
  arch = (MacOS.version >= :mojave) ? "universal" : "intel"
  version "11.2"

  if MacOS.version >= :mojave
    sha256 "099e845cd6be17945e210f6c9ad0a810d62bb75f2e8f81394390f3785a02c657"
  else
    sha256 "ae6f2c978009d7baa86b53d41be8a5eafda27bcb3a0bf102ebff629b4ebe091f"
  end

  url "https://cdn-downloads.ableton.com/channels/#{version}/ableton_live_suite_#{version}_#{arch}.dmg"
  name "Ableton Live Suite"
  desc "Sound and music editor"
  homepage "https://www.ableton.com/en/live/"

  livecheck do
    url "https://www.ableton.com/en/release-notes/live-#{version.major}/"
    regex(/(\d+(?:\.\d+)+)\s*Release\s*Notes/i)
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Ableton Live #{version.major} Suite.app"

  uninstall quit: "com.ableton.live"

  zap trash: [
    "/Library/Logs/DiagnosticReports/Max_*.*_resource.diag",
    "~/Library/Application Support/CrashReporter/Ableton *_*.plist",
    "~/Library/Application Support/CrashReporter/Live_*.plist",
    "~/Library/Application Support/CrashReporter/Max_*.plist",
    "~/Library/Application Support/Ableton",
    "~/Library/Application Support/Cycling '74",
    "~/Library/Caches/Ableton",
    "~/Library/Preferences/Ableton",
    "~/Library/Preferences/com.ableton.live.plist*",
    "~/Library/Preferences/com.cycling74.Max*.plist*",
    "~/Music/Ableton",
    "~/Documents/Max [0-9]",
    "/Users/Shared/Max [0-9]",
  ]
end
