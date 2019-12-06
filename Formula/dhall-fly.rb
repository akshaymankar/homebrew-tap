require 'language/haskell'

class DhallFly < Formula
  include Language::Haskell::Cabal

  desc 'Translate concourse config from Dhall to YAML'
  homepage 'https://github.com/akshaymankar/dhall-fly'
  url 'https://hackage.haskell.org/package/dhall-fly-0.2.2/dhall-fly-0.2.2.tar.gz'
  head 'https://github.com/akshaymankar/dhall-fly'
  sha256 'c7d1ca9e3748cb7feecba283984988a7d51a53fb64c95c9307326c8bdea7e5de'

  depends_on 'ghc@8.6' => :build
  depends_on 'cabal-install' => :build

  def install
    install_cabal_package
  end

  bottle do
    root_url "https://dl.bintray.com/axeman/dhall-fly/"
    cellar :any_skip_relocation
    sha256 "11a0e154b60c4afcee57104f43fb89a12592a0fe8fc6237008d9402f4dd2773e" => :mojave
  end

  test do
    empty_pipeline = '[] : List https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.5.0/types/Job.dhall'
    assert_match "jobs: []\nresource_types: []\nresources: []\n", pipe_output("#{bin}/dhall-fly", empty_pipeline, 0)
  end
end
