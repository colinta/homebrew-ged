class Ged < Formula
  desc "Streaming text editor for pipelines — modern sed alternative"
  homepage "https://github.com/colinta/ged"
  url "https://github.com/colinta/ged/archive/refs/tags/1.0.0.tar.gz"
  sha256 "9699c77f4f26f99ed1161e80a287fe228b221488ebfb8773166f5767281c27f1"
  license "MIT"

  depends_on "go" => :build
  depends_on "node" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ged"
    system "npx", "marked-man", "README.md", "--output", "ged.1"
    man1.install "ged.1"
  end

  test do
    assert_match "hello earth",
      pipe_output("#{bin}/ged 's/world/earth/'", "hello world\n").strip
  end
end
