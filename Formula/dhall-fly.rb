require 'language/haskell'

class DhallFly < Formula
  include Language::Haskell::Cabal

  desc 'Translate concourse config from Dhall to YAML'
  homepage 'https://github.com/akshaymankar/dhall-fly'
  url 'https://hackage.haskell.org/package/dhall-fly-0.1.0/dhall-fly-0.1.0.tar.gz'
  head 'https://github.com/akshaymankar/dhall-fly'
  sha256 '7e907755fd37bd69df95e549b47ff776eb59e73ef7021a19c073fccbf8654b66'

  depends_on 'ghc@8.6' => :build
  depends_on 'cabal-install' => :build

  def install
    install_cabal_package
  end

  bottle do
    root_url "https://github.com/akshaymankar/homebrew-tap/releases/download/v1/"
    cellar :any_skip_relocation
    sha256 "d9f98733f1cbbdb7a9aa64ef79d9ddc19b28c464abb48ca1dfc3ae6aa789a45d" => :mojave
  end

  test do
    empty_pipeline = '[] : List https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.2.2/types/Job.dhall'
    assert_match "jobs: []\nresource_types: []\nresources: []\n", pipe_output("#{bin}/dhall-fly", empty_pipeline, 0)
  end
end
