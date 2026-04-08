local ok, ls = pcall(require, 'luasnip')

if not ok then
  return
end

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local extras = require 'luasnip.extras'
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt

local return_filename = function()
  -- Get the filename without the path
  local filename = vim.fn.fnamemodify(vim.fn.expand('%'), ':t')
  -- Remove the extension
  local name = filename:match("(.+)%..+$") or filename
  -- Convert to PascalCase
  local pascal = name:gsub("[^%w]+(%w)", function(c)
    return c:upper()
  end)
  pascal = pascal:gsub("^%l", string.upper) -- capitalize first letter
  return pascal
end

local function php_method(type)
  return fmt(
    [[
        {} function {}({}): {}
        {{
        {}{}
        }}
    ]],
    {
      t(type),
      i(1, 'name'),
      i(2),
      i(3, 'type'),
      t '\t',
      i(0),
    }
  )
end

local function php_field(type)
  return fmt([[{} {} {};]], { t(type), i(1, 'string'), i(2, 'name') })
end

local function react_component()
  return fmt(
    [[
interface Props {{
  children: React.ReactNode;
  className?: string;
}}

const {} = ({{children, className}}: Props) => {{
	return (
		<div className={{className}}>{{children}}</div>
	)
}}

export default {};
]],
    { f(return_filename, {}), f(return_filename, {}) }
  )
end

ls.add_snippets('php', {
  snippet('public_method', php_method 'public'),
  snippet('private_method', php_method 'private'),
  snippet('private_static_method', php_method 'private static'),
  snippet('public_static_method', php_method 'public static'),
  snippet('protected_method', php_method 'protected'),

  snippet('public_field', php_field 'public'),
  snippet('private_field', php_field 'private'),
  snippet('protected_field', php_field 'protected'),
})

ls.add_snippets('typescriptreact', {
  snippet('rc', react_component()),
})
