namespace GOpenHMD {

public enum DeviceDescriptionIntValue {
    // NOTE: Value assigned from `ohmd` turns to zero
    SCREEN_HORIZONTAL_RESOLUTION = 0, // ohmd._int_value.SCREEN_HORIZONTAL_RESOLUTION
    SCREEN_VERTICAL_RESOLUTION = 1, // ohmd._int_value.SCREEN_VERTICAL_RESOLUTION
    DEVICE_CLASS = 2, // ohmd._int_value.DEVICE_CLASS
    DEVICE_FLAGS = 3, // ohmd._int_value.DEVICE_FLAGS
    CONTROL_COUNT = 4, // ohmd._int_value.CONTROL_COUNT
    CONTROLS_HINTS = 5, // ohmd._int_value.CONTROLS_HINTS
    CONTROLS_TYPES = 6, // ohmd._int_value.CONTROLS_TYPES
}

public enum StringDescription {
    // NOTE: Value assigned from `ohmd` turns to zero
    GLSL_DISTORTION_VERT_SRC = 0, // ohmd._string_description.GLSL_DISTORTION_VERT_SRC
    GLSL_DISTORTION_FRAG_SRC = 1, // ohmd._string_description.GLSL_DISTORTION_FRAG_SRC
    GLSL_330_DISTORTION_VERT_SRC = 2, // ohmd._string_description.GLSL_330_DISTORTION_VERT_SRC
    GLSL_330_DISTORTION_FRAG_SRC = 3, // ohmd._string_description.GLSL_330_DISTORTION_FRAG_SRC
    GLSL_ES_DISTORTION_VERT_SRC = 4, // ohmd._string_description.GLSL_ES_DISTORTION_VERT_SRC
    GLSL_ES_DISTORTION_FRAG_SRC = 5, // ohmd._string_description.GLSL_ES_DISTORTION_FRAG_SRC
}

public enum IntSettings {
    IDS_AUTOMATIC_UPDATE = 0,
}

public enum FloatValue {
    ROTATION_QUAT = 1,
    LEFT_EYE_GL_MODELVIEW_MATRIX = 2,
    RIGHT_EYE_GL_MODELVIEW_MATRIX = 3,
    LEFT_EYE_GL_PROJECTION_MATRIX = 4,
    RIGHT_EYE_GL_PROJECTION_MATRIX = 5,
    POSITION_VECTOR = 6,
    SCREEN_HORIZONTAL_SIZE = 7,
    SCREEN_VERTICAL_SIZE = 8,
    LENS_HORIZONTAL_SEPARATION = 9,
    LENS_VERTICAL_POSITION = 10,
    LEFT_EYE_FOV = 11,
    LEFT_EYE_ASPECT_RATIO = 12,
    RIGHT_EYE_FOV = 13,
    RIGHT_EYE_ASPECT_RATIO = 14,
    EYE_IPD = 15,
    PROJECTION_ZFAR = 16,
    PROJECTION_ZNEAR = 17,
    DISTORTION_K = 18,
    EXTERNAL_SENSOR_FUSION = 19,
    UNIVERSAL_DISTORTION_K = 20,
    UNIVERSAL_ABERRATION_K = 21,
    CONTROLS_STATE = 22,
}

public enum DataValue {
    DATA,
    PROPERTIES
}

public interface IDeviceDescription : Object {
    public abstract string vendor { get; }
    public abstract string product { get; }
    public abstract string path { get; }

    public abstract int screen_horizontal_resolution () throws Error;
    public abstract int screen_vertical_resolution () throws Error;

    public abstract int device_class () throws Error;
    public abstract int device_flags () throws Error;

    public abstract int control_count () throws Error;
    public abstract int[] control_hints () throws Error;
    public abstract int[] control_types () throws Error;
}

public struct Quat {
    public float x;
    public float y;
    public float z;
    public float w;
}

public struct Position {
    public float x;
    public float y;
    public float z;
    public float w;
}

public interface IDevice : Object {

    public abstract Quat rotation_quat () throws Error;

    public abstract float[] left_eye_gl_modelview_matrix () throws Error;
    public abstract float[] right_eye_gl_modelview_matrix () throws Error;

    public abstract float[] left_eye_gl_projection_matrix () throws Error;
    public abstract float[] right_eye_gl_projection_matrix () throws Error;

    public abstract Position position_vector () throws Error;

    public abstract float screen_horizontal_size () throws Error;
    public abstract float screen_vertical_size () throws Error;

    public abstract float lens_horizontal_separation () throws Error;
    public abstract float lens_vertical_position () throws Error;

    public abstract float left_eye_fov () throws Error;
    public abstract float left_eye_aspect_ratio () throws Error;

    public abstract float eye_ipd () throws Error;

    public abstract float projection_zfar () throws Error;
    public abstract float projection_znear () throws Error;

    public abstract float[] distortion_k () throws Error;

    public abstract float[] external_sensor_fusion () throws Error;

    public abstract float[] universal_distortion_k () throws Error;
    public abstract float[] universal_abberation_k () throws Error;

    public abstract float[] controls_state () throws Error;
}

}
