#!/usr/bin/gjs

const GOpenHMD = imports.gi.GOpenHMD;

function main() {
    version = GOpenHMD.version();
    print("OpenHMD version: " + version.to_string());
    
    try {
        var context = new GOpenHMD.Context();
        context.ensure_constructed();
    } catch (e) {
        if (e instanceof GOpenHMD.Error) {
            print("Can't create conetxt: " + e.message);
            return;
        } else {
            throw e;
        }
    }
    print("OpenHMD context created");

    var ndevs = context.number_of_devices;
    print("Devices: " + ndevs);

    devs = []
    for(var i = 0; i < ndevs; i++){
        var vendor = context.list_gets(i, GOpenHMD.DeviceDescriptionStringValue.VENDOR);
        var product = context.list_gets(i, GOpenHMD.DeviceDescriptionStringValue.PRODUCT);
        var path = context.list_gets(i, GOpenHMD.DeviceDescriptionStringValue.PATH);

        devs[i] = {vendor, product, path};
    }
    print(JSON.stringify(devs, null, 3));
}

main();
