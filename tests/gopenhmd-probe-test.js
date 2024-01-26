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

    print("Devices: " + context.number_of_devices);
}

main();
