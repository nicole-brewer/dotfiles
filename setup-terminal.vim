
git clone https://github.com/altercation/solarized.git
curl -LO https://iterm2.com/downloads/stable/latest
unzip latest
rm latest
mkdir -p /Applications/iTerm.app/
mv -f iTerm.app/* /Applications/iTerm.app/
rmdir iTerm.app
open -a iTerm
echo :Profiles > colors > Color Presets > Import... and upload solarized/iterm2-colors-solarized/Solarized Dark.itermcolors"
