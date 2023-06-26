local state, presence = pcall(require, "presence")
if not state then
    return
end

presence.setup({
    -- client_id = "1112514201513099405",
    main_image = "file",
    idle_timeout = 60 * 5,
    repository_text = "‫",
})
