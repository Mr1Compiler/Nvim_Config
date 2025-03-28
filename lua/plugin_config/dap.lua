local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Configure GDB for C Debugging
dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = {'-i', 'dap'}
}

dap.configurations.c = {
  {
    name = "Launch C Program",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'Enable GDB pretty printing',
        ignoreFailures = false
      },
    },
  },
}

-- Existing configuration for .NET debugging
dap.adapters.coreclr = {
    type = 'executable',
    command = '/home/mr1compiler/.local/share/debuggers/netcoredbg/netcoredbg', -- Update if needed
    args = { '--interpreter=vscode' },
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "Launch .NET 8 App",
        request = "launch",
        program = function()
            return vim.fn.input('Path to DLL: ', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
        end,
    },
}


