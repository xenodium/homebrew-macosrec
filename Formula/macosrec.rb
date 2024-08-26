class Macosrec < Formula
  desc "Take screenshots or videos of macOS windows from the command line."
  homepage "https://github.com/xenodium/macosrec"
  url "https://github.com/xenodium/macosrec/archive/refs/tags/macosrec-0.8.1.tar.gz"
  sha256 "712ef670fc8e1327c95317cb2fbc12a8a1c318bf9ea40e6d2b9d696c0fe45ca4"
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
