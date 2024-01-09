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

    // Int values

    int hres;
    int vres;
    try {
        hres = dev.get_int(GOpenHMD.DeviceDescriptionIntValue.SCREEN_HORIZONTAL_RESOLUTION);
        vres = dev.get_int(GOpenHMD.DeviceDescriptionIntValue.SCREEN_VERTICAL_RESOLUTION);
    } catch (GOpenHMD.Error ex) {
        warning(@"Can't retrieve device parameters: $(ex.message)\n");
        return -1;
    }
    
    info(@"Display resolution: $(hres) x $(vres)");

    // Float values

    float hsize;
    float vsize;
    try {
        hsize = dev.get_float(GOpenHMD.FloatValue.SCREEN_HORIZONTAL_SIZE);
        vsize = dev.get_float(GOpenHMD.FloatValue.SCREEN_VERTICAL_SIZE);
    } catch (GOpenHMD.Error ex) {
        warning(@"Can't retrieve device parameters: $(ex.message)\n");
        return -1;
    }
    
    info(@"Display size: $(hsize) x $(vsize)");
    
    return 0;
}
