cask "dynamic-notch" do
  version "1.3.3"
  sha256 "e7c17d029cb9ed15e143fa90197c1b0cafaa63bd9d3896b213b93a99676bc9e2"

  url "https://github.com/shandilyaswagat/dynamic_notch/releases/download/v#{version}/DynamicNotch.dmg"
  name "Dynamic Notch"
  desc "Live activities for the MacBook notch"
  homepage "https://github.com/shandilyaswagat/dynamic_notch"

  depends_on macos: :sonoma
  auto_updates true

  app "Dynamic Notch.app"

  # The app isn't notarized yet; this skips the one-time "Open Anyway" step.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Dynamic Notch.app"],
        writable_paths: ["Dynamic Notch.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.rectircle.DynamicNotch"

  zap trash: [
    "~/Library/Application Support/Dynamic Notch",
    "~/Library/Preferences/com.rectircle.DynamicNotch.plist",
  ]
end
