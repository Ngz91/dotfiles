local status_ok, colorp = pcall(require, "color-picker")
if not status_ok then
  return
end

colorp.setup()
