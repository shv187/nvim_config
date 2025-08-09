return {
    enabled = false,
    'sphamba/smear-cursor.nvim',
    opts = {
        stiffness = 0.95, -- 0.6      [0, 1]
        trailing_stiffness = 0.66, -- 0.3      [0, 1]
        distance_stop_animating = 0.1, -- 0.1      > 0
        time_interval = 7,
        smear_between_buffers = false,
    },
}
