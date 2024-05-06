return    {
    'barrett-ruth/live-server.nvim',
    lazy=true,
    build = 'pnpm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = true
}

