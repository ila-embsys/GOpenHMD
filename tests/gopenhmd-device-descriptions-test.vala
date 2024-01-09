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

    foreach (var dev in devs) {
        info(@"vendor: $(dev.vendor), product: $(dev.product), path: $(dev.path)");
    }

    return 0;
}
