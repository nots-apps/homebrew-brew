class NotsCli < Formula
  desc "Everything you need to get started with Nots"
  homepage "https://cli.notsapps.com"
  url "https://nots-cli.s3.eu-central-1.amazonaws.com/nots-v0.0.1-stable/nots-v0.0.1-stable.tar.gz"
  sha256 "d57cc6a54ede8843a491b98817074d8a53e67626f09f16d6b0714aafdbac6ec3"
  depends_on "nots-apps/brew/nots-cli-node"

  def install
    inreplace "bin/nots", /^CLIENT_HOME=/, "export NOTS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/nots", "\"$DIR/node\"", "#{Formula["nots-node-cli"].opt_share}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/nots"

    bash_completion.install "#{libexec}/node_modules/@oclif/plugin-autocomplete/autocomplete/brew/bash"
    zsh_completion.install "#{libexec}/node_modules/@oclif/plugin-autocomplete/autocomplete/brew/zsh/_nots"
  end

  def caveats; <<~EOS
    To use the Nots CLI's autocomplete --
      Via homebrew's shell completion:
        1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
            NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
                  and called, either explicitly or via a framework like oh-my-zsh.
        2) Then run
          $ noys autocomplete --refresh-cache

      OR

      Use our standalone setup:
        1) Run and follow the install steps:
          $ nots autocomplete
  EOS
  end

  test do
    system bin/"nots", "version"
  end
end
