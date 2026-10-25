cask "dynamic-notch" do
  version "1.3.0"
  sha256 "3baa6f5e877ee94b9b7989de4a1d5b2ce285398fe7622d327069016e98596e74"

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
