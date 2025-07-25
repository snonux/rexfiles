
require("CopilotChat").setup {
  -- See Configuration section for options
}

local timer = vim.loop.new_timer() -- Initialize the timer

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "copilot-chat" then
            local copilot_chat_buf = vim.api.nvim_get_current_buf()
            vim.cmd("wincmd _") -- Maximize height
            vim.cmd("wincmd |") -- Maximize width
            local file_path = vim.fn.expand("~/.copilot_chat_output.txt")

            -- Start the timer with a 2-second interval
            timer:start(1000, 1000, vim.schedule_wrap(function()
                if copilot_chat_buf and vim.api.nvim_buf_is_valid(copilot_chat_buf) then
                    -- Get all lines in the buffer
                    local lines = vim.api.nvim_buf_get_lines(copilot_chat_buf, 0, -1, false)
                    
                    -- Check for the stopping condition
                    local user_line_count = 0
                    for _, line in ipairs(lines) do
                        if line:find("^## User") then
                            user_line_count = user_line_count + 1
                            if user_line_count >= 2 then
                                print("Stopping write process: Two '## User' lines detected.")
                                timer:stop()
                                -- Write the buffer content to the file
                                vim.api.nvim_buf_call(copilot_chat_buf, function()
                                    vim.cmd("write! " .. file_path)
                                end)
                                vim.cmd("qa!")
                                return
                            end
                        end
                    end
                    
                    -- Write the buffer content to the file
                    vim.api.nvim_buf_call(copilot_chat_buf, function()
                        vim.cmd("write! " .. file_path)
                    end)
                end
            end))
        end
    end,
})

vim.api.nvim_create_user_command('CopilotAsk', function(args)
    local chat = require("CopilotChat")
    local input
    if args.args and args.args ~= "" then
        input = args.args
    else
        local input_file = os.getenv("HOME") .. "/.copilot_chat_input.txt"
        local file = io.open(input_file, "r")
        if file then
            input = file:read("*all")
            file:close()
        else
            print("Error: Unable to open input file.")
            return
        end
    end
    chat.ask(input)
end, { force = true, range = true, nargs = "?" })


