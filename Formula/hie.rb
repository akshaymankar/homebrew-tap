class Hie < Formula
  desc 'The engine for haskell ide-integration. Not an IDE'
  homepage 'https://github.com/haskell/haskell-ide-engine'

  url 'https://github.com/haskell/haskell-ide-engine.git',
      revision: '0.13.0.0'

  head 'https://github.com/haskell/haskell-ide-engine.git'

  version '0.13.0.0'

  depends_on 'haskell-stack' => :build

  def install
    system 'stack', 'build', '--copy-bins', '--local-bin-path', './bin'
    bin.install Dir['./bin/*']
  end

  test do
    system "#{bin}/hie", '--version'
  end
end
