class Macosrec < Formula
  desc "Take screenshots or videos of macOS windows from the command line."
  homepage "https://github.com/xenodium/macosrec"
  url "https://github.com/xenodium/macosrec/archive/refs/tags/macosrec-0.4.1.tar.gz"
  sha256 "967c26426e4d40cf5f929ab631f230f64921e6d0c10dae4cc0dae1e1bf8d8b1e"
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
