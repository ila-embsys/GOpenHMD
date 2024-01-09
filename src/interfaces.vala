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
    ROTATION_QUAT,
    LEFT_EYE_GL_MODELVIEW_MATRIX,
    RIGHT_EYE_GL_MODELVIEW_MATRIX,
    LEFT_EYE_GL_PROJECTION_MATRIX,
    RIGHT_EYE_GL_PROJECTION_MATRIX,
    POSITION_VECTOR,
    SCREEN_HORIZONTAL_SIZE,
    SCREEN_VERTICAL_SIZE,
    LENS_HORIZONTAL_SEPARATION,
    LENS_VERTICAL_POSITION,
    LEFT_EYE_FOV,
    LEFT_EYE_ASPECT_RATIO,
    RIGHT_EYE_FOV,
    RIGHT_EYE_ASPECT_RATIO,
    EYE_IPD,
    PROJECTION_ZFAR,
    PROJECTION_ZNEAR,
    DISTORTION_K,
    EXTERNAL_SENSOR_FUSION,
    UNIVERSAL_DISTORTION_K,
    UNIVERSAL_ABERRATION_K,
    CONTROLS_STATE,
}

public enum DataValue {
    DATA,
    PROPERTIES
}

public interface IGetString<T> : GLib.Object {
    public abstract unowned string get_str(T type) throws Error;
}

public interface IGetInteger<T> : GLib.Object {
    public abstract int get_int(T type) throws Error;
}

public interface ISetInteger<T> : GLib.Object {
    public abstract void set_int(T type, int value) throws Error;
}

public interface IGetFloat<T> : GLib.Object {
    public abstract float get_float(T type) throws Error;
}

public interface ISetFloat<T> : GLib.Object {
    public abstract void set_float(T type, float value) throws Error;
}

public interface ISetData<T, P> : GLib.Object {
    public abstract void set_dat(T type, P data) throws Error;
}

public interface IList : GLib.Object {
    public abstract void get(int index) throws Error;
}
    
}
