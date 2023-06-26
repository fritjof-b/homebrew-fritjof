class Baler < Formula
  include Language::Python::Shebang
  include Language::Python::Virtualenv

  desc "Machine learning based compression tool for scientific data"
  homepage "https://baler-collaboration.github.io/"
  url "https://github.com/fritjof-b/baler/archive/refs/tags/brew-experimental.tar.gz"
  version "1.0"
  sha256 "23e15a70d58a8625d7b3e9a074d88a96bfe2b0054e22a17bbcffb3744b749d1b"
  license "Apache-2.0"

#   depends_on "poetry" => :build
  depends_on "python@3.9"

  def install
    rewrite_shebang detected_python_shebang, "baler"
    bin.install "baler"
  end

  test do
    system "#{bin}/baler", "--help"
  end
end
