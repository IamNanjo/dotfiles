if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "danymat/neogen",
        config = true,
        cmd = "Neogen",
    },
}
