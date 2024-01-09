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

    const IntReq = GOpenHMD.DeviceDescriptionIntValue;

    console.debug(`Available inr types for asking: \n ${JSON.stringify(IntReq, null, 3)}`);

    console.debug(`Tryig to ask type=${IntReq.SCREEN_HORIZONTAL_RESOLUTION}`);
    var hres = dev.get_int(IntReq.SCREEN_HORIZONTAL_RESOLUTION);
    console.debug(`Trying to ask type=${IntReq.SCREEN_VERTICAL_RESOLUTION}`);
    var vres = dev.get_int(IntReq.SCREEN_VERTICAL_RESOLUTION);

    console.info(`Display resolution: ${hres} x ${vres}`);

    // Float values

    const FloatReq = GOpenHMD.FloatValue;

    console.debug(`Available float types for asking: \n ${JSON.stringify(FloatReq, null, 3)}`);

    console.debug(`Tryig to ask type=${FloatReq.SCREEN_HORIZONTAL_SIZE}`);
    var hsize = dev.get_float(FloatReq.SCREEN_HORIZONTAL_SIZE);
    console.debug(`Trying to ask type=${FloatReq.SCREEN_VERTICAL_SIZE}`);
    var vsize = dev.get_float(FloatReq.SCREEN_VERTICAL_SIZE);

    console.info(`Display sizes: ${hsize} x ${vsize}`);

    return 0
}

main();
