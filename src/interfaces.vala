namespace GOpenHMD {

public enum DeviceDescriptionStringValue {
    // NOTE: Value assigned from `ohmd` turns to zero
    VENDOR = 0, // ohmd._string_value.VENDOR,
    PRODUCT = 1, // ohmd._string_value.PRODUCT,
    PATH = 2, // ohmd._string_value.PATH,
}

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

public interface IGetString<T> : GLib.Object {
    public abstract unowned string get_str (T type) throws Error;
}

public interface IGetInteger<T>: GLib.Object {
    public abstract int get_int (DeviceDescriptionIntValue type) throws Error;
}

public interface ISetInteger<T> : GLib.Object {
    public abstract void set_int (T type, int value) throws Error;
}

public interface IGetFloat<T> : GLib.Object {
    public abstract float get_float (T type) throws Error;
}

public interface ISetFloat<T> : GLib.Object {
    public abstract void set_float (T type, float value) throws Error;
}

public interface ISetData<T, P> : GLib.Object {
    public abstract void set_dat (T type, P data) throws Error;
}

public interface IList : GLib.Object {
    public abstract void get (int index) throws Error;
}

}
