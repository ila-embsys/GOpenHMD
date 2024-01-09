public int main (string[] args) {
    GOpenHMD.Context ctx;
    try {
        ctx = new GOpenHMD.Context();
    } catch (GOpenHMD.Error ex) {
        warning(@"Can't create context: $(ex.message)\n");
        return -1;
    }

    var devs = ctx.enumerate();

    info(@"Got $(devs.length) device descriptions");

    var selected_dev = 0;
    info(@"Select device: $(devs[selected_dev].vendor) $(devs[selected_dev].product)");

    GOpenHMD.Device dev;
    try {
        dev = ctx.open_device(selected_dev);
    } catch (GOpenHMD.Error ex) {
        warning(@"Can't open device: $(ex.message)\n");
        return -1;
    }

    info ("Start pose quat requesting...");

    float quat;
    try {
        quat = dev.get_float(GOpenHMD.FloatValue.ROTATION_QUAT);
    } catch (GOpenHMD.Error ex) {
        warning(@"Can't retrieve device parameters: $(ex.message)\n");
        return -1;
    }
    
    info(@"$(quat)");
    
    return 0;
}
