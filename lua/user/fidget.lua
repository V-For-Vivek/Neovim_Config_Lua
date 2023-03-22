local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
    return
end

fidget.setup {
    text = {
        spinner = "moon",
        done = "👌",
        commenced = "🏁", -- message shown when task starts
        completed = "Completed",
    }
}
