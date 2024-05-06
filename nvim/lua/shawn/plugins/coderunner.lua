return {
    "CRAG666/code_runner.nvim",
    event="VeryLazy",
    config = function()
        require('code_runner').setup({
            filetype = {
                bash = [[ source "$filename" ]],
                -- cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && start cmd /c \"$fileNameWithoutExt.exe && pause\"",
                cpp = [[ cd $dir && g++ "$fileName" -o "$fileNameWithoutExt" && "./$fileNameWithoutExt" ]],
                -- c = "cd $dir &&": gcc $fileName -o $fileNameWithoutExt && start cmd /c \"./$fileNameWithoutExt.exe && pause\"",
                c = [[ cd $dir && gcc "$fileName" -o "$fileNameWithoutExt" && "./$fileNameWithoutExt"]],
                rust = [[ cargo build && cargo run ]],
                python = "python $file",
                js = [[ cd $dir & node $file ]],
                go = [[ go run . ]]
            },
        })

        vim.keymap.set("n", "<leader>pr", ":w<CR>:RunCode<CR>i", {noremap = true, silent = false, desc = "run code"})
    end,
}
