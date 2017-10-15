#!/usr/bin/env sh

# From latex3
# https://github.com/latex3/latex3/blob/master/support/texlive.sh

# This script is used for testing using Travis
# It is intended to work on their VM set up: Ubuntu 12.04 LTS
# A minimal current TL is installed adding only the packages that are
# required

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget https://mirrors.rit.edu/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl                                \
    --profile     ../support/texlive.profile  \
    --repository  https://mirrors.rit.edu/CTAN/systems/texlive/tlnet
  cd ..
fi

# Change default package repository
tlmgr option repository https://mirrors.rit.edu/CTAN/systems/texlive/tlnet

# Packages
tlmgr install         \
  adobemapping        \
  amsfonts            \
  amsmath             \
  arphic-ttf          \
  babel-japanese      \
  baekmuk             \
  caption             \
  cm                  \
  ctablestack         \
  ctex                \
  currfile            \
  environ             \
  etex                \
  etoolbox            \
  fancyhdr            \
  fandol              \
  filehook            \
  fontspec            \
  footmisc            \
  geometry            \
  graphics            \
  graphics-cfg        \
  graphics-def        \
  hyperref            \
  ifluatex            \
  ifpdf               \
  ifxetex             \
  ipaex               \
  japanese-otf        \
  kantlipsum          \
  knuth-lib           \
  l3build             \
  l3experimental      \
  l3kernel            \
  l3packages          \
  latex-bin           \
  libertinus          \
  lm                  \
  lm-math             \
  lualatex-math       \
  lualibs             \
  luaotfload          \
  luatex              \
  luatex85            \
  luatexbase          \
  luatexja            \
  metafont            \
  mfware              \
  ms                  \
  ntheorem            \
  oberdiek            \
  pgf                 \
  pifont              \
  platex              \
  platex-tools        \
  preview             \
  psnfss              \
  ptex                \
  ptex-base           \
  ptex-fontmaps       \
  siunitx             \
  standalone          \
  tex                 \
  tex-gyre            \
  tex-gyre-math       \
  tex-ini-files       \
  tools               \
  trimspaces          \
  ucharcat            \
  ulem                \
  unicode-data        \
  unicode-math        \
  uplatex             \
  uptex               \
  uptex-base          \
  url                 \
  varwidth            \
  xcolor              \
  xecjk               \
  xetex               \
  xits                \
  xkeyval             \
  xunicode            \
  zapfding            \
  zhlipsum            \
  zhnumber

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install
