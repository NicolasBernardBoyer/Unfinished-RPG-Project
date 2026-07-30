function ts_start_if_stopped(ts) {
    if (!time_source_get_state(ts) == time_source_state_active) {
        time_source_start(ts);
    }
}