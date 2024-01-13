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
    for(var i = 0; i < 500; i++){
        context.update();
        var quat = dev.rotation_quat();
        console.debug(`x: ${quat.x}, y: ${quat.y}, z: ${quat.z}, w: ${quat.w}`);
        GOpenHMD.sleep(0.01);
    }

    return 0
}

main();
