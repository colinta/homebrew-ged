class Ged < Formula
  desc "Streaming text editor for pipelines — modern sed alternative"
  homepage "https://github.com/colinta/ged"
  version "1.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colinta/ged/releases/download/1.3.2/ged-darwin-arm64.tar.gz"
      sha256 "49cda557d88203d46ea81a48c69f3cd0861408281113cbe12e9024b0ac5e3eca"

      def install
        bin.install "ged-darwin-arm64" => "ged"
        man1.install "ged.1"
      end
    else
      url "https://github.com/colinta/ged/releases/download/1.3.2/ged-darwin-amd64.tar.gz"
      sha256 "9162715c46db8e22c903a4036f8587457e7e65019562f88a0596ae20d9a03c33"

      def install
        bin.install "ged-darwin-amd64" => "ged"
        man1.install "ged.1"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colinta/ged/releases/download/1.3.2/ged-linux-arm64.tar.gz"
      sha256 "bfe45d0bbb869edeb068de41ca31db24cc7834e9ba58ea5acf5e7d273930f912"

      def install
        bin.install "ged-linux-arm64" => "ged"
        man1.install "ged.1"
      end
    else
      url "https://github.com/colinta/ged/releases/download/1.3.2/ged-linux-amd64.tar.gz"
      sha256 "0d0ac256155c3b997311d36f8bf2080cbb9f633c6475d6e69f0cd70b04fb0dc4"

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
