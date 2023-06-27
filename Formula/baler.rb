class Baler < Formula
  include Language::Python::Shebang
  include Language::Python::Virtualenv

  desc "Machine learning based compression tool for scientific data"
  homepage "https://baler-collaboration.github.io/"
  url "https://github.com/fritjof-b/baler/archive/refs/tags/v1.tar.gz"
  version "1.0"
  sha256 "06a6b577e3f8ac48815993af9434e98ed36b4ba7994c2f9a913d6d0c487c6e0d"
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
