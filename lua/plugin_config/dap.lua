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

-- Configure Delve for Go Debugging
dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = {'dap', '-l', '127.0.0.1:${port}'},
    }
}

dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    }
}

-- Configure Node.js Debugging
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {vim.fn.stdpath("data") .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
    {
        type = 'node2',
        request = 'launch',
        name = 'Launch Node.js',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        type = 'node2',
        request = 'attach',
        name = 'Attach to Process',
        processId = require('dap.utils').pick_process,
    },
}

dap.configurations.typescript = {
    {
        type = 'node2',
        request = 'launch',
        name = 'Launch TypeScript',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
        outFiles = {"${workspaceFolder}/dist/**/*.js"},
        runtimeArgs = {'-r', 'ts-node/register'},
    },
    {
        type = 'node2',
        request = 'attach',
        name = 'Attach to Process',
        processId = require('dap.utils').pick_process,
    },
}


