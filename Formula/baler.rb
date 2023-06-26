class Baler < Formula
  include Language::Python::Virtualenv

  desc "Baler is a machine learning based compression tool for scientific data."
  homepage "https://baler-collaboration.github.io/"
  url "https://github.com/fritjof-b/baler/archive/refs/tags/brew-experimental.tar.gz"
  version "1.0"
  sha256 "23e15a70d58a8625d7b3e9a074d88a96bfe2b0054e22a17bbcffb3744b749d1b"
  license "Apache 2.0 License"

  depends_on "poetry" => :build
  depends_on "python@3.9"

  def install
    ENV["PYTHONPATH"] = libexec/"lib/python3.9/site-packages"
    system "poetry", "install", "--no-dev", "--verbose"  # Add verbose flag to get detailed output
    system "ls", "-a"
    system "poetry", "env", "info"

    if !File.exist?(".venv")
      opoo "No .venv directory found, creating a new virtual environment and installing the project."
      venv = virtualenv_create(libexec, "python3")
      system venv.pip_install_and_link buildpath
    else
      ohai "Successfully found .venv directory."
    end
  end

  test do
    system "#{bin}/baler", "--help"
  end
end
