local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- EJS If condition
  s("if", {
    t("<% if ("),
    i(1, "condition"),
    t({ ") { %>", "  " }),
    i(2, " "),
    t({ "", "<% } %>" }),
  }),

  -- EJS for loop
  s("for", {
    t("<% for (let "),
    i(1, "i"),
    t(" = 0; "),
    i(2, "i < .length"),
    t("; "),
    i(3, "i++"),
    t({ ") { %>", "  " }),
    i(4, " "),
    t({ "", "<% } %>" }),
  }),

  -- EJS variable
  s("%", {
    t("<%= "),
    i(1, "variable"),
    t(" %>"),
  }),

  -- EJS foreach loop
  s("foreach", {
    t("<% "),
    i(1, "array"),
    t(".forEach(("),
    i(2, "item"),
    t(") => { %>"),
    t({ "", "  " }),
    i(3, " "),
    t({ "", "<% }) %>" }),
  }),
}
