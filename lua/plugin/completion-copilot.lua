return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = false,
      },
      panel = {
        enabled = false,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    event = { "InsertEnter", "LspAttach" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    opts = {}
  },
}
