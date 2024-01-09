/* openhmd.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "ohmd", gir_namespace = "openhmd", gir_version = "0.3.0", lower_case_cprefix = "ohmd_")]
namespace ohmd {
	[CCode (cheader_filename = "openhmd.h", has_type_id = false)]
	[Compact]
	public class _context {
	}
	[CCode (cheader_filename = "openhmd.h", has_type_id = false)]
	[Compact]
	public class _device {
	}
	[CCode (cheader_filename = "openhmd.h", has_type_id = false)]
	[Compact]
	public class _device_settings {
	}
	[CCode (cheader_filename = "openhmd.h", cprefix = "OHMD_", has_type_id = false)]
	public enum _control_hint {
		GENERIC,
		TRIGGER,
		TRIGGER_CLICK,
		SQUEEZE,
		MENU,
		HOME,
		ANALOG_X,
		ANALOG_Y,
		ANALOG_PRESS,
		BUTTON_A,
		BUTTON_B,
		BUTTON_X,
		BUTTON_Y,
		VOLUME_PLUS,
		VOLUME_MINUS,
		MIC_MUTE
	}
	[CCode (cheader_filename = "openhmd.h", cprefix = "OHMD_", has_type_id = false)]
	public enum _control_type {
		DIGITAL,
		ANALOG
	}
	[CCode (cheader_filename = "openhmd.h", cprefix = "OHMD_DRIVER_", has_type_id = false)]
	public enum _data_value {
		DATA,
		PROPERTIES
	}
	[CCode (cheader_filename = "openhmd.h", cprefix = "OHMD_DEVICE_CLASS_", has_type_id = false)]
	public enum _device_class {
		HMD,
		CONTROLLER,
		GENERIC_TRACKER
	}
	[CCode (cheader_filename = "openhmd.h", cprefix = "OHMD_DEVICE_FLAGS_", has_type_id = false)]
	public enum _device_flags {
		NULL_DEVICE,
		POSITIONAL_TRACKING,
		ROTATIONAL_TRACKING,
		LEFT_CONTROLLER,
		RIGHT_CONTROLLER
	}
	[CCode (cheader_filename = "openhmd.h", cprefix = "OHMD_", has_type_id = false)]
	public enum _float_value {
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
		CONTROLS_STATE
	}
	[CCode (cheader_filename = "openhmd.h", cprefix = "OHMD_IDS_AUTOMATIC_", has_type_id = false)]
	public enum _int_settings {
		[CCode (cname = "OHMD_IDS_AUTOMATIC_UPDATE")]
		IDS_AUTOMATIC_UPDATE
	}
	[CCode (cheader_filename = "openhmd.h", cprefix = "OHMD_", has_type_id = false)]
	public enum _int_value {
		SCREEN_HORIZONTAL_RESOLUTION,
		SCREEN_VERTICAL_RESOLUTION,
		DEVICE_CLASS,
		DEVICE_FLAGS,
		CONTROL_COUNT,
		CONTROLS_HINTS,
		CONTROLS_TYPES
	}
	[CCode (cheader_filename = "openhmd.h", cprefix = "OHMD_S_", has_type_id = false)]
	public enum _status {
		OK,
		UNKNOWN_ERROR,
		INVALID_PARAMETER,
		UNSUPPORTED,
		INVALID_OPERATION,
		USER_RESERVED
	}
	[CCode (cheader_filename = "openhmd.h", cprefix = "OHMD_", has_type_id = false)]
	public enum _string_description {
		GLSL_DISTORTION_VERT_SRC,
		GLSL_DISTORTION_FRAG_SRC,
		GLSL_330_DISTORTION_VERT_SRC,
		GLSL_330_DISTORTION_FRAG_SRC,
		GLSL_ES_DISTORTION_VERT_SRC,
		GLSL_ES_DISTORTION_FRAG_SRC
	}
	[CCode (cheader_filename = "openhmd.h", cprefix = "OHMD_", has_type_id = false)]
	public enum _string_value {
		VENDOR,
		PRODUCT,
		PATH
	}
	[CCode (cheader_filename = "openhmd.h", cname = "OHMD_STR_SIZE")]
	public const int STR_SIZE;
	[CCode (cheader_filename = "openhmd.h")]
	public static int close_device (ohmd._device device);
	[CCode (cheader_filename = "openhmd.h")]
	public static unowned ohmd._context? ctx_create ();
	[CCode (cheader_filename = "openhmd.h")]
	public static void ctx_destroy (ohmd._context ctx);
	[CCode (cheader_filename = "openhmd.h")]
	public static unowned string ctx_get_error (ohmd._context ctx);
	[CCode (cheader_filename = "openhmd.h")]
	public static int ctx_probe (ohmd._context ctx);
	[CCode (cheader_filename = "openhmd.h")]
	public static void ctx_update (ohmd._context ctx);
	[CCode (cheader_filename = "openhmd.h")]
	public static int device_getf (ohmd._device device, ohmd._float_value type, float* @out);
	[CCode (cheader_filename = "openhmd.h")]
	public static int device_geti (ohmd._device device, ohmd._int_value type, int* @out);
	[CCode (cheader_filename = "openhmd.h")]
	public static int device_set_data (ohmd._device device, ohmd._data_value type, void* @in);
	[CCode (cheader_filename = "openhmd.h")]
	public static int device_setf (ohmd._device device, ohmd._float_value type, ref float @in);
	[CCode (cheader_filename = "openhmd.h")]
	public static int device_seti (ohmd._device device, ohmd._int_value type, int @in);
	[CCode (cheader_filename = "openhmd.h")]
	public static unowned ohmd._device_settings? device_settings_create (ohmd._context ctx);
	[CCode (cheader_filename = "openhmd.h")]
	public static void device_settings_destroy (ohmd._device_settings settings);
	[CCode (cheader_filename = "openhmd.h")]
	public static ohmd._status device_settings_seti (ohmd._device_settings settings, ohmd._int_settings key, int val);
	[CCode (cheader_filename = "openhmd.h")]
	public static void get_version (out int major, out int minor, out int patch);
	[CCode (cheader_filename = "openhmd.h")]
	public static int gets (ohmd._string_description type, out string @out);
	[CCode (cheader_filename = "openhmd.h")]
	public static int list_geti (ohmd._context ctx, int index, ohmd._int_value type, int* @out);
	[CCode (cheader_filename = "openhmd.h")]
	public static unowned string list_gets (ohmd._context ctx, int index, ohmd._string_value type);
	[CCode (cheader_filename = "openhmd.h")]
	public static unowned ohmd._device list_open_device (ohmd._context ctx, int index);
	[CCode (cheader_filename = "openhmd.h")]
	public static unowned ohmd._device list_open_device_s (ohmd._context ctx, int index, ohmd._device_settings settings);
	[CCode (cheader_filename = "openhmd.h")]
	public static ohmd._status require_version (int major, int minor, int patch);
	[CCode (cheader_filename = "openhmd.h")]
	public static void sleep (double time);
}
