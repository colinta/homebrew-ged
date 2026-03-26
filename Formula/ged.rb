class Ged < Formula
  desc "Streaming text editor for pipelines — modern sed alternative"
  homepage "https://github.com/colinta/ged"
  version "1.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colinta/ged/releases/download/1.4.2/ged-darwin-arm64.tar.gz"
      sha256 "f214862ad323878347281d136c5328c56e2d1b2edd4fd377877d917704f808b1"

      def install
        bin.install "ged-darwin-arm64" => "ged"
        man1.install "ged.1"
      end
    else
      url "https://github.com/colinta/ged/releases/download/1.4.2/ged-darwin-amd64.tar.gz"
      sha256 "ec18814c2fcbee24174440ac9b3814e413e8c7147045af950fe55cbd3b6715f3"

      def install
        bin.install "ged-darwin-amd64" => "ged"
        man1.install "ged.1"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colinta/ged/releases/download/1.4.2/ged-linux-arm64.tar.gz"
      sha256 "5e38d627b80bbc150a55c8910a66570f0cb58ac8f2b110f276c486128deba667"

      def install
        bin.install "ged-linux-arm64" => "ged"
        man1.install "ged.1"
      end
    else
      url "https://github.com/colinta/ged/releases/download/1.4.2/ged-linux-amd64.tar.gz"
      sha256 "5ee6f01596baff4a5c4115176358d8d5be0718772aa226e8651426c0b8b56c70"

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
