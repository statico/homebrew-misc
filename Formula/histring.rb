class Histring < Formula
  desc "Generic command-line tool to highlight arbitrary strings"
  homepage "https://github.com/suntong/histring"
  url "https://github.com/suntong/histring/archive/1.1.1-1.tar.gz"
  version "1.1.1-1"
  sha256 "ab210696745b3d8a02efca36351bc4159c1687c2fb9c45b73df80bbac7fd51a4"
  head "https://github.com/suntong/histring.git"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
    if build.head?
      man1.install "histring.1"
    else
      man1.install "debian/histring.1"
    end
  end

  test do
    output = shell_output("script -q /dev/null #{bin}/histring --version")
    assert_match "$Id: histring.c,v", output
  end
end
