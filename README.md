# Eopkg commands enhanced with fzf

Use the excellent [fzf](https://github.com/junegunn/fzf) to interactively install and uninstall [eopkg](https://getsol.us/articles/package-management/basics/en/) packages.

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

By default `fzf-eopkg` will cache available packages for faster `pit` search.
You can disable caching by adding `export FE_CACHE=false` in your `.zshrc`

Alternatively you can specify the path in which `fzf-eopkg` will use to save the
cache file by adding `export FE_CACHE_PATH=path/to/cache/file.txt` to your
`.zshrc`

Similarly, you can change how frequently `fzf-eopkg` should update cache file
with the `FE_CACHE_INTERVAL` environment variable (default is 129600 seconds =
15 days)

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
