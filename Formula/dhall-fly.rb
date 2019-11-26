require 'language/haskell'

class DhallFly < Formula
  include Language::Haskell::Cabal

  desc 'Translate concourse config from Dhall to YAML'
  homepage 'https://github.com/akshaymankar/dhall-fly'
  url 'https://hackage.haskell.org/package/dhall-fly-0.2.0/dhall-fly-0.2.0.tar.gz'
  head 'https://github.com/akshaymankar/dhall-fly'
  sha256 'adfc5f31b25be7a7a37dd053a0f284b14426e2e2af35567265259beb5924c840'

  depends_on 'ghc@8.6' => :build
  depends_on 'cabal-install' => :build

  def install
    install_cabal_package
  end

  bottle do
    root_url "https://dl.bintray.com/axeman/dhall-fly/"
    cellar :any_skip_relocation
    sha256 "dbc6b67e8784cc6f43aa0119ad8b1dbe6e0459b556b7dea730947499222186dc" => :mojave
  end

  test do
    empty_pipeline = '[] : List https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.5.0/types/Job.dhall'
    assert_match "jobs: []\nresource_types: []\nresources: []\n", pipe_output("#{bin}/dhall-fly", empty_pipeline, 0)
  end
end
