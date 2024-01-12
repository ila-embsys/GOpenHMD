
int print_info() {
    ohmd.require_version(0, 3, 0);

    int major;
    int minor;
    int patch;
    
    ohmd.get_version(out major, out minor, out patch);
    info(@"OpenHMD version: $major.$minor.$patch");

    unowned var ctx = ohmd.ctx_create();

    int num_devices = ohmd.ctx_probe(ctx);
    if(num_devices < 0){
        warning("failed to probe devices: %s", ohmd.ctx_get_error(ctx));
        return -1;
    }
    info("num devices: %d", num_devices);

    // Print device information
    for(int i = 0; i < num_devices; i++){
        int device_class[2];
        int device_flags[2];
        const string device_class_s[] = {"HMD", "Controller", "Generic Tracker", "Unknown"};

        ohmd.list_geti(ctx, i, ohmd._int_value.DEVICE_CLASS, device_class);
        ohmd.list_geti(ctx, i, ohmd._int_value.DEVICE_CLASS, device_flags);

        info("device %d", i);
        info("  vendor:  %s", ohmd.list_gets(ctx, i, ohmd._string_value.VENDOR));
        info("  product: %s", ohmd.list_gets(ctx, i, ohmd._string_value.PRODUCT));
        info("  path:    %s", ohmd.list_gets(ctx, i, ohmd._string_value.PATH));
        info("  class:   %s", device_class_s[device_class[1] > ohmd._device_class.GENERIC_TRACKER ? 4 : device_flags[1]]);
        info("  flags:   %02x",  device_flags[1]);
        info("    null device:         %s", (device_flags[1] & ohmd._device_flags.NULL_DEVICE) > 0 ? "yes" : "no");
        info("    rotational tracking: %s", (device_flags[1] & ohmd._device_flags.ROTATIONAL_TRACKING) > 0 ? "yes" : "no");
        info("    positional tracking: %s", (device_flags[1] & ohmd._device_flags.POSITIONAL_TRACKING) > 0  ? "yes" : "no");
        info("    left controller:     %s", (device_flags[1] & ohmd._device_flags.LEFT_CONTROLLER) > 0 ? "yes" : "no");
        info("    right controller:    %s", (device_flags[1] & ohmd._device_flags.RIGHT_CONTROLLER) > 0 ? "yes" : "no");
    }

    ohmd.ctx_destroy(ctx);

    return 0;
}

public int main (string[] args) {
    return print_info();
}
    