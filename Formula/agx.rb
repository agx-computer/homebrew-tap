class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://api.agx.computer"
  version "0.3.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.agx.computer/cli/0.3.21/agx-darwin-arm64"
      sha256 "3ae478826fb682b79b0f1d7defb64154f47382ec0160308f0d15f89337ec194a"
    else
      url "https://api.agx.computer/cli/0.3.21/agx-darwin-x64"
      sha256 "f203e1d72f6d0370dba28a45e43ccb1e9d9ef2021b958a0e603d11671d5ac812"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://api.agx.computer/cli/0.3.21/agx-linux-x64"
      sha256 "a8be323866ec2c5c2561b9af72c8266c3258266fd507db38ea33b97c0ec704a6"
    else
      url "https://api.agx.computer/cli/0.3.21/agx-linux-arm64"
      sha256 "2f75b783ce085cb30e2187c42d530cb0f3c43c86ca866492d0d90050a3409696"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
