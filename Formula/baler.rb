class Baler < Formula
  include Language::Python::Shebang
  include Language::Python::Virtualenv

  desc "Machine learning based compression tool for scientific data"
  homepage "https://baler-collaboration.github.io/"
  url "https://github.com/fritjof-b/baler/archive/refs/tags/v1.4.0.tar.gz"
  version "1.4.0"
  sha256 "37e4522d00b35d9e31b0eb5995a8a8d5ddbbedcfaa7c9628ceaadd262641a2df"
  license "Apache-2.0"

  depends_on "python@3.9"

  def install
    virtualenv_create(libexec, "python3.9")
    system libexec/"bin/pip", "install", "-r", buildpath/"requirements.txt"
    system libexec/"bin/pip", "install", "-v", "--no-deps", "--no-binary", ":all", buildpath
    bin.install_symlink libexec/"bin/baler"
  end

  test do
    system "#{bin}/baler", "--help"
  end
end
