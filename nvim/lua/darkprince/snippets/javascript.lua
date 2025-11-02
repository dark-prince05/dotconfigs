local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  -- Console log
  s("cl", fmt("console.log({})", { i(1, "msg") })),

  -- Function declaration
  s(
    "fun",
    fmt(
      [[
function {}({}) {{
  {}
}}
]],
      { i(1, "name"), i(2, "args"), i(3) }
    )
  ),

  -- Arrow function
  s(
    "afun",
    fmt(
      [[
const {} = ({}) => {{
  {}
}};
]],
      { i(1, "name"), i(2, "args"), i(3) }
    )
  ),

  -- For loop
  s(
    "for",
    fmt(
      [[
for (let {} = 0; {} < {}.length; {}++) {{
  {}
}}
]],
      { i(1, "i"), rep(1), i(2, "array"), rep(1), i(3) }
    )
  ),

  -- Require statement
  s("req", fmt("const {} = require('{}');", { i(1, "module"), i(2, "module-name") })),

  -- Module exports
  s("mod", fmt("module.exports = {};", { i(1, "object") })),

  -- Express server setup
  s(
    "exp",
    fmt(
      [[
const express = require('express');
const app = express();

app.use(express.json());

app.get('/', (req, res) => {{
  {}
}});

const PORT = {PORT};
app.listen(PORT, () => {{
  console.log(`Server running on port ${PORT}`);
}});
]],
      { i(1), PORT = i(2, "3000") }
    )
  ),

  -- Express route
  s("route", fmt("app.{}('{}', (req, res) => {{\n  {}\n}}));", { i(1, "get"), i(2, "/"), i(3) })),

  -- Async function
  s(
    "async",
    fmt(
      [[
async function {}({}) {{
  try {{
    {}
  }} catch (err) {{
    console.error(err);
  }}
}}
]],
      { i(1, "name"), i(2, "args"), i(3) }
    )
  ),

  -- Import ES6 module
  s("imp", fmt("import {} from '{}';", { i(1, "module"), i(2, "module-name") })),

  -- Require fs
  s("fs", fmt("const fs = require('fs');", {})),

  -- Express middleware
  s(
    "mid",
    fmt(
      [[
app.use((req, res, next) => {{
  {}
  next();
}});
]],
      { i(1) }
    )
  ),
}
