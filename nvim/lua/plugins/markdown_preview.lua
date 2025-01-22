return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },                -- carga el plugin solo con archivos Markdown
  build = "cd app && npm install",    -- instala las dependencias necesarias
  config = function()
    vim.cmd("call mkdp#util#install()") -- ejecuta la instalación de forma explícita
  end,
}
