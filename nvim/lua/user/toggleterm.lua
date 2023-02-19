local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

function _DJANGO_STARTPROJECT()
  local project_name = vim.fn.input("Project Name: ")
  local formated_project = string.format("django-admin startproject %s", project_name)
  local django_startproject = Terminal:new({ cmd = formated_project, hidden = true })
  django_startproject:toggle()
end

function _DJANGO_CREATEAPP()
  local app_name = vim.fn.input("App Name: ")
  local django_createapp = Terminal:new({ cmd = string.format("cd * && python3 manage.py createapp %s", app_name), hidden = true })
  django_createapp:toggle()
end

local django_shell = Terminal:new({ cmd = "cd * && python3 manage.py shell", hidden = true, direction = "vertical" })
local django_db_shell = Terminal:new({ cmd = "cd * && python3 manage.py dbshell", hidden = true, direction = "vertical" })
local django_makemigrations = Terminal:new({ cmd = "cd * && python3 manage.py makemigrations", hidden = true })
local django_migrate = Terminal:new({ cmd = "cd * && python3 manage.py migrate", hidden = true })
local django_flush = Terminal:new({ cmd = "cd * && python3 manage.py flush", hidden = true })
local django_runserver = Terminal:new({ cmd = "cd * && python3 manage.py runserver", hidden = true, direction = "vertical" })

function _DJANGO_MAKEMIGRATIONS()
  django_makemigrations:toggle()
end

function _DJANGO_MIGRATE()
  django_migrate:toggle()
end

function _DJANGO_SHELL()
  django_shell:toggle()
end

function _DJANGO_DB_SHELL()
  django_db_shell:toggle()
end

function _DJANGO_FLUSH()
  django_flush:toggle()
end

function _DJANGO_RUNSERVER()
  django_runserver:toggle()
end

local pytest = Terminal:new({ cmd = "pytest", hidden = true, close_on_exit = false })
local pytest_report = Terminal:new({ cmd="pytest -rP", hidden=true, close_on_exit=false })

function _PYTEST_TOGGLE()
  pytest:toggle()
end

function _PYTEST_REPORT_TOGGLE()
  pytest_report:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
  node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
  ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
  python:toggle()
end
