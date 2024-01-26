#!/usr/bin/gjs

const GOpenHMD = imports.gi.GOpenHMD;

function main() {
    try {
        var context = new GOpenHMD.Context();
        context.ensure_constructed();
    } catch (e) {
        if (e instanceof GOpenHMD.Error) {
            console.error("Can't create conetxt: " + e.message);
            return;
        } else {
            throw e;
        }
    }
 
    var devs = context.enumerate();
    console.info("Got " + devs.length + " devices");
    
    for(i = 0; i < devs.length; i++){
        console.info(
              "\n{ "
            + "\n  'vendor': '" + devs[i].vendor + "',"
            + "\n  'product': '" + devs[i].product + "',"
            + "\n  'path': '" + devs[i].path + "',"
            // Commented because all of them looks uninitialized on this stage
            // + "\n  'screen_horizontal_resolution': '" + devs[i].screen_horizontal_resolution() + "',"
            // + "\n  'screen_vertical_resolution': '" + devs[i].screen_vertical_resolution() + "',"
            // + "\n  'device_class': '" + devs[i].device_class() + "',"
            // + "\n  'device_flags': '" + devs[i].device_flags() + "',"
            // + "\n  'control_count': '" + devs[i].control_count() + "',"
            // + "\n  'control_hints': '" + devs[i].control_hints() + "',"
            // + "\n  'control_types': '" + devs[i].control_types() + "',"
            + "\n}"
        );
    }
}

main();
