cask "dynamic-notch" do
  version "1.3.4"
  sha256 "1056f2595c6b73fbae37fa4c1206f6880e0b7f4b55d4046d700a97e8952f4b88"

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
