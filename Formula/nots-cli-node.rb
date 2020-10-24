class NotsCliNode < Formula
  desc "node.js dependency for nots"
  homepage "https://cli.notsapps.com"
  url "https://cli-assets.heroku.com/homebrew/node-12.16.2.tar.xz"
  sha256 "3be1a9fb2715f62561912d6e824f5e8dc2d64cf7e074f6c4ac8b5c9b4a836761"

  def install
    share.install buildpath/"node"
  end

  # def test
  #   system bin/"node", "version"
  # end
end
