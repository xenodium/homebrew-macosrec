class Macosrec < Formula
  desc "Take screenshots or videos of macOS windows from the command line."
  homepage "https://github.com/xenodium/macosrec"
  url "https://github.com/xenodium/macosrec/archive/refs/tags/macosrec-0.2.1.tar.gz"
  sha256 "24462ba437e6869d8ccfab27e9373668389ed09e673a96afff217389122b10dc"
  license "GPL-3.0-or-later"

  depends_on :macos
  depends_on xcode: ["14.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/macosrec"
  end

  test do
    system "#{bin}/macosrec", "--help"
  end
end
