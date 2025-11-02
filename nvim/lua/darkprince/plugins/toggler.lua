return {
  "nguyenvukhang/nvim-toggler",

  opts = {
    inverses = {
      ["true"] = "false",
      ["yes"] = "no",
      ["on"] = "off",
      ["enable"] = "disable",
      ["1"] = "0",
      ["up"] = "down",
      ["left"] = "right",
      ["public"] = "private",
      ["&&"] = "||",
      ["=="] = "!=",
    },
    remove_default_keybinds = true, -- keeps `gs` as the default toggle key
  },
}
