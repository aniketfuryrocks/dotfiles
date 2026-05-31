local telescope = require('telescope')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local builtin = require('telescope.builtin')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values

local M = {}

telescope.setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    },
    defaults = {
        wrap_results = true
    }
}

telescope.load_extension("ui-select")
telescope.load_extension("dap")

local projects_dir = vim.fn.expand("$HOME/Projects")

local function sorted_dirs(path)
    if vim.fn.isdirectory(path) == 0 then
        return {}
    end

    local names = vim.fn.readdir(path, function(name)
        return vim.fn.isdirectory(path .. "/" .. name) == 1
    end)

    table.sort(names)

    return vim.tbl_map(function(name)
        return {
            name = name,
            path = path .. "/" .. name,
        }
    end, names)
end

local function org_entries()
    local orgs = sorted_dirs(projects_dir)

    return vim.tbl_map(function(org)
        org.projects = sorted_dirs(org.path)
        return org
    end, orgs)
end

local function open_project_files(project)
    vim.cmd("cd " .. vim.fn.fnameescape(project.path))
    builtin.find_files {
        cwd = project.path,
        prompt_title = project.org .. "/" .. project.name,
    }
end

local function grep_project(project)
    vim.cmd("cd " .. vim.fn.fnameescape(project.path))
    builtin.live_grep {
        cwd = project.path,
        prompt_title = "Grep " .. project.org .. "/" .. project.name,
    }
end

local function open_project_tree(project)
    vim.cmd("cd " .. vim.fn.fnameescape(project.path))
    vim.cmd("NvimTreeOpen " .. vim.fn.fnameescape(project.path))
end

local function selected_project()
    local selection = action_state.get_selected_entry()

    if not selection then
        return nil
    end

    return selection.value
end

local function project_picker_for_org(org)
    local projects = vim.tbl_map(function(project)
        project.org = org.name
        return project
    end, org.projects)

    if #projects == 0 then
        vim.notify("No projects found in ~/Projects/" .. org.name, vim.log.levels.WARN)
        return
    end

    pickers.new({}, {
        prompt_title = org.name .. " projects (Enter files, C-g grep, C-t tree)",
        finder = finders.new_table {
            results = projects,
            entry_maker = function(project)
                return {
                    value = project,
                    display = project.name,
                    ordinal = project.name .. " " .. project.path,
                }
            end,
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                local project = selected_project()
                actions.close(prompt_bufnr)

                if project then
                    open_project_files(project)
                end
            end)

            map('i', '<C-g>', function()
                local project = selected_project()
                actions.close(prompt_bufnr)

                if project then
                    grep_project(project)
                end
            end)
            map('n', '<C-g>', function()
                local project = selected_project()
                actions.close(prompt_bufnr)

                if project then
                    grep_project(project)
                end
            end)

            map('i', '<C-t>', function()
                local project = selected_project()
                actions.close(prompt_bufnr)

                if project then
                    open_project_tree(project)
                end
            end)
            map('n', '<C-t>', function()
                local project = selected_project()
                actions.close(prompt_bufnr)

                if project then
                    open_project_tree(project)
                end
            end)

            return true
        end,
    }):find()
end

function M.project_picker()
    if vim.fn.isdirectory(projects_dir) == 0 then
        vim.notify("Projects directory not found: " .. projects_dir, vim.log.levels.WARN)
        return
    end

    local orgs = org_entries()

    if #orgs == 0 then
        vim.notify("No organizations found in ~/Projects", vim.log.levels.WARN)
        return
    end

    pickers.new({}, {
        prompt_title = "Organizations",
        finder = finders.new_table {
            results = orgs,
            entry_maker = function(org)
                return {
                    value = org,
                    display = string.format("%s (%d)", org.name, #org.projects),
                    ordinal = org.name .. " " .. org.path,
                }
            end,
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)

                if selection then
                    project_picker_for_org(selection.value)
                end
            end)

            return true
        end,
    }):find()
end

vim.api.nvim_create_user_command("ProjectPicker", M.project_picker, {})

return M
