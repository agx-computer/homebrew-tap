class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://api.agx.computer"
  version "0.3.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.agx.computer/cli/0.3.20/agx-darwin-arm64"
      sha256 "16470f1d7a8950d988bb9273cf231b90af10a7d3f67f84b68d271f98e40ba49a"
    else
      url "https://api.agx.computer/cli/0.3.20/agx-darwin-x64"
      sha256 "9c22af67c5d0beb7bf112a192aff9cbb04e21a3f19b4efa5fab5008f61fa79bd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://api.agx.computer/cli/0.3.20/agx-linux-x64"
      sha256 "fb66697b9aab6cdc93e63bf0a0d0f9c8f3ad3adb4b0576be2408c9f0e33e2bb5"
    else
      url "https://api.agx.computer/cli/0.3.20/agx-linux-arm64"
      sha256 "d4b2e188493b436641f346e96aec5cfe8a55c92b566c9befcbdf8ee6a825adb0"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
