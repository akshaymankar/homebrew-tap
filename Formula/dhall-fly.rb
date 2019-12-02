require 'language/haskell'

class DhallFly < Formula
  include Language::Haskell::Cabal

  desc 'Translate concourse config from Dhall to YAML'
  homepage 'https://github.com/akshaymankar/dhall-fly'
  url 'https://hackage.haskell.org/package/dhall-fly-0.2.1/dhall-fly-0.2.1.tar.gz'
  head 'https://github.com/akshaymankar/dhall-fly'
  sha256 '0d7c325449d553f59dbc5d20b28485dbd18b967ffe7fc88a4ec3dd7615acd0b7'

  depends_on 'ghc@8.6' => :build
  depends_on 'cabal-install' => :build

  def install
    install_cabal_package
  end

  bottle do
    root_url "https://dl.bintray.com/axeman/dhall-fly/"
    cellar :any_skip_relocation
    sha256 "7a04fe8668d58981080119ca3a5c337910c866c0a3612a289c99a45546763a7e" => :mojave
  end

  test do
    empty_pipeline = '[] : List https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.5.0/types/Job.dhall'
    assert_match "jobs: []\nresource_types: []\nresources: []\n", pipe_output("#{bin}/dhall-fly", empty_pipeline, 0)
  end
end
