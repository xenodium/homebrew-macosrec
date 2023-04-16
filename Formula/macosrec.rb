class Macosrec < Formula
  desc "Take screenshots or videos of macOS windows from the command line."
  homepage "https://github.com/xenodium/macosrec"
  license "GPL-3.0-or-later"
  head "https://github.com/xenodium/macosrec.git"

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
