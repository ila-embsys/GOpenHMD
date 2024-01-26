public int main (string[] args) {
    var version = GOpenHMD.version ();

    info(@"OpenHMD version: $version\n");

    GOpenHMD.Context ctx;
    try {
        ctx = new GOpenHMD.Context();
    } catch (GOpenHMD.Error ex) {
        warning(@"Can't create context: $(ex.message)\n");
        return -1;
    }

    info("OpenHMD context created\n");

    var devs = ctx.number_of_devices;

    info(@"Found devices: $(devs)\n");

    if (devs <= 0) return -1;

    return 0;
}
