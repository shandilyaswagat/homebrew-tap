cask "dynamic-ledge" do
  version "1.4.0"
  sha256 "eb56ae3e18120107df1d8f716951b2f264fa372989f4b4cc642b74c36b05e24e"

  # The download keeps its first name so apps from before the rename can still update.
  url "https://github.com/shandilyaswagat/dynamic_ledge/releases/download/v#{version}/DynamicNotch.dmg"
  name "Dynamic Ledge"
  desc "Live activities for the MacBook notch"
  homepage "https://github.com/shandilyaswagat/dynamic_ledge"

  depends_on macos: :sonoma
  auto_updates true

  app "Dynamic Ledge.app"

  # The app isn't notarized yet; this skips the one-time "Open Anyway" step.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Dynamic Ledge.app"],
        writable_paths: ["Dynamic Ledge.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.rectircle.DynamicNotch"

  zap trash: [
    "~/Library/Application Support/Dynamic Ledge",
    "~/Library/Application Support/Dynamic Notch",
    "~/Library/Preferences/com.rectircle.DynamicNotch.plist",
  ]
end
