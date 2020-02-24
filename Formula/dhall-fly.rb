require 'language/haskell'

class DhallFly < Formula
  include Language::Haskell::Cabal

  desc 'Translate concourse config from Dhall to YAML'
  homepage 'https://github.com/akshaymankar/dhall-fly'
  url 'https://hackage.haskell.org/package/dhall-fly-0.2.4/dhall-fly-0.2.4.tar.gz'
  head 'https://github.com/akshaymankar/dhall-fly'
  sha256 '9588f0e83393634b109a941479df0fc218419ffdbd17ca8515aa12cc128da82f'

  depends_on 'ghc@8.6' => :build
  depends_on 'cabal-install' => :build

  def install
    install_cabal_package
  end

  bottle do
    root_url "https://dl.bintray.com/axeman/dhall-fly/"
    cellar :any_skip_relocation
    sha256 "fa937b2868e37f893666abf86b536bb8c7094a7794580e4d3f93721f42f22a1c" => :mojave
  end

  test do
    empty_pipeline = '[] : List https://raw.githubusercontent.com/akshaymankar/dhall-concourse/0.5.0/types/Job.dhall'
    assert_match "jobs: []\nresource_types: []\nresources: []\n", pipe_output("#{bin}/dhall-fly", empty_pipeline, 0)
  end
end
