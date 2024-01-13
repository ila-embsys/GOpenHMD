#!/usr/bin/gjs

const GOpenHMD = imports.gi.GOpenHMD;

function main() {
    try {
        var context = new GOpenHMD.Context();
        context.ensure_constructed();
    } catch (e) {
        if (e instanceof GOpenHMD.Error) {
            console.error("Can't create conetxt: " + e.message);
            return -1;
        } else {
            throw e;
        }
    }
 
    var devs = context.enumerate();
    console.info("Got " + devs.length + " devices");

    try {
        var dev = context.open_device(0, null);
    } catch (e) {
        if (e instanceof GOpenHMD.Error) {
            console.error("Can't open device: " + e.message);
            return -1;
        } else {
            throw e;
        }
    }

    // Int values

    console.info(`Display resolution: ${dev.screen_horizontal_resolution()} x ${dev.screen_vertical_resolution()}`);

    // Float values
    console.info(`Display size: ${dev.screen_horizontal_size()} x ${dev.screen_vertical_size()}`);

    return 0
}

main();
