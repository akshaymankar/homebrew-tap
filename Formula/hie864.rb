class Hie864 < Formula
  desc 'The engine for haskell ide-integration. Not an IDE'
  homepage 'https://github.com/haskell/haskell-ide-engine'

  url 'https://github.com/haskell/haskell-ide-engine.git',
      revision: '0.13.0.0'

  head 'https://github.com/haskell/haskell-ide-engine.git'

  version '0.13.0.0'

  depends_on 'haskell-stack' => :build

  def install
    ghc_version = '8.6.4'
    system 'stack', 'build', '--stack-yaml', "stack-#{ghc_version}.yaml",
           '--copy-bins', '--local-bin-path', './bin'
    bin.install './bin/hie' => "hie-#{ghc_version}"
  end

  test do
    system "#{bin}/hie", '--version'
  end
end
