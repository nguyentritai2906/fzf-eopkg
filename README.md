# Eopkg commands enhanced with fzf

Use the excellent [fzf](https://github.com/junegunn/fzf) to interactively install and uninstall [Eopkg](https://getsol.us/articles/package-management/basics/en/) packages.

## Usage

The following aliases are defined:

* `pit`: Fuzzy search and install package
* `prm`: Fuzzy search and remove package
* `pli`: Fuzzy search installed package
* `pca`: Cache available packages for faster search

You can specify a search parameter, e.g., `pit git` will start your search with `git`.

## Additional functionality

Select/unselect multiple using `tab` and `shift-tab` by default.

Previews will show `eopkg info` for the selected package.

## Getting started

### Install pre-requisites

Install fzf with `sudo eopkg install fzf`

### Install this plugin

#### `ohmyzsh`

1. `cd ~/.oh-my-zsh/custom/plugins`
2. `git clone git@github.com:nguyentritai2906/fzf-eopkg.git fzf-eopkg`
3. Add `fzf-eopkg` to your `.zshrc` plugin list `plugins=(... fzf-eopkg)`

#### `zgen` or `zgenom`

Add `zgenom load nguyentritai2906/fzf-eopkg` or `zgenom load nguyentritai2906/fzf-eopkg` to your `.zshrc`

#### `antigen`

Add `antigen bundle nguyentritai2906/fzf-eopkg` to your `.zshrc`
