class Ged < Formula
  desc "Streaming text editor for pipelines — modern sed alternative"
  homepage "https://github.com/colinta/ged"
  version "1.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colinta/ged/releases/download/1.5.2/ged-darwin-arm64.tar.gz"
      sha256 "6ba695695a93f08898fbe376abb11d8ccd718c3abce1ffaf8f09ad96b6ce587a"

      def install
        bin.install "ged-darwin-arm64" => "ged"
        man1.install "ged.1"
      end
    else
      url "https://github.com/colinta/ged/releases/download/1.5.2/ged-darwin-amd64.tar.gz"
      sha256 "059803c21baa3aba27f68172284284df22e4d5e29766dac46fb20af72bfd36a9"

      def install
        bin.install "ged-darwin-amd64" => "ged"
        man1.install "ged.1"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colinta/ged/releases/download/1.5.2/ged-linux-arm64.tar.gz"
      sha256 "d06e6c3c3d45fc866a1d774acc0c726e9013d64b7acd655894319b21bde75d37"

      def install
        bin.install "ged-linux-arm64" => "ged"
        man1.install "ged.1"
      end
    else
      url "https://github.com/colinta/ged/releases/download/1.5.2/ged-linux-amd64.tar.gz"
      sha256 "09a7bf76650009a7f88c0fbd742744d8036d0b4a40f0f74bd3cdafc43f45db67"

      def install
        bin.install "ged-linux-amd64" => "ged"
        man1.install "ged.1"
      end
    end
  end

  test do
    assert_match "hello earth",
      pipe_output("#{bin}/ged 's/world/earth/'", "hello world
").strip
  end
end
