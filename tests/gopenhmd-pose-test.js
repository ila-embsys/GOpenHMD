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

    console.info(`Start pose quat requesting...`);
    const FloatReq = GOpenHMD.FloatValue;
    for(var i = 0; i < 1000; i++){
        var quat = dev.get_float(FloatReq.ROTATION_QUAT);
        console.info(quat);
    }

    return 0
}

main();
