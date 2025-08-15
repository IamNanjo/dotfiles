if vim.g.vscode then
    return {}
end

return {
    {
        "3rd/image.nvim",
        build = false,
        opts = {
            processor = "magick_cli",
            backend = "kitty",
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = true,
                    download_remote_images = true,
                    only_render_image_at_cursor = false,
                    filetypes = { "markdown", "vimwiki" },
                },
            },
            max_width = nil,
            max_height = nil,
            max_width_window_percentage = nil,
            max_height_window_percentage = 25,
            kitty_method = "normal",
        },
    },
}
