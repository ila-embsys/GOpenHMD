public int main (string[] args) {
    GOpenHMD.Context ctx;
    try {
        ctx = new GOpenHMD.Context ();
    } catch (GOpenHMD.Error ex) {
        warning (@"Can't create context: $(ex.message)\n");
        return -1;
    }

    var devs = ctx.enumerate ();

    info (@"Got $(devs.length) device descriptions");

    var selected_dev = 0;
    info (@"Select device: $(devs[selected_dev].vendor) $(devs[selected_dev].product)");

    GOpenHMD.Device dev;

    try {
        var settings = new GOpenHMD.DeviceSettings (ctx);
        settings.set_automatic_update (true);
        dev = ctx.open_device (selected_dev, settings);
    } catch (GOpenHMD.Error ex) {
        warning (@"Can't open device: $(ex.message)\n");
        return -1;
    }

    info ("Start pose quat requesting…");

    try {
        for (var i = 0; i < 500; i++) {
            // TODO: automatic update should works
            ctx.update ();
            GOpenHMD.Quat quat = dev.rotation_quat ();
            debug ("x: % 8f, y: % 8f, z: % 8f, w: % 8f", quat.x, quat.y, quat.z, quat.w);
            GOpenHMD.sleep (0.01);
        }
    } catch (GOpenHMD.Error ex) {
        warning (@"Can't retrieve device parameters: $(ex.message)\n");
        return -1;
    }

    return 0;
}
