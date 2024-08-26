class Macosrec < Formula
  desc "Take screenshots or videos of macOS windows from the command line."
  homepage "https://github.com/xenodium/macosrec"
  url "https://github.com/xenodium/macosrec/archive/refs/tags/macosrec-0.8.1.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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
