requirements: pyright (python LSP)
To install:
Arch - yay -S pyright
Debian - sudo apt install nodejs npm >> then - sudo npm install -g pyright
Check if it was properly installed: pyright --version


-- transparency on themes:

require("catppuccin").setup({
    transparent_background = true,  -- 💪 Ativa a transparência
    integrations = {
        nvimtree = true,
        telescope = true,
        which_key = true,
    }
})

vim.cmd.colorscheme "catppuccin"


-- in the kitty terminal we have a similar config to enable transparency.
Open the kitty terminal and type: kitty kitten themes >> choose a theme.
it will generate a theme.conf in the folder .config/kitten.
then, write the following line: background_opacity 0.8 -- values in between 0 (full transparent) and 1 (opacity)
