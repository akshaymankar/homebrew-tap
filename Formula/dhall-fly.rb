require 'language/haskell'

class DhallFly < Formula
  include Language::Haskell::Cabal

  desc 'Translate concourse config from Dhall to YAML'
  homepage 'https://github.com/akshaymankar/dhall-fly'
  url 'https://hackage.haskell.org/package/dhall-fly-0.3.0/dhall-fly-0.3.0.tar.gz'
  head 'https://github.com/akshaymankar/dhall-fly'
  sha256 '96e285dfea7a48736d8fad323e32fb6d66b1b895a6d96fa85ed071f482152504'
  revision 1

  depends_on 'ghc@8.6' => :build
  depends_on 'cabal-install' => :build

  def install
    system Formula["cabal-install"].bin/"cabal", "v2-update"
    system Formula["cabal-install"].bin/"cabal", "v2-install", *std_cabal_v2_args
  end

  bottle do
    root_url "https://dl.bintray.com/axeman/dhall-fly/"
    cellar :any_skip_relocation
    sha256 "6c122e58d61d3e6a2757cbebb55c82f3c0b839b2d301c688925eafd01d4d22f5" => :mojave
  end

  test do
    empty_pipeline = '[] : List https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.5.0/types/Job.dhall'
    assert_match "jobs: []\nresource_types: []\nresources: []\n", pipe_output("#{bin}/dhall-fly", empty_pipeline, 0)
  end
end
