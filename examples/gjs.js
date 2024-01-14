#!/usr/bin/env gjs

const GOpenHMD = imports.gi.GOpenHMD;


function devs_info(context) {
    devs = context.enumerate()

    for (var i = 0; i < devs.length; i++) {
        print("Discovered device:" +
            ` vendor: '${devs[i].vendor}'` +
            ` product': '${devs[i].product}'`)
    }
}


function dev_quat_info(context, dev) {
    context.update();
    var quat = dev.rotation_quat();
    console.debug(`quat: x=${quat.x}, y=${quat.y}, z=${quat.z}, w=${quat.w}`);
    GOpenHMD.sleep(0.01);
}


print(`Version: ${GOpenHMD.version().to_string()}`)

var context = new GOpenHMD.Context();

devs_info(context);

var dev = context.open_device(0, null)

for(var i = 0; i < 300; i++){
    dev_quat_info(context, dev)
}
