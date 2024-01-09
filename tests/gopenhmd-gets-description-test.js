#!/usr/bin/gjs

const GOpenHMD = imports.gi.GOpenHMD;

function main() {
    print("\n############### GLSL_DISTORTION_VERT_SRC ###############\n");
    var glsl_distortion_vert = GOpenHMD.gets(GOpenHMD.StringDescription.GLSL_DISTORTION_VERT_SRC);
    print(glsl_distortion_vert);

    print("\n############### GLSL_DISTORTION_FRAG_SRC ###############\n");
    var glsl_distortion_frag = GOpenHMD.gets(GOpenHMD.StringDescription.GLSL_DISTORTION_FRAG_SRC);
    print(glsl_distortion_frag);

    print("\n############### GLSL_330_DISTORTION_VERT_SRC ###############\n");
    var glsl_330_distortion_frag = GOpenHMD.gets(GOpenHMD.StringDescription.GLSL_330_DISTORTION_VERT_SRC);
    print(glsl_330_distortion_frag);

    print("\n############### GLSL_DISTORTION_FRAG_SRC ###############\n");
    var glsl_330_distortion_frag = GOpenHMD.gets(GOpenHMD.StringDescription.GLSL_DISTORTION_FRAG_SRC);
    print(glsl_330_distortion_frag);

    print("\n############### GLSL_ES_DISTORTION_VERT_SRC ###############\n");
    var glsl_es_distortion_frag = GOpenHMD.gets(GOpenHMD.StringDescription.GLSL_ES_DISTORTION_VERT_SRC);
    print(glsl_es_distortion_frag);

    print("\n############### GLSL_ES_DISTORTION_FRAG_SRC ###############\n");
    var glsl_es_distortion_frag = GOpenHMD.gets(GOpenHMD.StringDescription.GLSL_ES_DISTORTION_FRAG_SRC);
    print(glsl_es_distortion_frag);
}

main();
